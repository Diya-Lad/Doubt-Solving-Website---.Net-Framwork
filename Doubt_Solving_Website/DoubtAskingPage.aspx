<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoubtAskingPage.aspx.cs" Inherits="Doubt_Solving_Website.DoubtAskingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <center><h1>Ask Your Doubt Here!</h1></center>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Category : "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="0">Select Category</asp:ListItem>
                <asp:ListItem Value="1">Technical</asp:ListItem>
                <asp:ListItem Value="2">Job</asp:ListItem>
                <asp:ListItem Value="3">Social Life</asp:ListItem>
                <asp:ListItem Value="4">Future Study</asp:ListItem>
                <asp:ListItem Value="5">Other</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Question : "></asp:Label>
            <asp:TextBox ID="question" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnPost" runat="server" OnClick="btnPost_click" Text="Post" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
