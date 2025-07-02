<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSalaryList.aspx.cs" Inherits="YourNamespace.ViewSalaryList" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>View Salary List</title>
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

        .grid-container {
            border: 1px solid #ccc;
            background: white;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .btn-back {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            text-align: center;
            border: none;
            cursor: pointer;
            margin-top: 20px;
        }

        .btn-back:hover {
            background-color: #45a049;
        }

        .gridview-style th, .gridview-style td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ccc;
        }

        .gridview-style th {
            background-color: #f2f2f2;
        }

        .auto-style1 {
            width: 200px;
            background-color: #2C3E50;
            color: white;
            padding: 20px;
            text-align: center;
            position: fixed;
            height: 100vh;
            left: 0px;
            top: 57px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">Employee Management System</div>
        <div class="main-container">
                 <div class="sidebar">
    <a class="sidebar-button" href="Dashboard.aspx" style="width: 90%">
    <asp:Image ID="Image4" runat="server" Height="37px" ImageUrl="~/Scripts/image/Home1.png" Width="42px" />
    <br />
    Dashboard</a>
    <a class="sidebar-button" href="Employee.aspx" style="width: 90%">
    <asp:Image ID="Image6" runat="server" Height="37px" ImageUrl="~/Scripts/image/Employee1 (2).png" Width="42px" />
    <br />
    Employee</a>
    <a class="sidebar-button" href="Department.aspx" style="width: 89%">
    <asp:Image ID="Image7" runat="server" Height="37px" ImageUrl="~/Scripts/image/Department1.png" Width="42px" />
    <br />
    Department</a>
    <a class="sidebar-button" href="Salary.aspx" style="width: 90%">
    <asp:Image ID="Image8" runat="server" Height="37px" ImageUrl="~/Scripts/image/Salary1.png" Width="42px" />
    <br />
    Salary</a>
    <a class="sidebar-button" href="Leave.aspx" style="width: 89%">
    <asp:Image ID="Image9" runat="server" Height="37px" ImageUrl="~/Scripts/image/Leave1.png" Width="42px" />
    <br />
    Leave</a>

    <a class="sidebar-button" href="Report.aspx" style="width: 88%">
    <asp:Image ID="Image10" runat="server" Height="37px" ImageUrl="~/Scripts/image/Report.png" Width="42px" />
    <br />
    Report</a>
    <a class="sidebar-button" href="AdminLogin.aspx" style="width: 88%">Logout</a>
</div>

            <div class="content">
                <h2>Salary List</h2>
                <div class="grid-container">
                    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search by ID or Name"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CausesValidation="false" />
                    
                    <!-- Label for displaying messages -->
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                    
                    <div></div>
                    <asp:GridView ID="GridView1" runat="server" CssClass="gridview-style" AutoGenerateColumns="False"
                        AutoGenerateEditButton="True" AutoGenerateDeleteButton="True" DataKeyNames="EmployeeID"
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" ReadOnly="True" />
                            <asp:BoundField DataField="BasicSalary" HeaderText="Basic Salary" />
                            <asp:BoundField DataField="HRA" HeaderText="HRA" />
                            <asp:BoundField DataField="Conveyance" HeaderText="Conveyance" />
                            <asp:BoundField DataField="MedicalAllowance" HeaderText="Medical Allowance" />
                            <asp:BoundField DataField="Bonus" HeaderText="Bonus" />
                            <asp:BoundField DataField="Overtime" HeaderText="Overtime" />
                            <asp:BoundField DataField="AdvanceDeduction" HeaderText="Advance Deduction" />
                            <asp:BoundField DataField="NetSalary" HeaderText="Net Salary" />
                        </Columns>
                    </asp:GridView>

                    <br />
                    <button type="button" class="btn-back" onclick="window.location.href='Dashboard.aspx'">Back to Dashboard</button>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
