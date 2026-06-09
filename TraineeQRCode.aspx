<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.Odbc" %>
<%@ Import Namespace="System.Configuration" %>

<script runat="server">

    string conStr = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LoadTrainees();
    }

    void LoadTrainees()
    {
        using (OdbcConnection con = new OdbcConnection(conStr))
        {
            con.Open();

            OdbcCommand cmd = new OdbcCommand(
                "SELECT id, name FROM trainee ORDER BY name LIMIT 100", con);

            DropDownListTrainee.DataSource = cmd.ExecuteReader();
            DropDownListTrainee.DataTextField = "name";
            DropDownListTrainee.DataValueField = "id";
            DropDownListTrainee.DataBind();

            DropDownListTrainee.Items.Insert(0, new ListItem("-- Choose Trainee --", "0"));
        }
    }

    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        using (OdbcConnection con = new OdbcConnection(conStr))
        {
            con.Open();

            OdbcCommand cmd = new OdbcCommand(
                @"SELECT id, name 
                  FROM trainee 
                  WHERE name LIKE ? OR mobile LIKE ?
                  ORDER BY name
                  LIMIT 100", con);

            string search = "%" + TextBoxSearch.Text + "%";
            cmd.Parameters.AddWithValue("?", search);
            cmd.Parameters.AddWithValue("?", search);

            OdbcDataReader dr = cmd.ExecuteReader();

            DropDownListTrainee.DataSource = dr;
            DropDownListTrainee.DataTextField = "name";
            DropDownListTrainee.DataValueField = "id";
            DropDownListTrainee.DataBind();

            DropDownListTrainee.Items.Insert(0, new ListItem("-- Choose Trainee --", "0"));
        }
    }

    protected void ButtonGenerate_Click(object sender, EventArgs e)
    {
        GenerateQRCode();
    }

    void GenerateQRCode()
    {
        if (DropDownListTrainee.SelectedValue == "0")
        {
            LabelError.Text = "❌ Please select a trainee first!";
            return;
        }

        using (OdbcConnection con = new OdbcConnection(conStr))
        {
            con.Open();

            OdbcCommand cmd = new OdbcCommand(
                "SELECT id, name, mobile, notes, Image FROM trainee WHERE id = ?", con);

            cmd.Parameters.AddWithValue("?", DropDownListTrainee.SelectedValue);

            OdbcDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                string id = dr["id"].ToString();
                string name = dr["name"].ToString();
                string mobile = dr["mobile"].ToString();
                string notes = dr["notes"] == DBNull.Value ? "" : dr["notes"].ToString();
                string image = dr["Image"] == DBNull.Value ? "" : dr["Image"].ToString();

                dr.Close();

                // Display trainee info
                LabelName.Text = name;
                LabelID.Text = "ID: " + id;
                LabelMobile.Text = "Mobile: " + mobile;
                
                if (!string.IsNullOrEmpty(notes))
                {
                    LabelNotes.Text = "Notes: " + notes;
                    LabelNotes.Visible = true;
                }
                else
                {
                    LabelNotes.Visible = false;
                }

                // Set trainee image
                if (!string.IsNullOrEmpty(image))
                {
                    ImageTrainee.ImageUrl = "traineeImg/" + image;
                }
                else
                {
                    ImageTrainee.ImageUrl = "traineeImg/Trainee_" + id + ".jpg";
                }
                ImageTrainee.Visible = true;

                // Get subscription status
                OdbcCommand cmdSub = new OdbcCommand(@"
                    SELECT EndDate 
                    FROM reservation 
                    WHERE TraineeID = ? 
                    AND EndDate >= CURDATE()
                    ORDER BY EndDate DESC 
                    LIMIT 1", con);
                
                cmdSub.Parameters.AddWithValue("?", id);
                object endDateObj = cmdSub.ExecuteScalar();
                
                if (endDateObj != null)
                {
                    DateTime endDate = Convert.ToDateTime(endDateObj);
                    TimeSpan remaining = endDate - DateTime.Now;
                    int days = (int)remaining.TotalDays;
                    
                    string status = days > 7 ? "✅ Active" : 
                                   days > 0 ? "⚠️ Expires Soon (" + days + " days)" : 
                                   "❌ Expired";
                    
                    LabelSubscription.Text = "Subscription: " + status + " (Until: " + endDate.ToString("yyyy-MM-dd") + ")";
                    LabelSubscription.ForeColor = days > 7 ? System.Drawing.Color.Green : 
                                                  days > 0 ? System.Drawing.Color.Orange : 
                                                  System.Drawing.Color.Red;
                }
                else
                {
                    LabelSubscription.Text = "Subscription: ❌ No Active Subscription";
                    LabelSubscription.ForeColor = System.Drawing.Color.Red;
                }
                LabelSubscription.Visible = true;

                // Generate QR Code
                string qrText = id + "|" + name + "|" + mobile + "|" + notes;
                string qrUrl = "https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=" + 
                              Server.UrlEncode(qrText);

                ImageQR.ImageUrl = qrUrl;
                ImageQR.Visible = true;

                HyperLinkDownload.NavigateUrl = qrUrl;
                HyperLinkDownload.Visible = true;

                QRCardPanel.Visible = true;
                LabelError.Text = "";
            }
            else
            {
                LabelError.Text = "❌ Trainee not found!";
            }
        }
    }

    protected void ButtonPrint_Click(object sender, EventArgs e)
    {
        // Print functionality handled by JavaScript
    }

</script>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Trainee QR Code Generator</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }
        
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }
        
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
        }
        
        .search-section {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        
        .form-row {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
            flex-wrap: wrap;
            align-items: center;
        }
        
        input[type="text"], select {
            flex: 1;
            padding: 12px;
            font-size: 14px;
            border: 2px solid #ddd;
            border-radius: 5px;
            min-width: 200px;
        }
        
        input[type="text"]:focus, select:focus {
            outline: none;
            border-color: #667eea;
        }
        
        .btn {
            padding: 12px 30px;
            font-size: 14px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .btn-search {
            background: #667eea;
            color: white;
        }
        
        .btn-search:hover {
            background: #5568d3;
            transform: translateY(-2px);
        }
        
        .btn-generate {
            background: #28a745;
            color: white;
        }
        
        .btn-generate:hover {
            background: #218838;
            transform: translateY(-2px);
        }
        
        .btn-print {
            background: #17a2b8;
            color: white;
        }
        
        .btn-print:hover {
            background: #138496;
        }
        
        .qr-card {
            background: white;
            border: 3px solid #667eea;
            border-radius: 15px;
            padding: 30px;
            margin-top: 30px;
            box-shadow: 0 5px 20px rgba(102,126,234,0.2);
        }
        
        .qr-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .trainee-image-container {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .trainee-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 5px solid #667eea;
            object-fit: cover;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .trainee-details {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
        }
        
        .detail-row {
            padding: 10px 0;
            border-bottom: 1px solid #dee2e6;
            font-size: 16px;
        }
        
        .detail-row:last-child {
            border-bottom: none;
        }
        
        .detail-label {
            font-weight: bold;
            color: #495057;
            display: inline-block;
            min-width: 120px;
        }
        
        .detail-value {
            color: #212529;
        }
        
        .qr-code-container {
            text-align: center;
            margin: 30px 0;
            padding: 20px;
            background: white;
            border-radius: 10px;
        }
        
        .qr-code-container img {
            border: 5px solid #667eea;
            border-radius: 10px;
            padding: 10px;
            background: white;
        }
        
        .notes-box {
            background: #fff3cd;
            border: 2px solid #ffc107;
            border-radius: 8px;
            padding: 15px;
            margin: 15px 0;
        }
        
        .notes-box strong {
            color: #856404;
        }
        
        .subscription-box {
            padding: 15px;
            border-radius: 8px;
            margin: 15px 0;
            font-weight: bold;
            text-align: center;
        }
        
        .action-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 20px;
            flex-wrap: wrap;
        }
        
        .error-message {
            color: #dc3545;
            text-align: center;
            padding: 15px;
            background: #f8d7da;
            border: 2px solid #f5c6cb;
            border-radius: 5px;
            margin: 15px 0;
            font-weight: bold;
        }
        
        .download-link {
            display: inline-block;
            padding: 10px 20px;
            background: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 10px;
            transition: all 0.3s;
        }
        
        .download-link:hover {
            background: #5a6268;
            transform: translateY(-2px);
        }
        
        @media print {
            body {
                background: white;
            }
            .no-print {
                display: none !important;
            }
            .container {
                box-shadow: none;
            }
            .qr-card {
                border: 2px solid #333;
                page-break-inside: avoid;
            }
        }
    </style>
</head>
<body>
<form runat="server">

<div class="container">
    
    <h2>🎫 Trainee QR Code Generator</h2>
    
    <div class="search-section no-print">
        <div class="form-row">
            <asp:TextBox ID="TextBoxSearch" runat="server"
                placeholder="🔍 Search by name or mobile..." />
            
            <asp:Button ID="ButtonSearch" runat="server"
                Text="Search"
                OnClick="ButtonSearch_Click"
                CssClass="btn btn-search" />
        </div>
        
        <div class="form-row">
            <asp:DropDownList ID="DropDownListTrainee" runat="server" />
            
            <asp:Button ID="ButtonGenerate" runat="server"
                Text="Generate QR Code"
                OnClick="ButtonGenerate_Click"
                CssClass="btn btn-generate" />
        </div>
    </div>
    
    <asp:Label ID="LabelError" runat="server" CssClass="error-message" Visible="false" />
    
    <asp:Panel ID="QRCardPanel" runat="server" Visible="false" CssClass="qr-card">
        
        <div class="qr-header">
            <h3 style="color: #667eea; margin: 0;">MY-GYM IT System</h3>
            <p style="color: #6c757d; margin: 5px 0;">Trainee QR Code Card</p>
        </div>
        
        <div class="trainee-image-container">
            <asp:Image ID="ImageTrainee" runat="server" CssClass="trainee-image" 
                onerror="this.src='traineeImg/default.jpg'" />
        </div>
        
        <div class="trainee-details">
            <div class="detail-row">
                <span class="detail-label">👤 Name:</span>
                <span class="detail-value">
                    <asp:Label ID="LabelName" runat="server" Font-Bold="true" />
                </span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">🆔 ID:</span>
                <span class="detail-value">
                    <asp:Label ID="LabelID" runat="server" />
                </span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">📱 Mobile:</span>
                <span class="detail-value">
                    <asp:Label ID="LabelMobile" runat="server" />
                </span>
            </div>
        </div>
        
        <div class="subscription-box">
            <asp:Label ID="LabelSubscription" runat="server" Visible="false" />
        </div>
        
        <asp:Label ID="LabelNotes" runat="server" CssClass="notes-box" Visible="false" />
        
        <div class="qr-code-container">
            <h4 style="color: #495057;">Scan this QR Code for quick attendance:</h4>
            <asp:Image ID="ImageQR" runat="server" Visible="false" />
        </div>
        
        <div class="action-buttons no-print">
            <asp:Button ID="ButtonPrint" runat="server"
                Text="🖨️ Print Card"
                OnClientClick="window.print(); return false;"
                CssClass="btn btn-print" />
            
            <asp:HyperLink ID="HyperLinkDownload" runat="server"
                Text="⬇️ Download QR Code"
                Target="_blank"
                CssClass="download-link"
                Visible="false" />
        </div>
        
        <div style="text-align: center; margin-top: 30px; color: #6c757d; font-size: 12px;">
            <p>© 2026 MY-GYM IT System | Designed by Eng. Haitham</p>
        </div>
        
    </asp:Panel>

</div>

</form>
</body>
</html>