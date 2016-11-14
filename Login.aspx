<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
    <meta charset="utf-8"/>
	<title>מערכת מטלות</title>

	<!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'/>

	
	<!-- Custom Stylesheet -->
	<link href="Styles/style.css" rel="stylesheet" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

</head>

<body>
<form id="form1" runat="server">
              
  <div dir="rtl">
	<div class="container">
		<div class="top">
			<h1 id="title" class="hidden"><span id="logo">THE <span>BOARD</span></span></h1>
		</div>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>התחברות</h2>
			</div>
			<asp:Label for="username" ID="lbl_username" runat="server" Text="שם משתמש: "></asp:Label>
			<br/>
			<asp:TextBox ID="tb_user_name" type="text" runat="server" placeholder="שם משתמש"></asp:TextBox>
			<br/>
			<asp:Label for="password" ID="lbl_password" runat="server" Text="סיסמא:   "></asp:Label>
			<br/>
			<asp:TextBox ID="tb_password" runat="server" type="password" placeholder="סיסמא" OnTextChanged="password_TextChanged" ></asp:TextBox>
			<br/>
            <asp:Button type="submit" ID="btn_enter" runat="server" Text="כניסה"  OnClick="loginButton_Click"/>
            <br />
            <asp:Label class="small" ID="lbl_confirm" runat="server" Text=""></asp:Label>						
		</div>
	</div>
</div>
</form>
</body>

<script>
	//$(document).ready(function () {
    //	$('#logo').addClass('animated fadeInDown');
    //	$("input:text:visible:first").focus();
	//});
	$('#username').focus(function() {
		$('label[for="username"]').addClass('selected');
	});
	$('#username').blur(function() {
		$('label[for="username"]').removeClass('selected');
	});
	$('#password').focus(function() {
		$('label[for="password"]').addClass('selected');
	});
	$('#password').blur(function() {
		$('label[for="password"]').removeClass('selected');
	});
</script>

</html>