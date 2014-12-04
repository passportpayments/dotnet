<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UpdateCustomer.aspx.vb" Inherits="PassportPaymentsDemo.UpdateCustomer" %>

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
            <h3>Customers List</h3>

            <asp:DropDownList ID="customersListDropDown" runat="server" OnSelectedIndexChanged="customersListDropDownChange" AutoPostBack="true"></asp:DropDownList>

            <br />
            <br />
            <asp:Label ID="customersListResponse" runat="server" Text=""></asp:Label>
        </div>
        <div>
            <h2>PassportPayments SDK - API Samples</h2>
            <table><tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="FirstName"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="fisrtname" runat="server" Text=""></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="LastName"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="lastname" runat="server" Text=""></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Phone"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="phone" runat="server" Text=""></asp:TextBox></td>
                </tr>
                </table>
            <asp:Button runat="server" ID="update" Text="Update" OnClick="updateClick"/>

            <asp:Label ID="responseText" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
