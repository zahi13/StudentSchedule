<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewChores.aspx.cs" Inherits="ViewChores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="padding-left: 100px">
            <ContentTemplate>
                <div id="Gridview" style ="padding:0px; width:100%; overflow:scroll; " dir="rtl"   >
                 <asp:GridView ID="viewChoresTable"  style="width: 100%; overflow:auto; margin:15px; border-collapse: separate; background: #BDBDBD; border-radius:5px; box-shadow:0px 0px 5px rgb(0,0,0);" 
                    runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="choreID" OnRowDataBound="viewChoresTable_OnRowDataBound" CellPadding="5" ForeColor="#333333" GridLines="None" DataSourceID="SqlDataSource1" >
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle CssClass="GridViewEditRow" /> 
               <Columns>
                    <asp:TemplateField HeaderText="שם הקורס" SortExpression="courseName" ItemStyle-Width="1%">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("courseName") %>'  ></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("courseName") %>'  ></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="1%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="תאריך קבלה" SortExpression="dueDate" ItemStyle-Width="5%">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("dueDate") %>' ></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("dueDate") %>' ></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="5%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="תאריך הגשה" SortExpression="Submitted " ItemStyle-Width="5%">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Submitted") %>' ></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Submitted") %>' ></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="5%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ציון" SortExpression="grade" ItemStyle-Width="0.5%">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("grade") %>' ></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("grade") %>' ></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="0.5%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="שם/ מספר מטלה" SortExpression="choreNum " ItemStyle-Width="0.5%">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("choreNum") %>' ></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("choreNum") %>' ></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="0.5%" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="2%">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="עדכן"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="בטל"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="ערוך"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="מחק"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="2%" />
                    </asp:TemplateField>
                </Columns>    
                     <EditRowStyle BackColor="#999999" CssClass="GridViewEditRow"/>
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
  </ContentTemplate>
</asp:UpdatePanel>

         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleDB %>" DeleteCommand="DELETE FROM [Chores] WHERE [choreID] = @choreID" InsertCommand="INSERT INTO [Chores] ([studentID], [courseName], [dueDate], [Submitted], [grade], [choreNum]) VALUES (@studentID, @courseName, @dueDate, @Submitted, @grade, @choreNum)" SelectCommand="SELECT * FROM [Chores]" UpdateCommand="UPDATE [Chores] SET [studentID] = @studentID, [courseName] = @courseName, [dueDate] = @dueDate, [Submitted] = @Submitted, [grade] = @grade, [choreNum] = @choreNum WHERE [choreID] = @choreID">
             <DeleteParameters>
                 <asp:Parameter Name="choreID" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="studentID" Type="Int32" />
                 <asp:Parameter Name="courseName" Type="String" />
                 <asp:Parameter DbType="Date" Name="dueDate" />
                 <asp:Parameter DbType="Date" Name="Submitted" />
                 <asp:Parameter Name="grade" Type="Int32" />
                 <asp:Parameter Name="choreNum" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="studentID" Type="Int32" />
                 <asp:Parameter Name="courseName" Type="String" />
                 <asp:Parameter DbType="Date" Name="dueDate" />
                 <asp:Parameter DbType="Date" Name="Submitted" />
                 <asp:Parameter Name="grade" Type="Int32" />
                 <asp:Parameter Name="choreNum" Type="String" />
                 <asp:Parameter Name="choreID" Type="Int32" />
             </UpdateParameters>
      </asp:SqlDataSource>

         <div id="addChorebtn" style ="padding-top:5%; padding-left: 65%; width: 15%; right: 10%; position: relative; bottom: 5%; " dir="rtl">   
            <asp:Button class="button button1" ID="addChoreWindow" runat="server" Text="הוסף מטלה" OnClick="addChoreWindow_Click" />
         </div>
</asp:Content>

