<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.Odbc" %>
<%@ Import Namespace="System.Configuration" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "text/plain";
        
        string traineeId = Request.Form["traineeId"];
        
        if (string.IsNullOrEmpty(traineeId))
        {
            Response.Write("No Subscription|N/A|0");
            Response.End();
            return;
        }
        
        string conStr = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
        
        using (OdbcConnection con = new OdbcConnection(conStr))
        {
            con.Open();
            
            // Get latest active subscription
            OdbcCommand cmd = new OdbcCommand(@"
                SELECT EndDate, freezTo 
                FROM reservation 
                WHERE TraineeID = ? 
                AND EndDate >= CURDATE()
                ORDER BY EndDate DESC 
                LIMIT 1", con);
            
            cmd.Parameters.AddWithValue("?", traineeId);
            
            OdbcDataReader dr = cmd.ExecuteReader();
            
            if (dr.Read())
            {
                DateTime endDate = Convert.ToDateTime(dr["EndDate"]);
                DateTime? freezTo = dr["freezTo"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(dr["freezTo"]);
                
                dr.Close();
                
                // Calculate days remaining
                TimeSpan timeRemaining = endDate - DateTime.Now;
                int daysRemaining = (int)timeRemaining.TotalDays;
                
                string statusText = "";
                
                if (daysRemaining < 0)
                {
                    statusText = "❌ Expired";
                }
                else if (daysRemaining <= 7)
                {
                    statusText = "⚠️ Expires Soon";
                }
                else if (freezTo.HasValue && freezTo.Value > DateTime.Now)
                {
                    statusText = "🧊 Frozen until " + freezTo.Value.ToString("yyyy-MM-dd");
                }
                else
                {
                    statusText = "✅ Active";
                }
                
                // Return: Status|EndDate|DaysRemaining
                Response.Write(statusText + "|" + 
                              endDate.ToString("yyyy-MM-dd") + "|" + 
                              daysRemaining);
            }
            else
            {
                dr.Close();
                Response.Write("❌ No Active Subscription|N/A|0");
            }
        }
        
        Response.End();
    }

</script>