<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="answerForm.aspx.cs" Inherits="Doubt_Solving_Website.answerForm" %>

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
            <p>
                <h2 id="question"><asp:Label ID="Question" runat="server" Text="Label"></asp:Label></h2>
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                
                <br />
                <asp:TextBox ID="ans" runat="server" style="margin-bottom: 0px"></asp:TextBox>
&nbsp;
                <asp:Button ID="answer" runat="server" Text="Post Answer" OnClick="clickPostAns" />
                
                <br />
                <br />
                <br />
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <b><asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' /></b>
                        &nbsp;&nbsp;<asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' />
                        <br />
                 
                        <asp:Label ID="answerLabel" runat="server" Text='<%# Eval("answer") %>' />
                        <br />
                        
                        
                        <br />
                        
<br />
                    </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [answer], [time], [username] FROM [Answers] WHERE ([que_id] = @que_id)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="que_id" QueryStringField="que" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
                <br />
            </p>
        </div>
    </form>
    
</body>
</html>
