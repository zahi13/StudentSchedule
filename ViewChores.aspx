<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewChores.aspx.cs" Inherits="ViewChores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server">
            <asp:Table ID="viewChoresTable" CssClass="viewChoresTable" runat="server">
            <asp:TableHeaderRow runat="server">
                <asp:TableHeaderCell>מספר/שם מטלה</asp:TableHeaderCell>
                <asp:TableHeaderCell>שם הקורס</asp:TableHeaderCell>
                <asp:TableHeaderCell>תאריך הגשה</asp:TableHeaderCell>
                <asp:TableHeaderCell>הוגש</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="grade">ציון</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
    <asp:Button ID="addChoreWindow" runat="server" Text="הוסף מטלה" OnClick="addChoreWindow_Click"/>
    <script>
        var i = 1;
        $(document).ready(function () {
            $('.viewChoresTable tr').each(function () {
                var thisRow = $(this);
                $('td', this).each(function () {
                    var value = $(this).text();
                    if (i % 2 == 0) {
                        if (value == "") {// Changing according to grade
                            thisRow.css("background-color", "Red");
                        } else {
                            thisRow.css("background-color", "LightGreen");                      
                        }
                    }
                    i++;
                });
            });
        });
    </script>
</asp:Content>

