<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddChore.aspx.cs" Inherits="AddChore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="table" dir="rtl">
     <asp:Table class="AddChoreTable" ID="AddChoreTable" runat="server" dir="rtl">
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">מספר/שם מטלה</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="txb_choreNum" type="text" /></asp:TableCell>
        </asp:TableRow>
        
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">שם הקורס</asp:TableCell>
            <asp:TableCell runat="server">
                <asp:DropDownList runat="server" id="dd_courseName" AppendDataBoundItems="true">
                    <asp:ListItem Text="בחר קורס" Value="0"/>
                </asp:DropDownList>
            </asp:TableCell>    
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">תאריך הגשה</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="txb_dueDate" type="date" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">הוגש</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="txb_submitted" type="date" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server"> 
            <asp:TableCell runat="server">ציון</asp:TableCell>
            <asp:TableCell runat="server"><asp:TextBox runat="server" id="txb_grade" type="number" min="-1" max="100" value=""/></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell ><asp:Button ID="btnSubmitChore" runat="server" Text="קליטת מטלה" OnClick="SubmitChore"/></asp:TableCell>
            <asp:TableCell ><asp:Label runat="server" ID="lbl_ChoreAdded"></asp:Label></asp:TableCell>  
        </asp:TableRow>
    </asp:Table>
    </div>
    </form>
</body>
</html>
