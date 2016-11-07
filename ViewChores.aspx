<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewChores.aspx.cs" Inherits="ViewChores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server">
            <asp:Table ID="viewChoresTable" CssClass="viewChoresTable" runat="server">
            <asp:TableHeaderRow runat="server">
                <asp:TableHeaderCell>Chore ID</asp:TableHeaderCell>
                <asp:TableHeaderCell>Course Name</asp:TableHeaderCell>
                <asp:TableHeaderCell>Due Date</asp:TableHeaderCell>
                <asp:TableHeaderCell>Submitted Date</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="grade">Grade</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
    
    <script>
        var i = 1;
        $(document).ready(function () {
            $('.viewChoresTable tr').each(function () {
                var thisRow = $(this);
                $('td', this).each(function () {
                    var value = $(this).text();
                    if (i % 5 == 0) {
                        if (value == -1) {// Changing according to grade
                            thisRow.css("background-color", "Red");
                        } else {
                            thisRow.css("background-color", "Green");                      
                        }
                    }
                    i++;
                });
            });
        });
    </script>
</asp:Content>

