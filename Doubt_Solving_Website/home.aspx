<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Doubt_Solving_Website.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">SD</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.aspx">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="UserEdit.aspx">Edit Profile</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logIn.aspx">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logIn.aspx" >Log out</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
    <form id="form1" runat="server">
        <div>
        <center><h1>Ask Your Doubt Here!</h1></center>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Category : "></asp:Label>
            <asp:DropDownList ID="typeDoubt" runat="server" OnSelectedIndexChanged="changeCategory" OnTextChanged="changeCategory" AutoPostBack="True">
                <asp:ListItem Value="1">Technical</asp:ListItem>
                <asp:ListItem Value="2">Job</asp:ListItem>
                <asp:ListItem Value="3">Social Life</asp:ListItem>
                <asp:ListItem Value="4">Future Study</asp:ListItem>
                <asp:ListItem Value="5">Other</asp:ListItem>
            </asp:DropDownList>
            <asp:RangeValidator ID="categoryv" runat="server" ControlToValidate="typeDoubt" ErrorMessage="Please Select category" MaximumValue="5" MinimumValue="1"></asp:RangeValidator>
            &nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="requiredCategory" runat="server" ControlToValidate="typeDoubt" ErrorMessage="Please choose the category.">Please choose the category.</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Question : "></asp:Label>
            <asp:TextBox ID="question" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnPost" runat="server" OnClick="btnPost_click" Text="Post" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <h3>Find your Doubt !!</h3>
            <p>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                    <ItemTemplate>
                       <asp:Label ID="QuestionLabel" runat="server" Text='<%# Eval("Question") %>' />
                        <asp:HiddenField ID="QuestionId" runat="server" value='<%# Eval("id") %>'></asp:HiddenField>
                        <asp:LinkButton ID="ansBtn" runat="server" OnClick="ansBtnSubmit" Text="Answer"/>
                        <br />
                        <br />
<br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Doubts]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Doubts] WHERE ([type] = @type)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="typeDoubt" DefaultValue="8" Name="type" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>
            <p>
                &nbsp;</p>
        </div>
        </div>
    </form>
</body>
</html>
