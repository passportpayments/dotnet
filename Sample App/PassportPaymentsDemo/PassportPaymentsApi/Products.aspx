<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Products.aspx.vb" Inherits="PassportPaymentsDemo.Products" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PassportPayments SDK Demo</title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" type="text/css" href="../Styles/sdk.css" />
</head>
<body>
    <form id="form1" runat="server">
        <a href="../index.aspx">Home</a>
        <div>
            <h3>Products List</h3>

            <asp:GridView ID="productsList" runat="server" AutoGenerateColumns="true"></asp:GridView>

            <br />
            <br />
            <asp:Label ID="productsListResponse" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
