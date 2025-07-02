<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDashboard.aspx.cs" Inherits="emp_mng_system.EmployeeDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Dashboard</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
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
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .profile-section {
            margin-top: 80px; /* To offset fixed header */
            text-align: center;
            padding: 20px;
            background-color: white;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .profile-section img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
        }

        .profile-section h2,
        .profile-section h4 {
            margin: 10px 0 5px;
        }

        .container {
            display: flex;
            gap: 20px;
            padding: 20px;
        }

        .section {
            flex-grow: 1;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .section h3 {
            background-color: #3b5998;
            color: white;
            padding: 10px;
            margin-top: 0;
            border-radius: 4px;
        }

        .details-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .details-table td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        .label {
            background-color: #f9f9f9;
            font-weight: bold;
            width: 40%;
        }

        .logout-btn {
            margin-top: 20px;
            background-color: red;
            color: white;
            padding: 10px 20px;
            border: none;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Static Header -->
        <div class="header">Deep Ltd. Company</div>

        <!-- Profile Photo and Name Section -->
        <div class="profile-section">
            
            <h2><asp:Label ID="lblError" runat="server" ForeColor="#FF3300"></asp:Label></h2>
       
            <h2><asp:Literal ID="welcomeLiteral" runat="server" /></h2>

            <asp:Image ID="EmpPhoto" runat="server" ImageUrl="~/images/default-profile.png" />
            <h2><asp:Label ID="lblEmail1" runat="server">Email</asp:Label></h2>
        </div>

        <!-- Info Sections -->
        <div class="container">
            <div class="section">
                <!-- Personal Details -->
                <h3>Personal Details</h3>
                <table class="details-table">
                    <tr><td class="label">Employee ID</td><td><asp:Label ID="lblEmpID" runat="server" /></td></tr>
                                        <tr><td class="label">Employee Name</td><td><asp:Label ID="LblFn" runat="server" />&nbsp;<asp:Label ID="LblLn" runat="server" /></td></tr>
                    
                    <tr><td class="label">Father's Name</td><td><asp:Label ID="lblFatherName" runat="server" /></td></tr>
                    <tr><td class="label">Date of Birth</td><td><asp:Label ID="lblDOB" runat="server" /></td></tr>
                    <tr><td class="label">Gender</td><td><asp:Label ID="lblGender" runat="server" /></td></tr>
                    <tr><td class="label">Email</td><td><asp:Label ID="lblEmail" runat="server" /></td></tr>
                    <tr><td class="label">Phone</td><td><asp:Label ID="lblPhone" runat="server" /></td></tr>
                    <tr><td class="label">Local Address</td><td><asp:Label ID="lblLocalAddress" runat="server" /></td></tr>
                    <tr><td class="label">Permanent Address</td><td><asp:Label ID="lblPermanentAddress" runat="server" /></td></tr>
                    <tr><td class="label">Department</td><td><asp:Label ID="lblDepartment" runat="server" /></td></tr>
                    <tr><td class="label">Joining Date</td><td><asp:Label ID="lblJoinDate" runat="server" /></td></tr>
                </table>

                <!-- Salary Details -->
                <br />
                <h3>Salary Details</h3>
                <table class="details-table">
                    <tr><td class="label">Basic Salary</td><td><asp:Label ID="lblBasic" runat="server" /></td></tr>
                    <tr><td class="label">Salary Date</td><td><asp:Label ID="lblDate" runat="server" /></td></tr>
                    <tr><td class="label">HRA</td><td><asp:Label ID="LabelHRA" runat="server" /></td></tr>
                   <tr><td class="label">Conveyance</td><td><asp:Label ID="LabelConveyance" runat="server" /></td></tr>
                   <tr><td class="label">Bonus</td><td><asp:Label ID="lblBonus" runat="server" /></td></tr>
                   
                    <tr><td class="label">Overtime</td><td><asp:Label ID="lblOvertime" runat="server" /></td></tr>
                    <tr><td class="label">Net Salary</td><td><asp:Label ID="lblNetSalary" runat="server" /></td></tr>
                </table>

                <!-- Department Details -->
                <br />
                <h3>Department Details</h3>
                <table class="details-table">
                    <tr><td class="label">Department Code</td><td><asp:Label ID="lblDeptCode" runat="server" /></td></tr>
                    <tr><td class="label">Department Head</td><td><asp:Label ID="lblDeptHead" runat="server" /></td></tr>
                    <tr><td class="label">Phone</td><td><asp:Label ID="lblDeptContact" runat="server" /></td></tr>
                    <tr><td class="label">Email</td><td><asp:Label ID="lblDeptEmail" runat="server" /></td></tr>
                    <tr><td class="label">Location</td><td><asp:Label ID="lblDeptLocation" runat="server" /></td></tr>
                    <tr><td class="label">Description</td><td><asp:Label ID="lblDeptDescription" runat="server" /></td></tr>
                </table>

                <!-- Leave Details -->
                <br />
                <h3>Leave Details</h3>
                <table class="details-table">
                    <tr><td class="label">Leave Type</td><td><asp:Label ID="lblLeaveType" runat="server" /></td></tr>
                    <tr><td class="label">From Date</td><td><asp:Label ID="lblFromDate" runat="server" /></td></tr>
                    <tr><td class="label">To Date</td><td><asp:Label ID="lblToDate" runat="server" /></td></tr>
                    <tr><td class="label">Total Days</td><td><asp:Label ID="lblTotalDays" runat="server" /></td></tr>
                    <tr><td class="label">Reason</td><td><asp:Label ID="lblReason" runat="server" /></td></tr>
                    <tr><td class="label">Leave Status</td><td><asp:Label ID="lblLeaveStatus" runat="server" /></td></tr>
                </table>

                <!-- Logout Button -->
                <asp:Button ID="BtnLogout" runat="server" Text="Logout" CssClass="logout-btn" OnClick="BtnLogout_Click" />
            </div>
        </div>
    </form>
</body>
</html>
