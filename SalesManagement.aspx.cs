using System;
using System.Data;
using System.Data.Odbc;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;

public partial class SalesManagement : Page
{
    private const string CACHE_KEY    = "SalesContacted";
    private const string PAGE_PASSWORD = "01033833457";
    private const string SESSION_KEY   = "SalesMgmt_Auth";

    private OdbcConnection GetConnection()
    {
        string cs = System.Configuration.ConfigurationManager
                         .ConnectionStrings["ConStr"].ConnectionString;
        return new OdbcConnection(cs);
    }

    private HashSet<int> GetContactedSet()
    {
        if (Application[CACHE_KEY] == null)
            Application[CACHE_KEY] = new HashSet<int>();
        return (HashSet<int>)Application[CACHE_KEY];
    }
    private void AddContacted(int id) { lock (Application) { GetContactedSet().Add(id); } }
    private bool IsContacted(int id)  { return GetContactedSet().Contains(id); }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[SESSION_KEY] == null || Session[SESSION_KEY].ToString() != "1")
        {
            PanelPassword.Visible = true;
            PanelMain.Visible     = false;
            return;
        }
        PanelPassword.Visible = false;
        PanelMain.Visible     = true;

        if (!IsPostBack)
            TextBoxDays.Text = "14";
    }

    protected void ButtonUnlock_Click(object sender, EventArgs e)
    {
        if (TextBoxPwd.Text.Trim() == PAGE_PASSWORD)
        {
            Session[SESSION_KEY]  = "1";
            PanelPassword.Visible = false;
            PanelMain.Visible     = true;
            TextBoxDays.Text      = "14";
        }
        else
        {
            LabelPwdError.Text = "Incorrect password. Please try again.";
        }
    }

    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        GridView1.PageIndex = 0;
        BindGrid();
    }

    protected void ButtonReset_Click(object sender, EventArgs e)
    {
        TextBoxDays.Text    = "14";
        TextBoxDaysMax.Text = "";
        TextBoxName.Text    = "";
        TextBoxMobile.Text  = "";
        RadioButtonListGender.SelectedValue = "-1";
        CheckBoxShowContacted.Checked       = false;
        DropDownSort.SelectedValue          = "DESC";
        GridView1.DataSource = null;
        GridView1.DataBind();
        PanelStats.Visible = false;
        LabelError.Text    = "";
    }

    protected void ButtonExportCSV_Click(object sender, EventArgs e)
    {
        DataTable dt = GetExpiredTrainees();
        if (dt == null || dt.Rows.Count == 0) { LabelError.Text = "No data to export."; return; }

        Response.Clear();
        Response.ContentType     = "text/csv";
        Response.ContentEncoding = Encoding.UTF8;
        Response.AddHeader("Content-Disposition",
            "attachment; filename=SalesExpired_" + DateTime.Now.ToString("yyyyMMdd") + ".csv");
        Response.BinaryWrite(Encoding.UTF8.GetPreamble());

        var sb = new StringBuilder();
        sb.AppendLine("ID,Name,Mobile,Package,End Date,Days Since Expiry,Contacted");
        foreach (DataRow row in dt.Rows)
        {
            sb.AppendFormat("{0},\"{1}\",{2},\"{3}\",{4},{5},{6}\n",
                row["TraineeID"], row["Name"], row["Mobile"], row["Package"],
                Convert.ToDateTime(row["EndDate"]).ToString("yyyy-MM-dd"),
                row["DaysSinceExpiry"], row["ContactedLabel"]);
        }
        Response.Write(sb.ToString());
        Response.End();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow) return;
        DataRowView drv  = (DataRowView)e.Row.DataItem;
        int         days = Convert.ToInt32(drv["DaysSinceExpiry"]);
        if      (days >= 60) e.Row.CssClass = "row-absent-high";
        else if (days >= 30) e.Row.CssClass = "row-absent-med";
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "MarkContacted")
        {
            AddContacted(Convert.ToInt32(e.CommandArgument));
            BindGrid();
        }
    }

    private void BindGrid()
    {
        DataTable dt = GetExpiredTrainees();
        if (dt == null) return;

        PanelStats.Visible   = true;
        LabelTotalCount.Text = dt.Rows.Count.ToString();

        int  contacted = 0;
        long totalDays = 0;
        foreach (DataRow row in dt.Rows)
        {
            if (row["ContactedLabel"].ToString() == "Done") contacted++;
            totalDays += Convert.ToInt32(row["DaysSinceExpiry"]);
        }
        LabelContactedCount.Text = contacted.ToString();
        LabelAvgAbsent.Text = dt.Rows.Count > 0
            ? Math.Round((double)totalDays / dt.Rows.Count, 1).ToString() : "0";

        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    private DataTable GetExpiredTrainees()
    {
        LabelError.Text = "";

        int daysMin;
        if (!int.TryParse(TextBoxDays.Text.Trim(), out daysMin) || daysMin < 1)
        {
            LabelError.Text = "Please enter a valid minimum number of days (greater than 0).";
            return null;
        }

        int  daysMax    = 0;
        bool hasMaxDays = false;
        string maxRaw   = TextBoxDaysMax.Text.Trim();
        if (!string.IsNullOrEmpty(maxRaw))
        {
            if (!int.TryParse(maxRaw, out daysMax) || daysMax < daysMin)
            {
                LabelError.Text = "Maximum days must be >= minimum days.";
                return null;
            }
            hasMaxDays = true;
        }

        string sortDir = (DropDownSort.SelectedValue == "ASC") ? "ASC" : "DESC";

        // ── FIX #1: Use subquery to get only the LATEST reservation per trainee ──
        // This prevents the same person appearing multiple times for old renewals.
        var sql = new StringBuilder();
        sql.Append(@"
            SELECT
                t.ID                                        AS TraineeID,
                t.Name,
                t.Mobile,
                COALESCE(pl.Name, '')                       AS Package,
                r.EndDate                                   AS EndDate,
                DATEDIFF(NOW(), r.EndDate)                  AS DaysSinceExpiry
            FROM reservation r
            INNER JOIN trainee   t  ON t.ID  = r.TraineeID
            LEFT  JOIN pricelist pl ON pl.ID = r.PriceListID
            WHERE r.EndDate < CURDATE()
              AND r.EndDate = (
                    SELECT MAX(r2.EndDate)
                    FROM reservation r2
                    WHERE r2.TraineeID = t.ID
              )
        ");

        string gender = RadioButtonListGender.SelectedValue;
        if (gender == "0" || gender == "1")
            sql.Append(" AND t.male = " + gender);

        if (!string.IsNullOrWhiteSpace(TextBoxName.Text))
            sql.Append(" AND t.Name LIKE '%" + Esc(TextBoxName.Text.Trim()) + "%'");

        if (!string.IsNullOrWhiteSpace(TextBoxMobile.Text))
            sql.Append(" AND t.Mobile LIKE '%" + Esc(TextBoxMobile.Text.Trim()) + "%'");

        // HAVING with min/max days
        sql.Append(" HAVING DaysSinceExpiry >= " + daysMin);
        if (hasMaxDays)
            sql.Append(" AND DaysSinceExpiry <= " + daysMax);

        // Exclude those who renewed
        sql.Append(@"
            AND t.ID NOT IN (
                SELECT DISTINCT TraineeID FROM reservation
                WHERE EndDate >= CURDATE()
            )
        ");

        sql.Append(" ORDER BY DaysSinceExpiry " + sortDir);

        var dt = new DataTable();
        try
        {
            using (OdbcConnection con = GetConnection())
            {
                con.Open();
                using (OdbcDataAdapter da = new OdbcDataAdapter(sql.ToString(), con))
                    da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            LabelError.Text = "Database error: " + ex.Message;
            return null;
        }

        dt.Columns.Add("ContactedLabel", typeof(string));
        foreach (DataRow row in dt.Rows)
            row["ContactedLabel"] = IsContacted(Convert.ToInt32(row["TraineeID"])) ? "Done" : "-";

        if (!CheckBoxShowContacted.Checked)
            for (int i = dt.Rows.Count - 1; i >= 0; i--)
                if (dt.Rows[i]["ContactedLabel"].ToString() == "Done")
                    dt.Rows.RemoveAt(i);

        return dt;
    }

    private static string Esc(string s)
    {
        if (string.IsNullOrEmpty(s)) return "";
        return s.Replace("'", "''").Replace("\\", "\\\\");
    }
}
