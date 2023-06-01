<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="Doubt_Solving_Website.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center><h2>Register Yourself</h2></center>
        </div>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Username :    "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="username" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="uvalidator" runat="server" ControlToValidate="username" ErrorMessage="Field is Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Email : " ></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="email" runat="server" AutoPostBack="true" OnTextChanged="email_validation_"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="evalidator" runat="server" ControlToValidate="email" ErrorMessage="Field is Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Password : "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="password" runat="server" type="password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="pvalidator" runat="server" ControlToValidate="password" ErrorMessage="Field is Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Confirm Password : " type="password"></asp:Label>
            <asp:TextBox ID="cpassword" runat="server" AutoComplete type="password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="cpvalidator" runat="server" ControlToValidate="cpassword" ErrorMessage="Field is Required" ForeColor="Red">Field is Required</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_click" Text="Register" />
        </p>
        <p>
            Already have an account ?
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Blue" href="logIn.aspx" NavigateUrl="~/LogIn.aspx">Login</asp:HyperLink>
            <br />
        </p>
    </form>
</body>
</html>
