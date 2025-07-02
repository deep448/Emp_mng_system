<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginType.aspx.cs" Inherits="emp_mng_system.LoginType" %>

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
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }

        .header-panel {
            width: 100%;
            background-color: #0066FF;
            text-align: center;
            padding: 20px;
            color: white;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
        }

        .header-panel h2 {
            margin-top: 10px;
        }

        .main-section {
            background-image: url('/Scripts/image/bg.jpg'); /* Fixed image path */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: calc(100vh - 130px); /* Adjusted height based on header */
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .content-wrapper {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            width: 100%;
            max-width: 500px;
            padding: 30px 20px;
        }

        .login-panel {
            background-color: white;
            width: 100%;
            padding: 30px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.15);
            text-align: center;
        }

        .login-panel h3 {
            margin-bottom: 20px;
            color: #333;
        }

        .login-panel input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            background-color: #CCCCFF;
            border: 1px solid gray;
            border-radius: 5px;
        }

        .login-panel button,
        .login-panel input[type="submit"],
        .login-panel .asp-button {
            width: 100%;
            padding: 10px;
            background-color: #0066FF;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .signup-button {
            background-color: #6699FF !important;
        }

        .forgot-password {
            display: block;
            margin-top: 10px;
        }

        @media screen and (max-width: 500px) {
            .login-panel {
                padding: 20px;
            }

            .header-panel h2 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />

        <!-- Header -->
        <asp:Panel ID="Panel1" runat="server" CssClass="header-panel">
            <asp:Image ID="Image1" runat="server" Height="90px" ImageUrl="~/Scripts/image/logo3.png" Width="137px" />
        </asp:Panel>

        <!-- Main Section to hold login box -->
        <div class="main-section">
            <div class="content-wrapper">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel2" runat="server" CssClass="login-panel">
                            <h3>Login Type</h3>
                            <asp:Button ID="btnAdmin" runat="server" Text="Admin Login" CssClass="asp-button" OnClick="btnAdmin_Click" />
                            <asp:Button ID="btnEmp" runat="server" Text="Employee Login" CssClass="asp-button signup-button" OnClick="btnEmp_Click" />
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>
</html>
