<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewCourses.aspx.cs" Inherits="ViewCourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server">
    <link href="Styles/tables.css" rel="stylesheet" />    
    <asp:Table class="GeneralTable" ID="ViewCoursesTable" runat="server" dir="rtl">
        <asp:TableRow runat="server">   
            <asp:TableCell runat="server">שם הקורס</asp:TableCell>
            <asp:TableCell runat="server">סמסטר</asp:TableCell>
            <asp:TableCell runat="server">שנה אקדמית</asp:TableCell>
            <asp:TableCell runat="server">מועד א'</asp:TableCell>
            <asp:TableCell runat="server">מועד ב'</asp:TableCell>
            <asp:TableCell runat="server">שם המרצה</asp:TableCell>
            <asp:TableCell runat="server">אימייל המרצה</asp:TableCell>
            <asp:TableCell runat="server">טלפון המרצה</asp:TableCell>
         </asp:TableRow> 
    </asp:Table>
    <asp:Button ID="Button1" runat="server" Text="הוסף קורס" />
</asp:Content>