<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewCourses.aspx.cs" Inherits="ViewCourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server">
    <link href="Styles/tables.css" rel="stylesheet" />    
    <asp:Table class="GeneralTable" ID="ViewCoursesTable" runat="server">
        <asp:TableRow runat="server">   
            <asp:TableCell runat="server">Course Name</asp:TableCell>
            <asp:TableCell runat="server">Semester</asp:TableCell>
            <asp:TableCell runat="server">Year</asp:TableCell>
            <asp:TableCell runat="server">Test A Date</asp:TableCell>
            <asp:TableCell runat="server">Test B Date</asp:TableCell>
            <asp:TableCell runat="server">Test C Date</asp:TableCell>
            <asp:TableCell runat="server">Lecturer Name</asp:TableCell>
            <asp:TableCell runat="server">Lecturer Email</asp:TableCell>
            <asp:TableCell runat="server">Lecturer Phone</asp:TableCell>
         </asp:TableRow> 
    </asp:Table>
</asp:Content>