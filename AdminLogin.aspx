<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="emp_mg_system.AdminLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            width: 100%;
            font-family: Arial, sans-serif;
            background-image: url('/Scripts/image/bg.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .header-panel {
            width: 100%;
            background-color: #0066FF;
            text-align: center;
            padding: 20px;
            color: white;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
        }

        .content-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            padding: 30px;
        }

        .login-panel {
            background-color: white;
            max-width: 400px;
            padding: 30px;
            border-style: ridge;
            box-shadow: 0px 0px 10px gray;
            text-align: center;
        }

        .login-panel input {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            background-color: #CCCCFF;
            border: 1px solid gray;
            border-radius: 5px;
        }

        .login-panel button {
            width: 100%;
            padding: 10px;
            background-color: #0066FF;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .signup-button {
            background-color: #6699FF !important;
        }

        .forgot-password {
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <div style="background-color:white; max-width: 450px; width: 100%; border-style: ridge; box-shadow: 0px 0px 10px gray;">
            
            <!-- Header -->
            <asp:Panel ID="Panel1" runat="server" CssClass="header-panel">
                <asp:Image ID="Image5" runat="server" Height="90px" ImageUrl="~/Scripts/image/logo3.png" Width="137px" />
            </asp:Panel>

            <!-- Content -->
            <div class="content-wrapper">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div style="text-align: right;">
                            <asp:Button ID="BtnBack" runat="server" BackColor="#0066FF" ForeColor="White" Text="Back" OnClick="BtnBack_Click" />
                        </div>

                        <asp:Panel ID="Panel2" runat="server" CssClass="login-panel" style="box-shadow: none; border: none;">
                            <h3>Admin Login</h3>

                            <!-- Username -->
                            <asp:Image ID="Image6" runat="server" Height="16px" ImageUrl="~/Scripts/image/download.png" Width="21px" />
                            <asp:Label ID="Label3" runat="server" Text="Username"></asp:Label>
                            <asp:TextBox ID="AdmintxtUn" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="AdmintxtUn" ErrorMessage="* Username is required!" ForeColor="Red" />

                            <br /><br />

                            <!-- Password -->
                            <asp:Image ID="Image7" runat="server" Height="16px" ImageUrl="~/Scripts/image/pngtree-vector-lock-icon-png-image_515444.jpg" Width="21px" />
                            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                            <asp:TextBox ID="AdmintxtPs" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="AdmintxtPs" ErrorMessage="* Password is required!" ForeColor="Red" />

                            <br /><br />

                            <!-- Login Button -->
                            <asp:Button ID="loginbt" runat="server" Text="Login" CssClass="login-button" OnClick="loginbt_Click" />

                            <!-- Messages -->
                            <br /><br />
                            <asp:Label ID="lblUsernameMsg" runat="server" ForeColor="Red" Font-Bold="true" />
                            <asp:Label ID="lblPasswordMsg" runat="server" ForeColor="Red" Font-Bold="true" />

                            <!-- Forgot Password -->
                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="forgot-password" NavigateUrl="~/Forgetpass.aspx">
                                Forgot Password? Click here
                            </asp:HyperLink>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>
</html>
