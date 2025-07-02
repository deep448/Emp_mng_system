<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="emp_mng_system.Report" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Employee Report</title>
   <style>
    /* General Page Styles */
    body {
        margin: 0;
        font-family: 'Segoe UI', sans-serif;
        background-color: #f4f4f4;
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
        z-index: 1000;
        left: 0;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }  .topbar {
        background-color: #003366;
        color: white;
        padding: 15px;
        text-align: center;
        font-size: 24px;
        font-weight: bold;
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
        margin-left: 220px;
        padding: 30px;
    }

    h2 {
        color: #003366;
        text-align: center;
        margin-bottom: 30px;
    }

    .search-section {
        margin-bottom: 20px;
    }

    .search-btn {
        margin-left: 10px;
    }

    /* GridView Styling */
    .grid-container h3 {
        text-align: center;
        margin-bottom: 20px;
    }

    .auto-style3 th {
        background-color: #293A4B; /* Matching color with header and sidebar */
        color: white;
        text-align: center;
        padding: 12px;
    }

    .auto-style3 td {
        text-align: center;
        padding: 12px;
        font-size: 14px;
        color: #333;
    }

    .auto-style3 tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    .auto-style3 th {
    background-color: #293A4B; /* Dark blue-grey */
    color: white;
    text-align: center;
    padding: 12px;
}

    .auto-style3 tr:hover {
        background-color: #e0e0e0;
    }

    .auto-style3 {
        border-collapse: collapse;
        width: 100%;
        box-sizing: border-box;
        margin-top: 20px;
        border: 1px solid #ddd;
        background-color: #fff;
    }

    /* Label Styles */
    .label {
        font-size: 16px;
        color: #003366;
        font-weight: bold;
    }
       .auto-style4 {
           background-color: #293A4B;
           color: white;
           padding: 15px;
           text-align: center;
           font-size: 24px;
           position: fixed;
           top: 0;
           width: 280%;
           z-index: 1000;
           left: -1584px;
           box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
       }
   </style>

</head>
<body>
    <form id="form1" runat="server">
        <!-- Top Bar -->
        <div class="auto-style4">
   <center class="auto-style1"> Deep Ltd. Company</center>
</div>

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

        <!-- Sidebar -->

        <!-- Main Content -->
        <div class="main-content">
            <h2>&nbsp;</h2>
            <h2>&nbsp; Employee&nbsp; Report</h2>

            <!-- Search Section -->
            <center>
                <div class="search-section">
                    <asp:TextBox ID="TextBoxSearch" runat="server" Placeholder="Enter Employee ID or Department Name"></asp:TextBox>
                    <asp:Button ID="ButtonSearch" runat="server" Text="Search" CssClass="search-btn" OnClick="ButtonSearch_Click" />
                </div>
            </center>

            <div class="grid-container">
                <h3>Search Result:</h3>
                <asp:Label ID="LabelSearchResult" runat="server" Text="Enter Employee ID or Department Name to search." ForeColor="Gray"></asp:Label>
                
                <asp:GridView ID="GridView1" runat="server" CssClass="auto-style3" Width="100%" AutoGenerateColumns="False" DataKeyNames="EmployeeID">
    <Columns>
                        <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                        <asp:BoundField DataField="DOB" HeaderText="Date of Birth" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" />
                        <asp:BoundField DataField="Department" HeaderText="Department" />
                        <asp:BoundField DataField="EmploymentType" HeaderText="Employment Type" />
                        <asp:BoundField DataField="BasicSalary" HeaderText="Basic Salary" />
                         <asp:BoundField DataField="HRA" HeaderText="HRA" />
                        <asp:BoundField DataField="Bonus" HeaderText="Bonus" />
        <asp:BoundField DataField="SalaryDate" HeaderText="SalryDate" />
        <asp:BoundField DataField="NetSalary" HeaderText="Net Salary" />



                           
    
    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
