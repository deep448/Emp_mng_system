<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeSignUp.aspx.cs" Inherits="emp_mng_system.EmployeeSignUp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Signup</title>
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
            <h3>Employee Signup</h3>

            <!-- Email -->
            <div class="form-group">
                                <asp:Label ID="Labelmssg" runat="server" ForeColor="Red"></asp:Label>
                                <br />
                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="EmptxtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="EmptxtEmail"
                    ErrorMessage="Email is required!" CssClass="asp-validator" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                    ControlToValidate="EmptxtEmail"
                    ErrorMessage="Enter a valid email (e.g., user@example.com)"
                    ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" CssClass="asp-validator" />
            </div>

            <!-- Phone -->
            <div class="form-group">
                <asp:Label ID="lblPhone" runat="server" Text="Phone No."></asp:Label>
                <asp:TextBox ID="EmptxtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="EmptxtPhone"
                    ErrorMessage="Phone number is required!" CssClass="asp-validator" />
                <asp:RegularExpressionValidator ID="revPhone" runat="server"
                    ControlToValidate="EmptxtPhone"
                    ErrorMessage="Enter a valid phone number (10 digits)"
                    ValidationExpression="^\d{10}$" CssClass="asp-validator" />
            </div>

            <!-- Password -->
            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="EmptxtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="EmptxtPassword"
                    ErrorMessage="Password is required!" CssClass="asp-validator" />
            </div>

            <!-- Confirm Password -->
            <div class="form-group">
                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                <asp:TextBox ID="EmptxtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server"
                    ControlToValidate="EmptxtConfirmPassword" ErrorMessage="Confirm Password is required!"
                    CssClass="asp-validator" />
                <asp:CompareValidator ID="cvConfirmPassword" runat="server"
                    ControlToValidate="EmptxtConfirmPassword" ControlToCompare="EmptxtPassword"
                    ErrorMessage="Passwords do not match!" CssClass="asp-validator" />
            </div>

            <!-- Button -->
            <div class="form-button">
                <asp:Button ID="btnSignup" runat="server" Text="Sign Up" OnClick="btnSignup_Click" />
            </div>
        </div>
    </form>
</body>
</html>
