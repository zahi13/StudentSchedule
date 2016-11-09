<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Styles/main.css" rel="stylesheet" />
    <title></title>
<style type="text/css">
        #form1 {
            width: auto;
            margin-top: 84px;
            text-align: center;
            
        }
       #login{
           
            background: transparent\9;
            background-size: 100%;
            background-repeat: no-repeat;
            font-weight: bold;
            font-family: serif;
            color: #0000BB;
            

        }
        #box{
            border: 2px solid #CC0033;
            width: 30%;
            margin: auto;
            right: 50%;
            padding-top: 10px;
            padding-bottom: 10px;
            
        }
    </style>
</head>
<body>
     <form id="form1" runat="server">
              
        <div dir="rtl">
                 
            <div id="login">
                <br />
                <br />
                <div id="box" >
                <asp:Label ID="lbl_BOARD" runat="server" Text="ברוכים הבאים ל THE BOARD" style="font-size:25px" ForeColor="black"  ></asp:Label>
            <br />
            <br />
            <br />
             <asp:Label ID="lbl_username" runat="server" Text="שם משתמש: "></asp:Label>
            <asp:TextBox ID="tb_user_name" runat="server" placeholder="שם משתמש" style="margin-right: 7px" ></asp:TextBox>
            <br />
            <br />
             <asp:Label ID="lbl_password" runat="server" Text="סיסמא:   "></asp:Label>
            <asp:TextBox ID="tb_password" runat="server" type="password" placeholder="סיסמא" OnTextChanged="password_TextChanged" style="margin-right: 40px" ></asp:TextBox>
            <br /> 
            <br />           
            <asp:Button ID="btn_enter" runat="server" Text="כניסה"  OnClick="loginButton_Click"/>
            <br />
            <br />
            <asp:Label ID="lbl_confirm" runat="server" Text=""></asp:Label>
            <br />

                </div>
                <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
               
            </div>
    </div>
    </form>
    </body>

</html>
