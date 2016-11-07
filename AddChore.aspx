<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddChore.aspx.cs" Inherits="AddChore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server">
    <asp:Table class="AddChoreTable" ID="AddChoreTable" runat="server">
        
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">Course Name</asp:TableCell>
            <asp:TableCell runat="server">
                <asp:DropDownList runat="server" id="dd_courseName" AppendDataBoundItems="true">
                    <asp:ListItem Text="choose course" Value="0"/>
                </asp:DropDownList>
            </asp:TableCell>    
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">Due Date</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="txb_dueDate" type="date" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">Submitted</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="txb_submitted" type="date" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">Grade</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="txb_grade" type="number" min="-1" max="100" value=""/></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell ><asp:Button ID="btnSubmitChore" runat="server" Text="Submit Chore" OnClick="SubmitChore"/></asp:TableCell>
            <asp:TableCell ><asp:Label runat="server" ID="lbl_ChoreAdded"></asp:Label></asp:TableCell>  
        </asp:TableRow>
    </asp:Table>

</asp:Content>

