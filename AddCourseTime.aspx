<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCourseTime.aspx.cs" Inherits="AddCourseTime" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="table" dir="rtl">
     <asp:Table class="AddChoreTable" ID="AddCoursesTimeTable" runat="server" dir="rtl">
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">שם הקורס</asp:TableCell>
            <asp:TableCell runat="server">יום בשבוע</asp:TableCell>
            <asp:TableCell runat="server">שעת התחלה</asp:TableCell>
            <asp:TableCell runat="server">שעת סיום</asp:TableCell>
        </asp:TableRow>
        
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">
                <asp:SqlDataSource runat="server"
                                   ID="CoursesTime"
                                   DataSourceMode="DataReader"
                                   ConnectionString="<%$ ConnectionStrings:ScheduleDB %>"
                                   SelectCommand="SELECT courseName FROM Courses"/>
                <asp:DropDownList runat="server"  ID="ddlCourseTime"
                             DataSourceID="CoursesTime" 
                             DataTextField = "CourseName"
                             DataValueField = "CourseName" />
            </asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="datePicker" type="date" value="" /></asp:TableCell>
            <asp:TableCell runat="server">
                <asp:DropDownList runat="server" id="ddl_StartTime" AppendDataBoundItems="true">
                    <asp:ListItem Text="08:00" Value="0"/>
                    <asp:ListItem Text="09:00" Value="1"/>
                    <asp:ListItem Text="10:00" Value="2"/>
                    <asp:ListItem Text="11:00" Value="3"/>
                    <asp:ListItem Text="12:00" Value="4"/>
                    <asp:ListItem Text="13:00" Value="5"/>
                    <asp:ListItem Text="14:00" Value="6"/>
                    <asp:ListItem Text="15:00" Value="7"/>
                    <asp:ListItem Text="16:00" Value="8"/>
                    <asp:ListItem Text="17:00" Value="9"/>
                    <asp:ListItem Text="18:00" Value="10"/>
                    <asp:ListItem Text="19:00" Value="11"/>
                    <asp:ListItem Text="20:00" Value="12"/>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell runat="server">
                <asp:DropDownList runat="server" id="ddl_EndTime" AppendDataBoundItems="true">
                    <asp:ListItem Text="09:00" Value="0"/>
                    <asp:ListItem Text="10:00" Value="1"/>
                    <asp:ListItem Text="11:00" Value="2"/>
                    <asp:ListItem Text="12:00" Value="3"/>
                    <asp:ListItem Text="13:00" Value="4"/>
                    <asp:ListItem Text="14:00" Value="5"/>
                    <asp:ListItem Text="15:00" Value="6"/>
                    <asp:ListItem Text="16:00" Value="7"/>
                    <asp:ListItem Text="17:00" Value="8"/>
                    <asp:ListItem Text="18:00" Value="9"/>
                    <asp:ListItem Text="19:00" Value="10"/>
                    <asp:ListItem Text="20:00" Value="11"/>
                    <asp:ListItem Text="21:00" Value="12"/>
                </asp:DropDownList>
            </asp:TableCell>        
        </asp:TableRow>
         
         <asp:TableRow runat="server"> 
            <asp:TableCell runat="server"><asp:Button ID="btnSaveCoursesTime" runat="server" Text="שמור שיעור" OnClick="btnSaveCoursesTime_OnClick"/></asp:TableCell>
            <asp:TableCell runat="server"><asp:Label ID="lblSaveCourseTime" runat="server" Text=""></asp:Label></asp:TableCell>
        </asp:TableRow>

    </asp:Table>
    </div>
    </form>
</body>
</html>
