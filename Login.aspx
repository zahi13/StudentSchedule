<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Styles/main.css" rel="stylesheet" />
    <title></title>
</head>
<body>
<form id="form1" runat="server">
        <div style="padding-top:100px; text-align: center;">
            <table style="margin:auto; border-spacing: 20px 20px; text-align:center; border: solid black 1px; border-radius:5px; background-color:white">
                <tr>
                    <td>
                        <asp:TextBox ID="studentID" runat="server" placeholder="תעודת זהות"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="password" TextMode="Password" runat="server" placeholder="סיסמא"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="loginButton" runat="server" Text="כניסה" OnClick="loginButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                            <asp:Label ID="labelMsg" runat="server" style="color:red; font-weight:bold"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
