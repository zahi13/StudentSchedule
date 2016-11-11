<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewCourses.aspx.cs" Inherits="ViewCourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server">
    <link href="Styles/tables.css" rel="stylesheet" />    
    
    
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>              
                 <asp:GridView ID="viewChoresTable" runat="server" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="courseID">
    
               <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="CourseName" HeaderText="שם הקורס" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="semester" HeaderText="סמסטר" SortExpression="dueDate" />
                    <asp:TemplateField HeaderText="שנה אקדמית" SortExpression="year">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("year") %>'>
                            <asp:ListItem>תשע"ח</asp:ListItem>
                            <asp:ListItem>תשע"ט</asp:ListItem>
                            <asp:ListItem>תש"פ</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("year") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("year") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="testA" HeaderText="מועד א" SortExpression="testA" />
                <asp:BoundField DataField="testB" HeaderText="מועד ב" SortExpression="testB" />
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
    
    
    
    
    
    

    <%--<asp:Table class="GeneralTable" ID="ViewCoursesTable" runat="server" dir="rtl">
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
    </asp:Table>--%>
    <asp:Button ID="AddCourse" runat="server" Text="הוסף קורס" OnClick="AddCourse_OnClick"/>
</asp:Content>