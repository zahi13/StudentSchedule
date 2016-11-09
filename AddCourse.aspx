<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddCourse.aspx.cs" Inherits="AddCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server">
    <asp:Table class="AddCourseTable" ID="AddCourseTable" runat="server" dir="rtl">
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">שם הקורס</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" ID="tbCourseName" type="text" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">סמסטר</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbSemester" type="text" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">שנה</asp:TableCell>
            <asp:TableCell runat="server">
                <asp:DropDownList runat="server" id="dd_year" AppendDataBoundItems="true">
                    <asp:ListItem Text="תשע&quot;ז" Value="0"/>
                </asp:DropDownList>
            </asp:TableCell>    
        </asp:TableRow>      
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">מועד א'</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbTestA" type="date" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">         
            <asp:TableCell runat="server">מועד ב'</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbTestB" type="date" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">         
            <asp:TableCell runat="server">שם המרצה</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbTeacherName" type="text" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">         
            <asp:TableCell runat="server">אימייל המרצה</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbTeacherEmail" type="email" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">         
            <asp:TableCell runat="server">טלפון המרצה</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbTeacherPhone" type="text" /></asp:TableCell>
        </asp:TableRow> 
      
        <asp:TableRow runat="server">
            <asp:TableCell runat="server"><asp:Button ID="btnSubmitCourse" runat="server" Text="שמור קורס" OnClick="submitCourses"/></asp:TableCell>
            <asp:TableCell runat="server"><asp:Label runat="server" ID="lbCourseAdded"></asp:Label></asp:TableCell>
        </asp:TableRow>                
    </asp:Table>

</asp:Content>

