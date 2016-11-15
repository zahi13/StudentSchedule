<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewChores.aspx.cs" Inherits="ViewChores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="padding-left: 100px">
            <ContentTemplate>
                <div id ="viewAllChoresBtn">
              <asp:Button ID="ViewAllChores" CssClass="button button1" runat="server" Text="הצג את כל המטלות" OnClick="ViewAllChores_OnClick"/></div>
              <div id ="viewLastChoresBtn"><asp:Button ID="fewChores" CssClass="button button1" runat="server" Text="מטלות אחרונות" OnClick="fewChores_OnClick" /></div>
                <br/>

                <div id="Gridview" style ="padding:15px; width:80%" dir="rtl">
                 <asp:GridView ID="viewChoresTable" style=" 
                    float: right;
                    margin:20px; 
                    border-collapse: separate; background: #BDBDBD;
                    border-radius:10px;
                    box-shadow:0px 0px 5px rgb(0,0,0);" 
                    runat="server" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="choreID" OnRowDataBound="viewChoresTable_OnRowDataBound" CellPadding="5" ForeColor="#333333" GridLines="None" >
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    
               <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="grade" HeaderText="ציון" SortExpression="grade" />
                <asp:BoundField DataField="Submitted" HeaderText="הוגש" SortExpression="Submitted" dataformatstring="{0:MMMM d, yyyy}" htmlencode="false" />
                <asp:BoundField DataField="dueDate" HeaderText="תאריך הגשה" ReadOnly="True" SortExpression="dueDate" dataformatstring="{0:MMMM d, yyyy}" htmlencode="false"/>
                <asp:BoundField DataField="courseName" HeaderText="שם הקורס" ReadOnly="True" SortExpression="courseName"/>
                <asp:BoundField DataField="choreNum" HeaderText="מס'/שם מטלה" SortExpression="choreNum"/>
              
                </Columns>    
                     <EditRowStyle BackColor="#999999" />
                     <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#673AB7" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                     <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                     <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                     <SortedAscendingCellStyle BackColor="#E9E7E2" />
                     <SortedAscendingHeaderStyle BackColor="#506C8C" />
                     <SortedDescendingCellStyle BackColor="#FFFDF8" />
                     <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                 </asp:GridView>
                    </div>

                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleDB %>" 
                     SelectCommand="SELECT * FROM Chores" 
                     InsertCommand="INSERT INTO Chores VALUES (@choreID, @studentID, @courseName, @dueDate, @Submitted, @grade, @choreNum)" 
                     UpdateCommand="UPDATE Chores SET Submitted = @Submitted, grade = @grade, choreNum = @choreNum WHERE choreID = @choreID"
                     DeleteCommand="DELETE FROM Chores WHERE choreID = @choreID" >
            <DeleteParameters>
                <asp:Parameter Name="studentID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Submitted" Type="DateTime" />
                <asp:Parameter Name="grade" Type="Int32" />
                <asp:Parameter Name="choreNum" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Submitted" Type="DateTime" />
                <asp:Parameter Name="grade" Type="Int32" />
                <asp:Parameter Name="choreNum" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
  </ContentTemplate>
</asp:UpdatePanel>
         <div id="addChorebtn" style ="padding:10px; width: 15%; right: 10%; position: fixed;" >   
            <asp:Button class="button button1" ID="addChoreWindow" runat="server" Text="הוסף מטלה" OnClick="addChoreWindow_Click" />
         </div>
</asp:Content>

