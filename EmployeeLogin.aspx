  <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeLogin.aspx.cs" Inherits="emp_mng_system.EmployeeLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Login</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
            font-family: Arial, sans-serif;
            background: url('/Scripts/image/bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .main-container {
            max-width: 450px;
            margin: 60px auto;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            overflow: hidden;
        }

        .header-panel {
            background-color: #0066FF;
            text-align: center;
            padding: 20px;
        }

        .header-panel img {
            height: 90px;
            width: 137px;
        }

        .content-wrapper {
            padding: 30px;
        }

        .login-panel h3 {
            margin-bottom: 20px;
            color: #333;
        }

        .login-panel label {
            display: block;
            margin-top: 10px;
            color: #333;
        }

        .login-panel input[type="text"],
        .login-panel input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            background-color: #f1f1ff;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .login-panel .asp-button,
        .login-panel .signup-button {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            border: none;
            border-radius: 5px;
            background-color: #0066FF;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        .login-panel .signup-button {
            background-color: #6699FF;
        }

        .forgot-password {
            display: block;
            text-align: right;
            margin-top: 15px;
            color: #555;
        }

        .back-button {
            text-align: right;
            margin: 10px 0;
        }

        .error-label {
            color: red;
            font-weight: bold;
            display: block;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <div class="main-container">
            <!-- Header -->
            <div class="header-panel">
                <asp:Image ID="Image5" runat="server" ImageUrl="~/Scripts/image/logo3.png" />
            </div>

            <!-- Content -->
            <div class="content-wrapper">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="back-button">
                            <asp:Button ID="BtnBack" runat="server" BackColor="#0066FF" ForeColor="White" Text="Back" OnClick="BtnBack_Click" />
                        </div>

                        <asp:Panel ID="Panel2" runat="server" CssClass="login-panel">
                            <h3>Employee Login</h3>

                            <!-- Email -->
                            <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
                            <asp:TextBox ID="EmptxtEmail" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EmptxtEmail" ErrorMessage="* Email is required!" CssClass="error-label" />

                            <!-- Password -->
                            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                            <asp:TextBox ID="EmptxtPs" runat="server" TextMode="Password" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="EmptxtPs" ErrorMessage="* Password is required!" CssClass="error-label" />

                            <!-- Error Messages -->
                            <asp:Label ID="lblUsernameMsg" runat="server" CssClass="error-label" />
                            <asp:Label ID="lblPasswordMsg" runat="server" CssClass="error-label" />

                            <!-- Buttons -->
                            <asp:Button ID="Emploginbt" runat="server" Text="Login" CssClass="asp-button" OnClick="loginbt_Click" />
                            <asp:Button ID="Empsigntb" runat="server" Text="Sign up" CssClass="signup-button" OnClick="signtb_Click" />

                           <Center> <!-- Forgot Password -->
                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="forgot-password" NavigateUrl="~/Forgetpass.aspx">
                                Forgot Password? Click here
                            </asp:HyperLink> </center>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>
</html>
