<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.Odbc" %>
<%@ Import Namespace="System.Configuration" %>

<script runat="server">

    string conStr = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;

    protected void ButtonAttend_Click(object sender, EventArgs e)
    {
        SaveAttendance(1, 0); // Normal=1, Invitation=0
    }

    protected void ButtonInvitation_Click(object sender, EventArgs e)
    {
        SaveAttendance(0, 1); // Normal=0, Invitation=1
    }

    void SaveAttendance(int normal, int invitation)
    {
        if (string.IsNullOrEmpty(HiddenFieldTraineeID.Value))
        {
            LabelResult.Text = "❌ No trainee selected!";
            LabelResult.ForeColor = System.Drawing.Color.Red;
            return;
        }

        try
        {
            using (OdbcConnection con = new OdbcConnection(conStr))
            {
                con.Open();

                // Get UserID from session (or use default)
                string userId = Session["UserID"] != null ? Session["UserID"].ToString() : "1";

                OdbcCommand cmd = new OdbcCommand(
                    @"INSERT INTO attendance
                      (traineeid, Date, Normal, Invitation, Notes, UserID, guestName, sauna, spa, jacuzzi)
                      VALUES (?, NOW(), ?, ?, ?, ?, ?, 0, 0, 0)", con);

                cmd.Parameters.AddWithValue("?", HiddenFieldTraineeID.Value);
                cmd.Parameters.AddWithValue("?", normal);
                cmd.Parameters.AddWithValue("?", invitation);
                cmd.Parameters.AddWithValue("?", "QR Code Scan");
                cmd.Parameters.AddWithValue("?", userId);
                cmd.Parameters.AddWithValue("?", "");

                cmd.ExecuteNonQuery();

                string attendType = (normal == 1) ? "Normal Attendance" : "Invitation";
                LabelResult.Text = "✅ " + attendType + " saved successfully!";
                LabelResult.ForeColor = System.Drawing.Color.Green;
            }
        }
        catch (Exception ex)
        {
            LabelResult.Text = "❌ Error: " + ex.Message;
            LabelResult.ForeColor = System.Drawing.Color.Red;
        }
    }

</script>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>QR Scanner - Attendance</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="https://unpkg.com/html5-qrcode"></script>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        
        #reader {
            width: 100%;
            max-width: 400px;
            margin: 20px auto;
            border: 3px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
        }
        
        .trainee-card {
            background: #f9f9f9;
            border: 2px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
            display: none;
        }
        
        .trainee-card.show {
            display: block;
        }
        
        .trainee-image {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .trainee-image img {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            border: 5px solid #ddd;
            object-fit: cover;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .trainee-info {
            background: white;
            padding: 15px;
            border-radius: 8px;
            margin: 10px 0;
        }
        
        .info-row {
            padding: 10px 0;
            border-bottom: 1px solid #eee;
            display: flex;
            align-items: center;
        }
        
        .info-row:last-child {
            border-bottom: none;
        }
        
        .info-label {
            font-weight: bold;
            color: #555;
            min-width: 150px;
        }
        
        .info-value {
            color: #333;
            flex: 1;
        }
        
        .status-badge {
            display: inline-block;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 14px;
        }
        
        .status-active {
            background: #4CAF50;
            color: white;
        }
        
        .status-expired {
            background: #f44336;
            color: white;
        }
        
        .status-soon {
            background: #FF9800;
            color: white;
        }
        
        .notes-box {
            background: #fff3cd;
            border: 1px solid #ffc107;
            border-radius: 5px;
            padding: 15px;
            margin: 15px 0;
            color: #856404;
        }
        
        .notes-box strong {
            color: #d39e00;
        }
        
        .button-group {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin: 20px 0;
            flex-wrap: wrap;
        }
        
        .btn {
            padding: 15px 30px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
            min-width: 150px;
        }
        
        .btn-attend {
            background: #4CAF50;
            color: white;
        }
        
        .btn-attend:hover {
            background: #45a049;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(76,175,80,0.3);
        }
        
        .btn-invitation {
            background: #2196F3;
            color: white;
        }
        
        .btn-invitation:hover {
            background: #0b7dda;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(33,150,243,0.3);
        }
        
        .result-message {
            text-align: center;
            padding: 15px;
            margin: 20px 0;
            border-radius: 5px;
            font-weight: bold;
            font-size: 16px;
        }
        
        .scan-instruction {
            text-align: center;
            color: #666;
            padding: 20px;
            background: #f0f0f0;
            border-radius: 5px;
            margin: 20px 0;
        }
        
        .scan-instruction h3 {
            color: #333;
            margin-top: 0;
        }
        
        @media print {
            .no-print {
                display: none !important;
            }
        }
    </style>
</head>
<body>
<form runat="server">

<div class="container">
    
    <h2>📱 QR Code Scanner - Attendance System</h2>
    
    <div class="scan-instruction no-print">
        <h3>📸 How to Use:</h3>
        <p>Point your camera at the trainee's QR code to scan</p>
    </div>
    
    <div id="reader" class="no-print"></div>
    
    <asp:HiddenField ID="HiddenFieldTraineeID" runat="server" />
    
    <div id="traineeCard" class="trainee-card">
        
        <div class="trainee-image">
            <img id="traineeImage" src="traineeImg/default.jpg" alt="Trainee Photo" />
        </div>
        
        <div class="trainee-info">
            <div class="info-row">
                <span class="info-label">👤 Name:</span>
                <span class="info-value" id="traineeName">-</span>
            </div>
            
            <div class="info-row">
                <span class="info-label">🆔 ID:</span>
                <span class="info-value" id="traineeId">-</span>
            </div>
            
            <div class="info-row">
                <span class="info-label">📱 Mobile:</span>
                <span class="info-value" id="traineeMobile">-</span>
            </div>
            
            <div class="info-row">
                <span class="info-label">📅 Subscription Status:</span>
                <span class="info-value" id="subscriptionStatus">-</span>
            </div>
            
            <div class="info-row">
                <span class="info-label">⏰ End Date:</span>
                <span class="info-value" id="endDate">-</span>
            </div>
            
            <div class="info-row">
                <span class="info-label">📊 Days Remaining:</span>
                <span class="info-value" id="daysRemaining">-</span>
            </div>
        </div>
        
        <div id="notesSection" style="display:none;">
            <div class="notes-box">
                <strong>📝 Notes:</strong>
                <div id="traineeNotes" style="margin-top: 10px;">-</div>
            </div>
        </div>
        
        <div class="button-group no-print">
            <asp:Button ID="ButtonAttend" runat="server"
                Text="✓ Normal Attendance"
                OnClick="ButtonAttend_Click"
                CssClass="btn btn-attend" />
            
            <asp:Button ID="ButtonInvitation" runat="server"
                Text="🎫 Invitation"
                OnClick="ButtonInvitation_Click"
                CssClass="btn btn-invitation" />
        </div>
        
        <div class="result-message">
            <asp:Label ID="LabelResult" runat="server"></asp:Label>
        </div>
        
    </div>

</div>

<script>

function onScanSuccess(decodedText, decodedResult) {
    
    // Stop scanner after successful scan
    html5QrcodeScanner.clear();
    
    // Parse QR data: ID|Name|Mobile|Notes
    var parts = decodedText.split('|');
    
    if (parts.length < 3) {
        alert('❌ Invalid QR Code format!');
        return;
    }
    
    var traineeId = parts[0];
    var traineeName = parts[1];
    var traineeMobile = parts[2];
    var traineeNotes = parts.length >= 4 ? parts[3] : '';
    
    // Set hidden field
    document.getElementById('<%= HiddenFieldTraineeID.ClientID %>').value = traineeId;
    
    // Display basic info
    document.getElementById('traineeId').innerText = traineeId;
    document.getElementById('traineeName').innerText = traineeName;
    document.getElementById('traineeMobile').innerText = traineeMobile;
    
    // Show/hide notes
    if (traineeNotes && traineeNotes.trim() !== '') {
        document.getElementById('traineeNotes').innerText = traineeNotes;
        document.getElementById('notesSection').style.display = 'block';
    } else {
        document.getElementById('notesSection').style.display = 'none';
    }
    
    // Load trainee image
    var imagePath = 'traineeImg/Trainee_' + traineeId + '.jpg';
    var imgElement = document.getElementById('traineeImage');
    
    // Try to load image, fallback to default
    var testImage = new Image();
    testImage.onload = function() {
        imgElement.src = imagePath;
    };
    testImage.onerror = function() {
        imgElement.src = 'traineeImg/default.jpg';
    };
    testImage.src = imagePath;
    
    // Fetch subscription status via AJAX
    fetchSubscriptionStatus(traineeId);
    
    // Show trainee card
    document.getElementById('traineeCard').classList.add('show');
}

function fetchSubscriptionStatus(traineeId) {
    
    // Create AJAX request
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'QRScanner.aspx/GetSubscriptionStatus', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            try {
                var data = JSON.parse(xhr.responseText);
                displaySubscriptionStatus(data);
            } catch(e) {
                // If JSON parsing fails, try simple response
                displaySimpleStatus(xhr.responseText);
            }
        }
    };
    
    xhr.send('traineeId=' + traineeId);
}

function displaySubscriptionStatus(data) {
    
    var statusElement = document.getElementById('subscriptionStatus');
    var endDateElement = document.getElementById('endDate');
    var daysElement = document.getElementById('daysRemaining');
    
    if (data.hasSubscription) {
        
        var badge = '<span class="status-badge status-' + data.statusClass + '">' + 
                    data.statusText + '</span>';
        
        statusElement.innerHTML = badge;
        endDateElement.innerText = data.endDate;
        daysElement.innerText = data.daysRemaining + ' days';
        
    } else {
        
        statusElement.innerHTML = '<span class="status-badge status-expired">❌ No Active Subscription</span>';
        endDateElement.innerText = 'N/A';
        daysElement.innerText = 'N/A';
    }
}

function displaySimpleStatus(response) {
    // Fallback for simple text response
    var lines = response.split('|');
    
    if (lines.length >= 3) {
        var statusText = lines[0];
        var endDate = lines[1];
        var daysRemaining = lines[2];
        
        var statusClass = 'expired';
        if (statusText.indexOf('Active') >= 0) statusClass = 'active';
        else if (statusText.indexOf('Soon') >= 0) statusClass = 'soon';
        
        var badge = '<span class="status-badge status-' + statusClass + '">' + statusText + '</span>';
        
        document.getElementById('subscriptionStatus').innerHTML = badge;
        document.getElementById('endDate').innerText = endDate;
        document.getElementById('daysRemaining').innerText = daysRemaining + ' days';
    }
}

// Initialize QR Scanner
var html5QrcodeScanner = new Html5QrcodeScanner(
    "reader",
    { 
        fps: 10, 
        qrbox: { width: 250, height: 250 },
        aspectRatio: 1.0
    }
);

html5QrcodeScanner.render(onScanSuccess);

</script>

</form>
</body>
</html>