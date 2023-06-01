<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Doubt_Solving_Website.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <center><h1>LogIn and Connect with Us !!</h1></center>
        <div style="margin-left: 40px">
            <br />
            <asp:Label ID="Label1" runat="server" Text="Email :    "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="elvalidator" runat="server" ControlToValidate="email" ErrorMessage="Field is Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Password : "></asp:Label>
&nbsp;
            <asp:TextBox ID="password" runat="server" type="password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="plvalidator" runat="server" ControlToValidate="password" ErrorMessage="Field is Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_click" Text="Login" />
            <br />
            <br />
            Don&#39;t have an account ?
            <asp:HyperLink ID="registration" runat="server" ForeColor="Blue" href="registration.aspx" NavigateUrl="~/registration.aspx">New User</asp:HyperLink>
            <br />
        </div>
    </form>
</body>
</html>
