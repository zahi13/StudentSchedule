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
            runat="server" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="courseID" GridLines="Horizontal" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
    
            <AlternatingRowStyle BackColor="#F7F7F7" />
    
            <Columns>
            <asp:BoundField DataField="CourseName" HeaderText="שם הקורס" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="semester" HeaderText="סמסטר" SortExpression="dueDate" />
            <asp:BoundField DataField="year" HeaderText="שנה אקדמית" SortExpression="year" />
            <asp:BoundField DataField="testA" HeaderText="מועד א" SortExpression="testA"  dataformatstring="{0:MMMM d, yyyy}" htmlencode="false" />
            <asp:BoundField DataField="testB" HeaderText="מועד ב" SortExpression="testB"  dataformatstring="{0:MMMM d, yyyy}" htmlencode="false" />
            <asp:BoundField DataField="teacherName" HeaderText="שם המרצה" SortExpression="teacherName" />
            <asp:BoundField DataField="teacherEmail" HeaderText="אימייל מרצה" SortExpression="teacherEmail" />
            <asp:BoundField DataField="teacherPhone" HeaderText="טלפון מרצה" SortExpression="teacherPhone" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>    
                     

            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#673AB7" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle ForeColor="#4A3C8C" HorizontalAlign="Right" BackColor="#E7E7FF" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
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
    <div style="padding-right: 45%; padding-bottom: 10%;" >
    <asp:Button ID="AddCourse" class="button button1" runat="server" Text="הוסף קורס" OnClick="AddCourse_OnClick" /></div>
</asp:Content>