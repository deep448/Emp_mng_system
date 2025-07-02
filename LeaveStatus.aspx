<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveStatus.aspx.cs" Inherits="YourNamespace.LeaveStatus" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Leave Status</title>
    <link href="your-old-styles.css" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
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
            height: calc(100vh - 60px); /* 60px approx header height */
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
            margin-left: 220px; /* Sidebar width + some gap */
            padding: 30px;
            flex-grow: 1;
        }

        .input-text {
            padding: 8px;
            width: 250px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            padding: 8px 15px;
            background-color: #2980b9;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #1abc9c;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
        }

        .table th, .table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .table th {
            background-color: #34495e;
            color: white;
        }

        .btn-update {
            padding: 5px 10px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .btn-update:hover {
            background-color: #2ecc71;
        }
        .auto-style1 {
            width: 1041px;
        }
    </style>
</head>

<body>
    <form id="form2" runat="server">
        <!-- Header -->
        <div class="header">
           <center class="auto-style1"> Deep Ltd. Company</center>
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

            <!-- Content Area -->
          <center>  <div class="content">
                <h2>Leave Status</h2>

                <asp:Label ID="lblSearch" runat="server" Text="Enter Employee ID:"></asp:Label>
                <asp:TextBox ID="txtEmployeeID" runat="server" CssClass="input-text"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn" />
                <div> 

                    <asp:Label ID="Lblmssg" runat="server" ForeColor="#009900"></asp:Label>

                </div>
                <asp:GridView ID="GridViewLeaveStatus" runat="server" AutoGenerateColumns="False" CssClass="table" GridLines="Both">
                    <Columns>
                        <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" />
                        <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" />
                        <asp:BoundField DataField="FromDate" HeaderText="From Date" />
                        <asp:BoundField DataField="ToDate" HeaderText="To Date" />
                        <asp:BoundField DataField="Reason" HeaderText="Reason" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlStatus" runat="server">
                                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                    <asp:ListItem Text="Approved" Value="Approved"></asp:ListItem>
                                    <asp:ListItem Text="Rejected" Value="Rejected"></asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="UpdateStatus" CommandArgument='<%# Eval("LeaveID") %>' CssClass="btn-update" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView> 

                <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
            </div> </center>
        </div>
    </form>
</body>
</html>
