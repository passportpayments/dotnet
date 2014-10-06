<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Charge.aspx.vb" Inherits="PassportPaymentsDemo.Charge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PassportPayments SDK Demo</title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" type="text/css" href="sdk.css" />
</head>
<body>
    <form runat="server">
        <h2>PassportPayments SDK - API Samples</h2>
        <h3>Customers List</h3>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Customer"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="customersList" runat="server" OnSelectedIndexChanged="customersListChange" AutoPostBack="true"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Customer"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="cardsList" runat="server" OnSelectedIndexChanged="cardsListChange" AutoPostBack="true"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Amount (In cents)"></asp:Label></td>
                <td>
                    <asp:TextBox ID="amount" runat="server" Text=""></asp:TextBox></td>
            </tr>
        </table>
        <asp:Button ID="chargeCustomer" OnClick="chargeClick" runat="server" Text="Capture" />

        <br />
        <br />
        <asp:Label ID="responseText" runat="server" Text=""></asp:Label>

    </form>
</body>
</html>
