<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="emp_mng_system.Employee" %>

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
   Deep Ltd. Company</div>

        <!-- Main -->
        
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
</div> &lt; div class=&quot;main-container

            <!-- Content -->
            <div class="content">
                <h2>EMPLOYEE PANEL</h2>

                <!-- Search -->
                <div class="search-section">
                    <asp:TextBox ID="TextBoxSearch" runat="server" Placeholder="Enter Employee ID"></asp:TextBox>
                    <asp:Button ID="ButtonSearch" runat="server" Text="Search" CssClass="search-btn" OnClick="ButtonSearch_Click" />
                    &nbsp;
                    <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Add" style="height: 44px" />
                &nbsp;<asp:Button ID="btn_view" runat="server" OnClick="btn_view_Click" Text="View Employee List" />
                &nbsp;</div>

                <!-- GridView -->
                <div class="grid-container">
                    <h3>Search Result:</h3>
                    <asp:Label ID="LabelSearchResult" runat="server" Text="Enter Employee ID to search." ForeColor="Gray"></asp:Label>
                    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" 
    DataKeyNames="EmployeeID"
    OnRowCommand="GridView1_RowCommand"
    OnRowEditing="GridView1_RowEditing"
    OnRowCancelingEdit="GridView1_RowCancelingEdit"
    OnRowUpdating="GridView1_RowUpdating">

    <Columns>
        <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" ReadOnly="true" />
        <asp:TemplateField HeaderText="First Name">
    <ItemTemplate><%# Eval("FirstName") %></ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FirstName") %>' />
        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
            ControlToValidate="txtFirstName"
            ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" />
    </EditItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Last Name">
    <ItemTemplate><%# Eval("LastName") %></ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("LastName") %>' />
        <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
            ControlToValidate="txtLastName"
            ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" />
    </EditItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Date of Birth">
    <ItemTemplate><%# Eval("DOB", "{0:yyyy-MM-dd}") %></ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtDOB" runat="server" Text='<%# Bind("DOB", "{0:yyyy-MM-dd}") %>' />
        <asp:RequiredFieldValidator ID="rfvDOB" runat="server"
            ControlToValidate="txtDOB"
            ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" />
        <asp:RegularExpressionValidator ID="revDOB" runat="server"
            ControlToValidate="txtDOB"
            ErrorMessage="Invalid date format (yyyy-MM-dd)"
            ValidationExpression="\d{4}-\d{2}-\d{2}" ForeColor="Red" Display="Dynamic" />
    </EditItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Gender">
    <ItemTemplate><%# Eval("Gender") %></ItemTemplate>
    <EditItemTemplate>
        <asp:DropDownList ID="ddlGender" runat="server">
            <asp:ListItem Text="Select" Value="" />
            <asp:ListItem Text="Male" Value="Male" />
            <asp:ListItem Text="Female" Value="Female" />
            <asp:ListItem Text="Other" Value="Other" />
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvGender" runat="server"
            ControlToValidate="ddlGender"
            InitialValue=""
            ErrorMessage="*Select gender" ForeColor="Red" Display="Dynamic" />
    </EditItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Email">
    <ItemTemplate><%# Eval("Email") %></ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' />
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
            ControlToValidate="txtEmail"
            ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" />
        <asp:RegularExpressionValidator ID="revEmail" runat="server"
            ControlToValidate="txtEmail"
            ErrorMessage="Invalid Email"
            ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" ForeColor="Red" Display="Dynamic" />
    </EditItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Phone">
    <ItemTemplate><%# Eval("Phone") %></ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>' />
        <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
            ControlToValidate="txtPhone"
            ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" />
        <asp:RegularExpressionValidator ID="revPhone" runat="server"
            ControlToValidate="txtPhone"
            ErrorMessage="10-digit number only"
            ValidationExpression="^\d{10}$" ForeColor="Red" Display="Dynamic" />
    </EditItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Department">
    <ItemTemplate><%# Eval("Department") %></ItemTemplate>
    <EditItemTemplate>
        <asp:DropDownList ID="ddlDepartment" runat="server">
            <asp:ListItem Text="Select" Value="" />
            <asp:ListItem Text="HR" Value="HR" />
            <asp:ListItem Text="IT" Value="IT" />
            <asp:ListItem Text="Finance" Value="Finance" />
            <asp:ListItem Text="Sales" Value="Sales" />
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvDept" runat="server"
            ControlToValidate="ddlDepartment"
            InitialValue=""
            ErrorMessage="*Select department" ForeColor="Red" Display="Dynamic" />
    </EditItemTemplate>
</asp:TemplateField>


<asp:TemplateField HeaderText="Employment Type">
    <ItemTemplate><%# Eval("EmploymentType") %></ItemTemplate>
    <EditItemTemplate>
        <asp:DropDownList ID="ddlEmploymentType" runat="server">
            <asp:ListItem Text="Select" Value="" />
            <asp:ListItem Text="Full-Time" Value="Full-Time" />
            <asp:ListItem Text="Part-Time" Value="Part-Time" />
            <asp:ListItem Text="Contract" Value="Contract" />
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvEmpType" runat="server"
            ControlToValidate="ddlEmploymentType"
            InitialValue=""
            ErrorMessage="*Select type" ForeColor="Red" Display="Dynamic" />
    </EditItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Date of Joining">
    <ItemTemplate><%# Eval("DateOfJoining", "{0:yyyy-MM-dd}") %></ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtDOJ" runat="server" Text='<%# Bind("DateOfJoining", "{0:yyyy-MM-dd}") %>' />
        <asp:RequiredFieldValidator ID="rfvDOJ" runat="server"
            ControlToValidate="txtDOJ"
            ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" />
        <asp:RegularExpressionValidator ID="revDOJ" runat="server"
            ControlToValidate="txtDOJ"
            ErrorMessage="Format yyyy-MM-dd"
            ValidationExpression="\d{4}-\d{2}-\d{2}" ForeColor="Red" Display="Dynamic" />
    </EditItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Work Location">
    <ItemTemplate><%# Eval("WorkLocation") %></ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtWorkLocation" runat="server" Text='<%# Bind("WorkLocation") %>' />
        <asp:RequiredFieldValidator ID="rfvLoc" runat="server"
            ControlToValidate="txtWorkLocation"
            ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" />
    </EditItemTemplate>
</asp:TemplateField>

        <asp:CommandField ShowEditButton="True" />
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:Button ID="BtnRemove" runat="server" Text="Remove"
                    CssClass="btn btn-danger btn-sm"
                    CommandName="RemoveRow"
                    CommandArgument='<%# Eval("EmployeeID") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<br />
<asp:Button ID="BtbBack" runat="server" Text="Back" BackColor="#3399FF" OnClick="BtbBack_Click" />
</div>
        </div>
    </form>
</body>
</html>
