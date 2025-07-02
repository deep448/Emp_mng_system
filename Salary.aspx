<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salary.aspx.cs" Inherits="emp_mng_system.Salary" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Salary Form</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f4f6f8;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

       .header {
    background-color: #293A4B;
    color: white;
    padding: 15px;
    text-align: center;
    font-size: 24px;
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000; /* Keeps the header on top */
    left: 0;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

        .main-container {
            display: flex;
            flex: 1;
            margin-top: 70px; /* Adjust for fixed header */
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


        .main-content {
            margin-left: 220px; /* Adjust for sidebar */
            padding: 30px;
            overflow-y: auto;
            flex: 1;
        }

        .company-name {
            font-size: 28px;
            font-weight: bold;
            text-align: center;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .form-heading {
            font-size: 22px;
            text-align: center;
            margin-bottom: 30px;
            color: #34495e;
        }

        .search-panel {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }

        .search-panel .buttons {
            display: flex;
            gap: 10px;
        }

        .form-group {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: flex-start;
        }

        .form-group label {
            width: 220px;
            font-weight: bold;
            color: #333;
        }

        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group select {
            width: 300px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn-group {
            margin-top: 20px;
            display: flex;
            justify-content: flex-start;
            gap: 15px;
        }

        .status-label {
            font-weight: bold;
            color: green;
            margin-top: 10px;
        }

        .gridview-style {
            margin-top: 40px;
        }

        .gridview-style table {
            width: 100%;
            border-collapse: collapse;
        }

        .gridview-style th, .gridview-style td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        .gridview-style th {
            background-color: #293A4B;
            color: white;
        }

        /* Centering the Form */
        .form-container {
            width: 60%;
            margin: 0 auto;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <div class="header">
            <center>Deep Ltd. Company</center>
        </div>

        <div class="main-container">
            <!-- Sidebar -->
            <div class="sidebar">
                <a class="sidebar-button" href="Dashboard.aspx" style="width: 90%">
                    <asp:Image ID="Image4" runat="server" Height="37px" ImageUrl="~/Scripts/image/Home1.png" Width="42px" />
                    <br />
                    Dashboard
                </a>
                <a class="sidebar-button" href="Employee.aspx" style="width: 90%">
                    <asp:Image ID="Image6" runat="server" Height="37px" ImageUrl="~/Scripts/image/Employee1 (2).png" Width="42px" />
                    <br />
                    Employee
                </a>
                <a class="sidebar-button" href="Department.aspx" style="width: 89%">
                    <asp:Image ID="Image7" runat="server" Height="37px" ImageUrl="~/Scripts/image/Department1.png" Width="42px" />
                    <br />
                    Department
                </a>
                <a class="sidebar-button" href="Salary.aspx" style="width: 90%">
                    <asp:Image ID="Image8" runat="server" Height="37px" ImageUrl="~/Scripts/image/Salary1.png" Width="42px" />
                    <br />
                    Salary
                </a>
                <a class="sidebar-button" href="Leave.aspx" style="width: 89%">
                    <asp:Image ID="Image9" runat="server" Height="37px" ImageUrl="~/Scripts/image/Leave1.png" Width="42px" />
                    <br />
                    Leave
                </a>
                <a class="sidebar-button" href="Report.aspx" style="width: 88%">
                    <asp:Image ID="Image10" runat="server" Height="37px" ImageUrl="~/Scripts/image/Report.png" Width="42px" />
                    <br />
                    Report
                </a>
                <a class="sidebar-button" href="AdminLogin.aspx" style="width: 88%">Logout</a>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <div class="form-container">
                    <div class="form-heading"><strong>Employee Salary Form</strong></div>

                    <div class="search-panel">
                        <div class="buttons">
                            <asp:Button ID="btnView" runat="server" Text="View All" OnClick="btnView_Click" CausesValidation="false" />
                        </div>
                    </div>

                    <asp:Label ID="lblStatus" runat="server" CssClass="status-label" />

                    <!-- Form Fields -->
                    <div class="form-group">
                        <label>Employee ID:</label>
                        <asp:TextBox ID="txtEmpId" runat="server" />
                        <asp:RequiredFieldValidator ID="rfvEmpId" runat="server" ControlToValidate="txtEmpId"
                            ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label>Basic Salary (Min ₹14,000):</label>
                        <asp:TextBox ID="txtBasic" runat="server" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="rfvBasic" runat="server" ControlToValidate="txtBasic"
                            ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" />
                        <asp:RangeValidator ID="rvBasic" runat="server" ControlToValidate="txtBasic"
                            MinimumValue="14000" MaximumValue="1000000" Type="Integer" ErrorMessage="*Must be ≥ ₹14,000"
                            ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <strong>Date</strong><label>:</label>
                        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" />
                        <asp:RequiredFieldValidator ID="rfvDate0" runat="server" ControlToValidate="txtDate"
                            ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label>HRA:</label>
                        <asp:DropDownList ID="ddlHRA" runat="server">
                            <asp:ListItem Text="0%" Value="0" />
                            <asp:ListItem Text="10%" Value="10" />
                            <asp:ListItem Text="20%" Value="20" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDate1" runat="server" ControlToValidate="ddlHRA"
                            ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label>Conveyance:</label>
                        <asp:DropDownList ID="ddlConveyance" runat="server">
                            <asp:ListItem Text="0%" Value="0" />
                            <asp:ListItem Text="5%" Value="5" />
                            <asp:ListItem Text="10%" Value="10" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDate2" runat="server" ControlToValidate="ddlConveyance"
                            ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label>Medical Allowance:</label>
                        <asp:DropDownList ID="ddlMedical" runat="server">
                            <asp:ListItem Text="0%" Value="0" />
                            <asp:ListItem Text="5%" Value="5" />
                            <asp:ListItem Text="10%" Value="10" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDate3" runat="server" ControlToValidate="ddlMedical"
                            ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label>Bonus:</label>
                        <asp:DropDownList ID="ddlBonus" runat="server">
                            <asp:ListItem Text="0%" Value="0" />
                            <asp:ListItem Text="5%" Value="5" />
                            <asp:ListItem Text="10%" Value="10" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDate4" runat="server" ControlToValidate="ddlBonus"
                            ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label>Overtime:</label>
                        <asp:TextBox ID="txtOvertime" runat="server" TextMode="Number" Placeholder="Null if not applicable" />
                        <asp:RegularExpressionValidator ID="revOvertime" runat="server" ControlToValidate="txtOvertime"
                            ValidationExpression="^\d{0,2}$" ErrorMessage="*Enter valid number" ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="btn-group">
                        <asp:Button ID="btnCalculate" runat="server" Text="Calculate" OnClick="btnCalculate_Click" />
                        <asp:Button ID="btnsave" runat="server" OnClick="btnsave_Click1" Text="Save" />
                    </div>

                    <!-- Gridview to display salary records -->
                </div>
            </div>
        </div>
    </form>
</body>
</html>
