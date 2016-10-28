<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddChore.aspx.cs" Inherits="AddChore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server">
    <asp:Table class="AddChoreTable" ID="AddChoreTable" runat="server">
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">Chore Number</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" ID="tbCourseName" type="text" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">Chore Name</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbSemester" type="text" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">Due Date</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbYear" type="text" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">Submitted</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbStartDate" type="date" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">Grade</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="tbEndDate" type="date" /></asp:TableCell>
        </asp:TableRow>
                   
    </asp:Table>
            <asp:Button ID="btnSubmitChore" runat="server" Text="Submit Chore" OnClick="submitChores"/>
            <asp:Label runat="server" ID="lbl_ChoreAdded"></asp:Label>

</asp:Content>

