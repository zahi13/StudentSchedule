<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddCourse.aspx.cs" Inherits="AddCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server">
    <asp:Table class="AddCourseTable" ID="AddCourseTable" runat="server">
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">Course Name</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" ID="tbCourseName" type="text" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">Semester</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbSemester" type="text" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">Year</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbYear" type="text" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">Start Date</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbStartDate" type="date" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">End Date</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbEndDate" type="date" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">Test A</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbTestA" type="date" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">         
            <asp:TableCell runat="server">Test B</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbTestB" type="date" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">         
            <asp:TableCell runat="server">Teacher's Name</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbTeacherName" type="text" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">         
            <asp:TableCell runat="server">Teacher's eMail</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbTeacherEmail" type="email" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">         
            <asp:TableCell runat="server">Teacher's Phone</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbTeacherPhone" type="text" /></asp:TableCell>
        </asp:TableRow>              
    </asp:Table>
            <asp:Button ID="btnSubmitCourse" runat="server" Text="Submit Course" OnClick="submitCourses"/></asp:TableCell>
            <asp:Label runat="server" ID="lbCourseAdded"></asp:Label>

</asp:Content>

