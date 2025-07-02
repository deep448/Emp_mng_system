<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="emp_mng_system.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
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
            margin-left: 220px;
            padding: 20px;
        }

        .dashboard-panel {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-top: 20px;
        }

       .panel {
    flex: 1;
    min-width: 30%;
    background-color: #ecf0f1;
    padding: 20px;
    text-align: center;
    border-radius: 10px;
    margin: 10px;
    box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease-in-out;
}


        input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .panel:hover {
    box-shadow: 0px 15px 25px rgba(0, 0, 0, 0.2);  /* More prominent shadow */
    transform: scale(1.05);  /* Slightly enlarge the panel */
}

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!-- Header -->
        <div class="header">
            Deep Ltd.
            Company</div>

        <!-- Sidebar -->
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


        <!-- Main Content -->
        <div class="content">
            <h2>&nbsp;</h2>
            <h2>&nbsp; </h2>
            <h2>Dashboard</h2>

            <div class="dashboard-panel">
                <!-- Total Employees Panel -->
                <div class="panel">
                    <h3>
                        <asp:ImageButton ID="ImageEmployee" runat="server" Height="98px" ImageUrl="~/Scripts/image/employee.png" OnClick="ImageEmployee_Click" Width="148px" />
                    </h3>
                    <h3>Total Employees</h3>
                    <asp:Label ID="lblTotalEmployees" runat="server" Text="Loading..."></asp:Label>
                </div>

                <!-- Total Departments Panel -->
                <div class="panel">
                    <h3>&nbsp;
                        <asp:ImageButton ID="ImageDept" runat="server" Height="98px" ImageUrl="~/Scripts/image/Dept.png" OnClick="ImageDept_Click" Width="148px" />
                    </h3>
                    <h3>Total Departments</h3>
                    <asp:Label ID="lblTotalDepartment" runat="server" Text="Loading..."></asp:Label>
                </div>

                <!-- Leave Status Panel -->
                <div class="panel">
                    <h3>
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="98px" ImageUrl="~/Scripts/image/Levave1.png" OnClick="ImageButton1_Click" Width="148px" />
                    </h3>
                    <h3>Leave Status</h3>
                    <asp:Label ID="LabelLeaveStatus" runat="server" Text="No Leave Requests"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
