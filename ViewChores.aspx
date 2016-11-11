<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewChores.aspx.cs" Inherits="ViewChores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .viewChoresTable {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" Runat="Server">
            <asp:Table ID="viewChoresTable" CssClass="viewChoresTable" runat="server" Width="100%">
            <asp:TableHeaderRow runat="server">
<<<<<<< HEAD
                <asp:TableHeaderCell Width="10%">מספר/שם מטלה</asp:TableHeaderCell>
                <asp:TableHeaderCell Width="35%">שם הקורס</asp:TableHeaderCell>
                <asp:TableHeaderCell Width="20%">תאריך הגשה</asp:TableHeaderCell>
                <asp:TableHeaderCell Width="20%">הוגש</asp:TableHeaderCell>
                <asp:TableHeaderCell Width="15%" ID="grade">ציון</asp:TableHeaderCell>
=======
                <asp:TableHeaderCell>מספר/שם מטלה</asp:TableHeaderCell>
                <asp:TableHeaderCell>שם הקורס</asp:TableHeaderCell>
                <asp:TableHeaderCell>תאריך הגשה</asp:TableHeaderCell>
                <asp:TableHeaderCell >הוגש</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="grade">ציון</asp:TableHeaderCell>
>>>>>>> origin/master
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
    </script>
</asp:Content>

