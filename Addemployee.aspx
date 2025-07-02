<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Addemployee.aspx.cs" Inherits="emp_mng_system.Addemployee" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Employee - Deep Ltd. Company</title>
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

.main-content {
    margin-left: 200px;
    padding: 120px 30px 30px 30px; /* Increased padding-top to avoid header overlap */
    min-height: 100vh;
}

.container {
    background-color: white;
    padding: 25px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 6px;
    font-weight: bold;
}

.form-group input, .form-group textarea, .form-group select {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
}

.validation {
    color: red;
    font-size: 12px;
}

.button-group {
    margin-top: 20px;
}

.button-group input {
    margin-right: 10px;
    padding: 10px 20px;
    font-weight: bold;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.auto-style4 {
    background-color: #00CC66;
    color: white;
}

.auto-style3 {
    background-color: red;
    color: white;
}

.button-group input:hover {
    opacity: 0.9;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">Deep Ltd. Company</div>

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

        <!-- Main content -->
        <div class="main-content">
            <div class="container">
                <h2>Add Employee</h2>
                <asp:Label ID="lblStatus1" runat="server" />

                <!-- Form Controls -->
                <div class="form-group">
                    <label>First Name:</label>
                    <asp:TextBox ID="TxtEmpFn" runat="server" placeholder="Enter First Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFn" ControlToValidate="TxtEmpFn" runat="server" ErrorMessage="First Name is required." CssClass="validation" />
                </div>

                <div class="form-group">
                    <label>Last Name:</label>
                   <asp:TextBox ID="TxtEmpLn" runat="server" placeholder="Enter Last Name"></asp:TextBox> <asp:RequiredFieldValidator ID="rfvLn" ControlToValidate="TxtEmpLn" runat="server" ErrorMessage="Last Name is required." CssClass="validation" />
                </div>

                <div class="form-group">
                    <label>Father's Name:</label>
                    <asp:TextBox ID="TxtFatherName" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvFather" ControlToValidate="TxtFatherName" runat="server" ErrorMessage="Father's Name is required." CssClass="validation" />
                </div>

                <div class="form-group">
                    <label>Date of Birth:</label>
                    <asp:TextBox ID="TxtDob" runat="server" TextMode="Date" />
                    <asp:RequiredFieldValidator ID="rfvDob" ControlToValidate="TxtDob" runat="server" ErrorMessage="Date of Birth is required." CssClass="validation" />
                </div>

                <div class="form-group">
                    <label>Gender:</label>
                    <asp:DropDownList ID="DropDownGender" runat="server">
                        <asp:ListItem Text="Select Gender" Value="" />
                        <asp:ListItem Text="Male" Value="Male" />
                        <asp:ListItem Text="Female" Value="Female" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvGender" ControlToValidate="DropDownGender" InitialValue="" runat="server" ErrorMessage="Please select a gender." CssClass="validation" />
                </div>

                <div class="form-group">
                    <label>Email:</label>
                    <asp:TextBox ID="TxtEmail" runat="server" TextMode="Email" />
                    <asp:RequiredFieldValidator ID="rfvEmail" ControlToValidate="TxtEmail" runat="server" ErrorMessage="Email is required." CssClass="validation" />
                    <asp:RegularExpressionValidator ID="revEmail" ControlToValidate="TxtEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid email format." CssClass="validation" />
                </div>

                <div class="form-group">
                    <label>Phone:</label>
                    <asp:TextBox ID="TxtPhone" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvPhone" ControlToValidate="TxtPhone" runat="server" ErrorMessage="Phone number is required." CssClass="validation" />
                    <asp:RegularExpressionValidator ID="revPhone" ControlToValidate="TxtPhone" runat="server" ValidationExpression="^[0-9]{10}$" ErrorMessage="Invalid phone number." CssClass="validation" />
                </div>

                <div class="form-group">
                    <label>Local Address:</label>
                    <asp:TextBox ID="TxtLocalAddress" runat="server" TextMode="MultiLine" Rows="3" />
                    <asp:RequiredFieldValidator ID="rfvLocal" ControlToValidate="TxtLocalAddress" runat="server" ErrorMessage="Local Address is required." CssClass="validation" />
                </div>

                <div class="form-group">
                    <label>Permanent Address:</label>
                    <asp:TextBox ID="TxtPermanentAddress" runat="server" TextMode="MultiLine" Rows="3" />
                    <asp:RequiredFieldValidator ID="rfvPermanent" ControlToValidate="TxtPermanentAddress" runat="server" ErrorMessage="Permanent Address is required." CssClass="validation" />
                </div>

                <div class="form-group">
                    <label>Department:</label>
                    <asp:DropDownList ID="DropDownDepartment" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvDept" ControlToValidate="DropDownDepartment" InitialValue="" runat="server" ErrorMessage="Please select a department." CssClass="validation" />
                </div>
                <div>
               <div><lable><strong>Work</strong> <strong>Location:</strong></lable><br />
                   <asp:DropDownList ID="DropDownWL" runat="server" CssClass="form-control">
    <asp:ListItem Value="">Select Work Location</asp:ListItem>
    <asp:ListItem Value="Salimar Bagh">Shalimar Bagh</asp:ListItem>
    <asp:ListItem Value="Faridabad">Faridabad</asp:ListItem>
    <asp:ListItem Value="Gurgaon">Gurgaon</asp:ListItem>
</asp:DropDownList>

                   <br />
                    <asp:RequiredFieldValidator ID="rfvDept0" ControlToValidate="DropDownWL" InitialValue="" runat="server" ErrorMessage="Please select a Work Location" CssClass="validation" />
                   <strong>
                   <br /></div>
                         <div class="form-group">
                 <lable>  Employement Type: <lable/>
                   <asp:DropDownList ID="ddlEmploymentType" runat="server" CssClass="form-control">
                       <asp:ListItem Value="">Select Employment Type</asp:ListItem>
                       <asp:ListItem Value="FullTime">Full Time</asp:ListItem>
                       <asp:ListItem Value="PartTime">Part Time</asp:ListItem>
                       <asp:ListItem Value="Contract">Contract</asp:ListItem>
                   </asp:DropDownList>
                   <br />
                   <asp:RequiredFieldValidator ID="rfvDept1" ControlToValidate="ddlEmploymentType" InitialValue="" runat="server" ErrorMessage="Please select a Employment Type" CssClass="validation" />
                   </div>
                   <div class="form-group">
                       <label>
                       Date of Joining:</label>
                       <asp:TextBox ID="TxtDOJ" runat="server" TextMode="Date" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtDOJ" runat="server" ErrorMessage="Date of Joining is required." CssClass="validation" />
                   </div>

                </div>
                <div class="form-group">
                    <label>Photo:</label>
                    <asp:FileUpload ID="FileUploadPhoto" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvPhoto" ControlToValidate="FileUploadPhoto" runat="server" ErrorMessage="Please upload a photo." CssClass="validation" />
                </div>

                <div class="button-group">
                    <asp:Button ID="BtnSave" runat="server" Text="Save" CssClass="auto-style4" OnClick="BtnSave_Click" />
                    <asp:Button ID="BtnCancel" runat="server" Text="Cancel" CssClass="auto-style3" OnClick="BtnCancel_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
