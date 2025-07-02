<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewLeave.aspx.cs" Inherits="emp_mng_system.NewLeave" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Management System - New Leave</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            height: 100vh;
            background-color: #ECF0F1;
        }
        * { box-sizing: border-box; }

        .header {
            background-color: #293A4B;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 24px;
        }

        .main-container {
            display: flex;
            flex: 1;
        }
        .sidebar {
    width: 200px;
    background-color: #2C3E50;
    color: white;
    padding: 20px;
    text-align: center;
    position: fixed;
    height: 100vh;
    top: 60px; /* Set to below header */
    left: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    z-index: 999; /* Ensures sidebar is below the header */
}        

.sidebar .sidebar-button {
    display: block;
    background-color: #34495e;
    color: white;
    text-decoration: none;
    padding: 10px 15px;
    margin-bottom: 10px;
    border-radius: 5px;
    text-align: center;
    width: 100%;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

.sidebar .sidebar-button:hover {
    background-color: #1abc9c;
}



        .content {
            flex-grow: 1;
            margin-left: 220px;
            padding: 20px;
            background-color: #ECF0F1;
        }

        .content h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .container {
            width: 500px;
            margin: 20px auto;
            padding: 30px;
            background-color: #f8f8f8;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }

        .form-row {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="number"], input[type="date"], textarea, select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .error-message {
            color: red;
            font-size: 0.9em;
        }

        .buttons {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <!-- Header -->
        <div class="header">
            Deep Ltd. Company
        </div>

        <!-- Sidebar -->
        <div class="sidebar">
            <a class="sidebar-button" href="Dashboard.aspx" style="width: 90%">
                <asp:Image ID="Image4" runat="server" Height="37px" ImageUrl="~/Scripts/image/Home1.png" Width="42px" />
                <br /> Dashboard
            </a>
            <a class="sidebar-button" href="Employee.aspx" style="width: 90%">
                <asp:Image ID="Image6" runat="server" Height="37px" ImageUrl="~/Scripts/image/Employee1 (2).png" Width="42px" />
                <br /> Employee
            </a>
            <a class="sidebar-button" href="Department.aspx" style="width: 89%">
                <asp:Image ID="Image7" runat="server" Height="37px" ImageUrl="~/Scripts/image/Department1.png" Width="42px" />
                <br /> Department
            </a>
            <a class="sidebar-button" href="Salary.aspx" style="width: 90%">
                <asp:Image ID="Image8" runat="server" Height="37px" ImageUrl="~/Scripts/image/Salary1.png" Width="42px" />
                <br /> Salary
            </a>
            <a class="sidebar-button" href="Leave.aspx" style="width: 89%">
                <asp:Image ID="Image9" runat="server" Height="37px" ImageUrl="~/Scripts/image/Leave1.png" Width="42px" />
                <br /> Leave
            </a>
            <a class="sidebar-button" href="Report.aspx" style="width: 88%">
                <asp:Image ID="Image10" runat="server" Height="37px" ImageUrl="~/Scripts/image/Report.png" Width="42px" />
                <br /> Report
            </a>
            <a class="sidebar-button" href="AdminLogin.aspx" style="width: 88%">Logout</a>
        </div>

        <!-- Main Content -->
        <div class="content">
            <h2>Leave Application Form</h2>

            <div class="container">
                <!-- Message Label -->
                <div class="form-row">
                    <asp:Label ID="LblMessage" runat="server" ForeColor="Green"></asp:Label>
                </div>

                <!-- Employee ID -->
                <div class="form-row">
                    <label>Employee ID:</label>
                    <asp:TextBox ID="txtEmpID" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtEmpID" InitialValue="" ErrorMessage="Employee ID is required" CssClass="error-message" />
                </div>

                <!-- Leave Type -->
                <div class="form-row">
                    <label>Leave Type:</label>
                    <asp:DropDownList ID="ddlLeaveType" runat="server">
                        <asp:ListItem Text="--Select Leave Type--" />
                        <asp:ListItem Text="Sick Leave" />
                        <asp:ListItem Text="Casual Leave" />
                        <asp:ListItem Text="Earned Leave" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvLeaveType" runat="server" ControlToValidate="ddlLeaveType" InitialValue="--Select Leave Type--" ErrorMessage="Leave Type is required" CssClass="error-message" />
                </div>

                <!-- From Date -->
                <div class="form-row">
                    <label>From Date:</label>
                    <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date" />
                    <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" ControlToValidate="txtFromDate" ErrorMessage="From Date is required" CssClass="error-message" />
                </div>

                <!-- To Date -->
                <div class="form-row">
                    <label>To Date:</label>
                    <asp:TextBox ID="txtToDate" runat="server" TextMode="Date" />
                    <asp:RequiredFieldValidator ID="rfvToDate" runat="server" ControlToValidate="txtToDate" ErrorMessage="To Date is required" CssClass="error-message" />
                    <asp:CompareValidator ID="cvDate" runat="server" ControlToValidate="txtToDate" ControlToCompare="txtFromDate" Operator="GreaterThan" Type="Date" ErrorMessage="To Date must be later than From Date" CssClass="error-message" />
                </div>

                <!-- Total Days -->
                <div class="form-row">
                    <label>Total Days:</label>
                    <asp:TextBox ID="txtTotalDays" runat="server" ReadOnly="true" TextMode="Number" />
                </div>

                <!-- Reason -->
                <div class="form-row">
                    <label>Reason:</label>
                    <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Rows="3" Columns="40" />
                    <asp:RequiredFieldValidator ID="rfvReason" runat="server" ControlToValidate="txtReason" ErrorMessage="Reason is required" CssClass="error-message" />
                </div>

                <!-- Buttons -->
                <div class="buttons">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </div>

            </div>
        </div>
    </form>
</body>
</html>
