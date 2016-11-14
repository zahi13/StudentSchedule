<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AboutPage.aspx.cs" Inherits="AboutPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server">
 <body> 
     <div style="padding-left: 150px;">
        <div id="fb-root"></div>
            <script>(function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8";
                fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));
            </script>
        

        <asp:Table runat="server">
            
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"><img src="https://fbcdn-sphotos-g-a.akamaihd.net/hphotos-ak-xta1/v/t1.0-9/13631451_10154235874544361_6900793237695831939_n.jpg?oh=0ce5ae932e7011a951fd3b4a29b02976&oe=58C5D136&__gda__=1489911675_2133188173e321d874638a6ea03fab78" style="width:80px; height: 80px;"></asp:TableCell>
            <asp:TableCell runat="server"><h4>Ira Murachver</h4></asp:TableCell>
            <asp:TableHeaderCell runat="server"><h4>Design, Planning, Programming</h4></></asp:TableHeaderCell> 
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"></asp:TableCell>
           <asp:TableCell runat="server"><div class="fb-follow" data-href="https://www.facebook.com/irenam99?fref=ts" data-layout="standard" data-size="large" data-show-faces="true"></div></asp:TableCell>
           <asp:TableCell runat="server"></asp:TableCell>
        </asp:TableRow>
            
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"><img src="https://scontent-fra3-1.xx.fbcdn.net/v/t1.0-9/12919629_10209213246111390_6358920037022081559_n.jpg?oh=d78228a718bec1b3fa73b621a176c1de&oe=58BDBFEC" style="width:80px; height: 80px;"></asp:TableCell>
            <asp:TableCell runat="server"><h4>Zahi Lazerovich</h4></asp:TableCell>
            <asp:TableHeaderCell runat="server"><h4>Programming, API master, Bug fix</h4></></asp:TableHeaderCell> 
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"></asp:TableCell>
            <asp:TableCell runat="server"><div class="fb-follow" data-href="https://www.facebook.com/zahi.lazerovich" data-layout="standard" data-size="large" data-show-faces="true"></div></asp:TableCell>
           <asp:TableCell runat="server"></asp:TableCell>
        </asp:TableRow>
            
            

        </asp:Table>
    </div>

</body> 
</asp:Content>

