<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCourse.aspx.cs" Inherits="AddCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="table" dir="rtl">
     <asp:Table class="AddCourseTable" ID="AddCourseTable" runat="server" dir="rtl">
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">שם הקורס</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" ID="tbCourseName" type="text" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">סמסטר</asp:TableCell>
            <asp:TableCell runat="server">
                <asp:DropDownList runat="server" id="ddl_Semester" AppendDataBoundItems="true">
                    <asp:ListItem Text="א" Value="0"/>
                    <asp:ListItem Text="ב" Value="1"/>
                    <asp:ListItem Text="קיץ" Value="2"/>
                </asp:DropDownList>
            </asp:TableCell>         
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">שנה</asp:TableCell>
            <asp:TableCell runat="server">
                <asp:DropDownList runat="server" id="ddl_year" AppendDataBoundItems="true">
                    <asp:ListItem Text="תשע&quot;ז" Value="0"/>
                    <asp:ListItem Text="תשע&quot;ח" Value="1"/>
                    <asp:ListItem Text="תשע&quot;ט" Value="2"/>
                    <asp:ListItem Text="תש&quot;פ" Value="3"/>
                    <asp:ListItem Text="תשפ&quot;א" Value="4"/>
                    <asp:ListItem Text="תשפ&quot;ב" Value="5"/>
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
    </div>
    </form>
</body>
</html>
