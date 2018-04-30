<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EVerify.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center; margin-top:25px">
        Form I-9
        <br />
        Test Login
    </div>
    <div style="text-align:center; margin-top:25px">
        Please Enter Login Name: <asp:TextBox ID="txtLoginName" runat="server" Text="rlandow"></asp:TextBox>
    </div>
    <div style="text-align:center; margin-top:25px">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" style="height: 26px" />
    </div>    
    </form>
</body>
</html>
