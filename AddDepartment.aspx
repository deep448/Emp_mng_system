<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDepartment.aspx.cs" Inherits="emp_mng_system.AddDepartment" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Department</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        .header {
            width: 100%;
            background-color: #293A4B;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 24px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        
                .sidebar {
            width: 200px;
            background-color: #2C3E50;
            color: white;
            padding: 20px;
            text-align: center;
            position: fixed;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
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

        .main-content {
            margin-left: 200px;
            margin-top: 60px;
            padding: 40px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: calc(100vh - 60px);
        }

        .container {
            width: 100%;
            max-width: 700px;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
        }

        .btn-save, .btn-cancel {
            width: 48%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-save {
            background-color: #2ecc71;
            color: white;
        }

        .btn-cancel {
            background-color: #e74c3c;
            color: white;
        }

        .validation {
            color: red;
            font-size: 12px;
            margin-top: 5px;
            display: block;
        }

        .auto-style1 {
            width: 121%;
            background-color: #293A4B;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 24px;
            position: fixed;
            top: 0;
            left: -142px;
            z-index: 1000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Header -->
        <div class="auto-style1">Deep Ltd. Company</div>

        <!-- Sidebar -->
        <div class="sidebar">
            <a class="sidebar-button" href="Dashboard.aspx">
                <asp:Image ID="Image4" runat="server" Height="37px" ImageUrl="~/Scripts/image/Home1.png" Width="42px" />
                <br />Dashboard</a>

            <a class="sidebar-button" href="Employee.aspx">
                <asp:Image ID="Image6" runat="server" Height="37px" ImageUrl="~/Scripts/image/Employee1 (2).png" Width="42px" />
                <br />Employee</a>

            <a class="sidebar-button" href="Department.aspx">
                <asp:Image ID="Image7" runat="server" Height="37px" ImageUrl="~/Scripts/image/Department1.png" Width="42px" />
                <br />Department</a>

            <a class="sidebar-button" href="Salary.aspx">
                <asp:Image ID="Image8" runat="server" Height="37px" ImageUrl="~/Scripts/image/Salary1.png" Width="42px" />
                <br />Salary</a>

            <a class="sidebar-button" href="Leave.aspx">
                <asp:Image ID="Image9" runat="server" Height="37px" ImageUrl="~/Scripts/image/Leave1.png" Width="42px" />
                <br />Leave</a>

            <a class="sidebar-button" href="Report.aspx">
                <asp:Image ID="Image10" runat="server" Height="37px" ImageUrl="~/Scripts/image/Report.png" Width="42px" />
                <br />Report</a>

            <a class="sidebar-button" href="AdminLogin.aspx">Logout</a>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="container">
                <h2>Add Department</h2>
                <asp:Label ID="lblStatus" runat="server" ForeColor="Green" Font-Bold="True" />

                <!-- Dept Name -->
                <div class="form-group">
                    <label for="TxtDeptName">Department Name:</label>
                    <asp:TextBox ID="TxtDeptName" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtDeptName" runat="server" ErrorMessage="Department Name is required." CssClass="validation" />
                </div>

                <!-- Dept Code -->
                <div class="form-group">
                    <label for="TxtDeptCode">Department Code:</label>
                    <asp:TextBox ID="TxtDeptCode" runat="server" />
                    <asp:RequiredFieldValidator ControlToValidate="TxtDeptCode" runat="server" ErrorMessage="Department Code is required." CssClass="validation" />
                </div>

                <!-- Dept Head -->
                <div class="form-group">
                    <label for="TxtDeptHead">Department Head:</label>
                    <asp:TextBox ID="TxtDeptHead" runat="server" />
                    <asp:RequiredFieldValidator ControlToValidate="TxtDeptHead" runat="server" ErrorMessage="Department Head is required." CssClass="validation" />
                </div>

                <!-- Contact No -->
                <div class="form-group">
                    <label for="TxtContactNo">Contact Number:</label>
                    <asp:TextBox ID="TxtContactNo" runat="server" />
                    <asp:RequiredFieldValidator ControlToValidate="TxtContactNo" runat="server" ErrorMessage="Contact Number is required." CssClass="validation" />
                    <asp:RegularExpressionValidator ControlToValidate="TxtContactNo" runat="server" ValidationExpression="^\d{10}$" ErrorMessage="Enter a valid 10-digit number." CssClass="validation" />
                </div>

                <!-- Email -->
                <div class="form-group">
                    <label for="TxtEmail">Email:</label>
                    <asp:TextBox ID="TxtEmail" runat="server" TextMode="Email" />
                    <asp:RequiredFieldValidator ControlToValidate="TxtEmail" runat="server" ErrorMessage="Email is required." CssClass="validation" />
                    <asp:RegularExpressionValidator ControlToValidate="TxtEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid email format." CssClass="validation" />
                </div>

                <!-- Location -->
                <div class="form-group">
                    <label for="TxtLocation">Location:</label>
                    <asp:TextBox ID="TxtLocation" runat="server" />
                    <asp:RequiredFieldValidator ControlToValidate="TxtLocation" runat="server" ErrorMessage="Location is required." CssClass="validation" />
                </div>

                <!-- Description -->
                <div class="form-group">
                    <label for="TxtDescription">Description:</label>
                    <asp:TextBox ID="TxtDescription" runat="server" TextMode="MultiLine" Rows="3" />
                </div>

                <!-- Buttons -->
                <div class="button-group">
                    <asp:Button ID="BtnSave" runat="server" Text="Save" CssClass="btn-save" OnClick="BtnSave_Click" />
                    <asp:Button ID="BtnCancel" runat="server" Text="Cancel" CssClass="btn-cancel" OnClick="BtnCancel_Click" CausesValidation="false" />
                    <asp:Button ID="BtnView" runat="server" OnClick="BtnView_Click" Text="View" Width="765px" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
