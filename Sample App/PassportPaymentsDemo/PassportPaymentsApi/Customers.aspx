<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Customers.aspx.vb" Inherits="PassportPaymentsDemo.Customers" %>

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

            <asp:GridView ID="customersList1" runat="server" AutoGenerateColumns="true"></asp:GridView>

            <br />
            <br />
            <asp:Label ID="customersListResponse" runat="server" Text=""></asp:Label>
        </div>
        <div>
            <h2>PassportPayments SDK - API Samples</h2>
            <h3>Charge</h3>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Select Customer"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="customersListDropDown" runat="server" OnSelectedIndexChanged="customersListDropDownChange" AutoPostBack="true"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Select Card"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="cardsListDropdown" runat="server" OnSelectedIndexChanged="cardsListDropdownChange" AutoPostBack="true"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Amount (In cents)"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="amount" runat="server" Text=""></asp:TextBox></td>
                </tr>
            </table>
            <asp:Button ID="chargeCustomer" OnClick="chargeClick" runat="server" Text="Capture" />

            <br />
            <br />
            <asp:Label ID="chargeResponselbl" runat="server" Text=""></asp:Label>
            <h3>Transactions</h3>
            <asp:Label ID="transactionResponselbl" runat="server" Text=""></asp:Label>
            <div style="height: 300px; overflow: scroll">
                <asp:GridView ID="transactionsList" runat="server" DataKeyNames="id" OnRowCommand="onVoidClick">
                    <Columns>

                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button runat="server" CausesValidation="true" CommandName="Refund"
                                    Text="Refund" CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            
        </div>
    </form>
</body>
</html>
