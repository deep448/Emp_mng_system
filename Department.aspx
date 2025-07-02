<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="emp_mng_system.Department" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Department Management</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            height: 100vh;
            background-color: #ECF0F1;
        }

        * {
            box-sizing: border-box;
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

/* Sidebar styling */
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
    margin-left: 200px;
    padding: 120px 30px 30px 30px; /* Increased padding-top to avoid header overlap */
    min-height: 100vh;
}

        .grid-container {
            margin-top: 20px;
            background-color: white;
            padding: 20px;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .gridview th, .gridview td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ccc;
        }

        .gridview th {
            background-color: #f2f2f2;
        }

        .btn-action {
            background-color: #4CAF50;
            color: white;
            padding: 5px 10px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }

        .btn-action:hover {
            background-color: #45a049;
        }

        .form-input {
            padding: 5px;
            margin: 3px;
            width: 95%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!-- Header -->
        <div class="header">Deep Ltd. Company</div>

        <!-- Sidebar -->
        <div class="sidebar">
            <a class="sidebar-button" href="Dashboard.aspx" style="width: 90%">
                <asp:Image ID="Image4" runat="server" Height="37px" Width="42px" ImageUrl="~/Scripts/image/Home1.png" />
                <br />Dashboard
            </a>
            <a class="sidebar-button" href="Employee.aspx" style="width: 90%">
                <asp:Image ID="Image6" runat="server" Height="37px" Width="42px" ImageUrl="~/Scripts/image/Employee1 (2).png" />
                <br />Employee
            </a>
            <a class="sidebar-button" href="Department.aspx" style="width: 90%">
                <asp:Image ID="Image7" runat="server" Height="37px" Width="42px" ImageUrl="~/Scripts/image/Department1.png" />
                <br />Department
            </a>
            <a class="sidebar-button" href="Salary.aspx" style="width: 90%">
                <asp:Image ID="Image8" runat="server" Height="37px" Width="42px" ImageUrl="~/Scripts/image/Salary1.png" />
                <br />Salary
            </a>
            <a class="sidebar-button" href="Leave.aspx" style="width: 91%">
                <asp:Image ID="Image9" runat="server" Height="37px" Width="42px" ImageUrl="~/Scripts/image/Leave1.png" />
                <br />Leave
            </a>
            <a class="sidebar-button" href="Report.aspx" style="width: 91%">
                <asp:Image ID="Image10" runat="server" Height="37px" Width="42px" ImageUrl="~/Scripts/image/Report.png" />
                <br />Report
            </a>
            <a class="sidebar-button" href="AdminLogin.aspx" style="width: 91%">Logout</a>
        </div>

        <!-- Content -->
        <div class="content">
            <h2 style="text-align: center;">Manage Departments</h2>

            <div class="grid-container">
                <h3 style="text-align: center; margin-bottom: 20px;">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" Width="45px" />
                    &nbsp;
                    <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
                </h3>

                <asp:Label ID="LabelSearchResult" runat="server" Text="Details" ForeColor="Gray"></asp:Label>

                <asp:GridView ID="GridViewDepartments" runat="server" AutoGenerateColumns="False" CssClass="gridview"
                    DataKeyNames="DeptID"
                    OnRowEditing="GridViewDepartments_RowEditing"
                    OnRowUpdating="GridViewDepartments_RowUpdating"
                    OnRowCancelingEdit="GridViewDepartments_RowCancelingEdit"
                    OnRowDeleting="GridViewDepartments_RowDeleting" style="margin-left: 0px">
                    <Columns>
                        <asp:BoundField DataField="DeptName" HeaderText="Department Name" />
                        <asp:BoundField DataField="DeptCode" HeaderText="Department Code" />
                        <asp:BoundField DataField="DeptHead" HeaderText="Department Head" />
                        <asp:BoundField DataField="Location" HeaderText="Location" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
