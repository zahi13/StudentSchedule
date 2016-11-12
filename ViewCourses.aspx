<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewCourses.aspx.cs" Inherits="ViewCourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      <ContentTemplate>              
        <asp:GridView ID="viewChoresTable"  dir="rtl" style=" 
           margin:50px auto; 
            border-collapse: separate;
            background:#fff;
            border-radius:5px;
            margin:50px auto;
            box-shadow:0px 0px 5px rgba(0,0,0,0.3);"
            runat="server" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="courseID">
    
            <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="CourseName" HeaderText="שם הקורס" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="semester" HeaderText="סמסטר" SortExpression="dueDate" />
            <asp:BoundField DataField="year" HeaderText="שנה אקדמית" SortExpression="year" />
            <asp:BoundField DataField="testA" HeaderText="מועד א" SortExpression="testA"  dataformatstring="{0:MMMM d, yyyy}" htmlencode="false" />
            <asp:BoundField DataField="testB" HeaderText="מועד ב" SortExpression="testB"  dataformatstring="{0:MMMM d, yyyy}" htmlencode="false" />
            <asp:BoundField DataField="teacherName" HeaderText="שם המרצה" SortExpression="teacherName" />
            <asp:BoundField DataField="teacherEmail" HeaderText="אימייל מרצה" SortExpression="teacherEmail" />
            <asp:BoundField DataField="teacherPhone" HeaderText="טלפון מרצה" SortExpression="teacherPhone" />
            </Columns>    
                     

            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleDB %>" DeleteCommand="DELETE FROM [Courses] WHERE [courseID] = @courseID" 
            InsertCommand="INSERT INTO [Courses] ([courseID], [courseName], [semester], [year], [testA], [testB], [teacherName] [teacherEmail] [teacherPhone]) VALUES (@courseID, @courseName, @semester, @year, @testA, @testB, @teacherName @teacherEmail @teacherPhone)" 
            SelectCommand="SELECT * FROM [Courses]" UpdateCommand="UPDATE [Courses] SET [courseID]=@courseID, [courseName] = @courseName, [semester] = @semester, [year] = @year, [testA] = @testA, [testB] = @testB, [teacherName] = @teacherName, [teacherEmail] = @teacherEmail, [teacherPhone] = @teacherPhone WHERE [courseID] = @courseID">
            <DeleteParameters>
              <asp:Parameter Name="courseID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="courseID" Type="Int32" />
                <asp:Parameter Name="courseName" Type="String" />
                <asp:Parameter Name="semester" Type="String" />
                <asp:Parameter Name="year" Type="String" />
                <asp:Parameter Name="testA" Type="DateTime" />
                <asp:Parameter Name="testB" Type="DateTime" />
                <asp:Parameter Name="teacherName" Type="String" />
                <asp:Parameter Name="teacherEmail" Type="String" />
                <asp:Parameter Name="teacherPhone" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="courseID" Type="Int32" />
                <asp:Parameter Name="courseName" Type="String" />
                <asp:Parameter Name="semester" Type="String" />
                <asp:Parameter Name="year" Type="String" />
                <asp:Parameter Name="testA" Type="DateTime" />
                <asp:Parameter Name="testB" Type="DateTime" />
                <asp:Parameter Name="teacherName" Type="String" />
                <asp:Parameter Name="teacherEmail" Type="String" />
                <asp:Parameter Name="teacherPhone" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
      </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Button ID="AddCourse" runat="server" Text="הוסף קורס" OnClick="AddCourse_OnClick"/>
</asp:Content>