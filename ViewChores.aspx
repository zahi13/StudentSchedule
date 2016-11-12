<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewChores.aspx.cs" Inherits="ViewChores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .viewChoresTable {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server" dir="rtl">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
              <asp:Button ID="ViewAllChores" runat="server" Text="הצג את כל המטלות" OnClick="ViewAllChores_OnClick"/>
              <asp:Button ID="fewChores" runat="server" Text="מטלות אחרונות" OnClick="fewChores_OnClick" />
                <br/>
                 <asp:GridView ID="viewChoresTable" style=" 
                    margin:50px auto; 
                    border-collapse: separate;
                    background:#fff;
                    border-radius:5px;
                    margin:50px auto;
                    box-shadow:0px 0px 5px rgba(0,0,0,0.3);" 
                    runat="server" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="choreID" OnRowDataBound="viewChoresTable_OnRowDataBound" >
    
               <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="choreNum" HeaderText="מס'/שם מטלה" ReadOnly="True" SortExpression="choreNum" />
                <asp:BoundField DataField="courseName" HeaderText="שם הקורס" ReadOnly="True" SortExpression="courseName" />
                <asp:BoundField DataField="dueDate" HeaderText="תאריך הגשה" SortExpression="dueDate" dataformatstring="{0:MMMM d, yyyy}" htmlencode="false" />
                <asp:BoundField DataField="Submitted" HeaderText="הוגש" SortExpression="Submitted" dataformatstring="{0:MMMM d, yyyy}" htmlencode="false" />
                <asp:BoundField DataField="grade" HeaderText="ציון" SortExpression="grade" />
              
               
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
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleDB %>" DeleteCommand="DELETE FROM [Chores] WHERE [choreID] = @choreID" 
                     InsertCommand="INSERT INTO [chores] ([choreID], [studentID], [courseName], [dueDate], [Submitted], [grade], [choreNum]) VALUES (@choreID, @studentID, @courseName, @dueDate, @Submitted, @grade, @choreNum)" 
                     SelectCommand="SELECT * FROM [Chores]" UpdateCommand="UPDATE [Chores] SET [choreID]=@choreID, [studentID] = @studentID, [courseName] = @courseName, [dueDate] = @dueDate, [Submitted] = @Submitted, [grade] = @grade, [choreNum] = @choreNum WHERE [choreID] = @choreID">
            <DeleteParameters>
                <asp:Parameter Name="studentID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="studentID" Type="Int32" />
                <asp:Parameter Name="courseName" Type="String" />
                <asp:Parameter Name="dueDate" Type="DateTime" />
                <asp:Parameter Name="Submitted" Type="DateTime" />
                <asp:Parameter Name="grade" Type="Int32" />
                <asp:Parameter Name="choreNum" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="studentID" Type="Int32" />
                <asp:Parameter Name="courseName" Type="String" />
                <asp:Parameter Name="dueDate" Type="DateTime" />
                <asp:Parameter Name="Submitted" Type="DateTime" />
                <asp:Parameter Name="grade" Type="Int32" />
                <asp:Parameter Name="choreNum" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
  </ContentTemplate>
</asp:UpdatePanel>
            
    <asp:Button ID="addChoreWindow" runat="server" Text="הוסף מטלה" OnClick="addChoreWindow_Click"/>
    <%--<script>
        var i = 1;
        $(document).ready(function () {
            $('.viewChoresTable tr').each(function () {
                var thisRow = $(this);
                $('td', this).each(function () {
                    var value = $(this).text();
                    if (i % 4 == 0) {
                        if (value == null || value == "") {// Changing according to grade
                            thisRow.css("background-color", "Red");
                        } else {
                            thisRow.css("background-color", "LightGreen");                      
                        }
                    }
                    i++;
                    if (i > 5) {
                        i = 1;
                    }
                });
            });
        });
    </script>--%>
</asp:Content>

