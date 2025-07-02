<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Leave.aspx.cs" Inherits="emp_mng_system.Leave" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Management System</title>
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

        .search-section {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-section input,
        .search-section button {
            padding: 8px;
            font-size: 16px;
        }

        .grid-container {
            border: 1px solid #ccc;
            background: white;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .btn-danger {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <!-- Header Panel -->
        <div class="header">
            Deep Ltd. Company
        </div>

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
        <div class="content">
            <h2>Leave Management</h2>

            <!-- Search Section -->
            <div class="search-section">
                <asp:TextBox ID="TextBoxSearch" runat="server" Placeholder="Enter Employee ID"></asp:TextBox>
                <asp:Button ID="ButtonSearch" runat="server" Text="Search" CssClass="search-btn" OnClick="ButtonSearch_Click" />
                &nbsp;
                <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Add" style="height: 44px" />
                &nbsp;
                <asp:Button ID="btn_view" runat="server" OnClick="btn_view_Click" Text="Leave Status" />
                &nbsp;
            </div>

            <!-- GridView for Leave Management -->
                       <div class="grid-container">
                <h3>Search Result:</h3>
                <asp:Label ID="LeaveLabelSearchResult" runat="server" Text="Enter Employee ID to search." ForeColor="Gray"></asp:Label>
                <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" 
DataKeyNames="EmployeeID"
OnRowCommand="GridView1_RowCommand"
OnRowEditing="GridView1_RowEditing"
OnRowCancelingEdit="GridView1_RowCancelingEdit"
OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                        <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" ReadOnly="true" />
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                        <asp:BoundField DataField="Department" HeaderText="Department" />

                        <asp:TemplateField HeaderText="Leave Type">
                            <ItemTemplate><%# Eval("LeaveType") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLeaveType" runat="server" Text='<%# Bind("LeaveType") %>' />
                                <asp:RequiredFieldValidator ID="rfvLeaveType" runat="server" ControlToValidate="txtLeaveType"
                                    ErrorMessage="Leave Type is required" ForeColor="Red" Display="Dynamic" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="FromDate">
                            <ItemTemplate><%# Eval("FromDate", "{0:yyyy-MM-dd}") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLeaveStartDate" runat="server" Text='<%# Bind("FromDate", "{0:yyyy-MM-dd}") %>' />
                                <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" ControlToValidate="txtLeaveStartDate"
                                    ErrorMessage="Start Date is required" ForeColor="Red" Display="Dynamic" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ToDate">
                            <ItemTemplate><%# Eval("ToDate", "{0:yyyy-MM-dd}") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLeaveEndDate" runat="server" Text='<%# Bind("ToDate", "{0:yyyy-MM-dd}") %>' />
                                <asp:RequiredFieldValidator ID="rfvToDate" runat="server" ControlToValidate="txtLeaveEndDate"
                                    ErrorMessage="End Date is required" ForeColor="Red" Display="Dynamic" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Reason">
                            <ItemTemplate><%# Eval("Reason") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtReason" runat="server" Text='<%# Bind("Reason") %>' />
                                <asp:RequiredFieldValidator ID="rfvReason" runat="server" ControlToValidate="txtReason"
                                    ErrorMessage="Reason is required" ForeColor="Red" Display="Dynamic" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Leave Status">
                            <ItemTemplate><%# Eval("LeaveStatus") %></ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlLeaveStatus" runat="server">
                                    <asp:ListItem Text="Select" Value="" />
                                    <asp:ListItem Text="Approved" Value="Approved" />
                                    <asp:ListItem Text="Pending" Value="Pending" />
                                    <asp:ListItem Text="Rejected" Value="Rejected" />
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvLeaveStatus" runat="server" ControlToValidate="ddlLeaveStatus"
                                    InitialValue="" ErrorMessage="Leave Status is required" ForeColor="Red" Display="Dynamic" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="True" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="BtnRemove" runat="server" Text="Remove" CssClass="btn btn-danger btn-sm" CommandName="RemoveRow" CommandArgument='<%# Eval("EmployeeID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
