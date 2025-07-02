<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewEmpList.aspx.cs" Inherits="YourNamespace.ViewEmpList" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>View Employee List</title>

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
    position: fixed; /* Fixes the header to the top */
    width: 100%;
    top: 0;
    z-index: 1000; /* Keeps header above other content */
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

       .main-container {
    display: flex;
    flex: 1;
    margin-top: 60px; /* Same as header height to avoid overlap */
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

        .btn-back {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            text-align: center;
            border: none;
            cursor: pointer;
            margin-bottom: 20px;
        }

        .btn-back:hover {
            background-color: #45a049;
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

        .gridview th, .gridview td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ccc;
        }

        .gridview th {
            background-color: #f2f2f2;
        }

        .header {
            background-color: #293A4B;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Panel -->
        <div class="header">
            Deep Ltd. Company
        </div>

        <!-- Main Container -->
        <div class="main-container">
            <!-- Sidebar -->
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

            <!-- Content -->
            <div class="content">
                <h2>Employee List</h2>

                <!-- Search Section -->
                <div class="search-section">
                    <asp:TextBox ID="txtSearch" runat="server" Placeholder="Enter Employee ID or Name"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" BackColor="#2C3E50" ForeColor="White" />
                    <br /><br />
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                </div>

                <!-- Employee GridView -->
                <div class="grid-container">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" ReadOnly="True" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                            <asp:BoundField DataField="DOB" HeaderText="Date of Birth" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone Number" />
                            <asp:BoundField DataField="Department" HeaderText="Department" />
                            <asp:BoundField DataField="EmploymentType" HeaderText="Employment Type" />
                            <asp:BoundField DataField="DateOfJoining" HeaderText="Date of Joining" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="WorkLocation" HeaderText="Work Location" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" />
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                </EditItemTemplate>
                            </asp:TemplateField>
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


