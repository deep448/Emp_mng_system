<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgetpass.aspx.cs" Inherits="emp_mng_system.Forgetpass" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forget Password</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .header-panel {
            background-color: #293A4B;
            color: white;
            font-size: 24px;
            font-weight: bold;
            height: 60px;
            line-height: 60px;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-container {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 12px;
            background-color: #f9f9f9;
        }

        .form-container h3 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 8px;
        }

        .form-group .asp-validator {
            color: red;
            display: block;
            margin-top: 5px;
        }

        .form-button {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" CssClass="header-panel">
            Deep Ltd. Company
        </asp:Panel>

        <div class="form-container">
            <h3>Forget Password</h3>
<div>

    <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300"></asp:Label>

</div>
            <!-- Email -->
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Email is required!" CssClass="asp-validator" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                    ControlToValidate="txtEmail"
                    ErrorMessage="Enter a valid email (e.g., user@example.com)"
                    ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" CssClass="asp-validator" />
            </div>

            <!-- Phone -->
            <div class="form-group">
                <asp:Label ID="lblPhone" runat="server" Text="Phone No."></asp:Label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
                    ErrorMessage="Phone number is required!" CssClass="asp-validator" />
                <asp:RegularExpressionValidator ID="revPhone" runat="server"
                    ControlToValidate="txtPhone"
                    ErrorMessage="Enter a valid phone number (10 digits)"
                    ValidationExpression="^\d{10}$" CssClass="asp-validator" />
            </div>
            <div class="form-group">
    <asp:Label ID="Label1" runat="server" Text="Old Password"></asp:Label>
    <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPassword"
        ErrorMessage="Old Password is required!" CssClass="asp-validator" />
</div>

            <!-- New Password -->
            <div class="form-group">
                <asp:Label ID="lblNewPassword" runat="server" Text="New Password"></asp:Label>
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="txtNewPassword"
                    ErrorMessage="New Password is required!" CssClass="asp-validator" />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtOldPassword" ControlToValidate="txtNewPassword" ErrorMessage="Please Enter Matched Password!" ForeColor="#FF3300"></asp:CompareValidator>
            </div>

            <!-- Button -->
            <div class="form-button">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" BackColor="#3333CC" ForeColor="#CCCCCC" />

                <br />
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnResetPassword_Click"
    BackColor="#666666" ForeColor="Black" Style="height: 29px" CausesValidation="false" />
   </div>
        </div>
    </form>
</body>
</html>
