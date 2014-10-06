<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="PassportPaymentsDemo.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PassportPayments SDK Demo</title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" type="text/css" href="Styles/sdk.css" />
</head>
<body>
    <form runat="server">
        <h2>PassportPayments SDK - API Samples</h2>
        <div>
            <table>
                <tr>
                    <td>
                        <div class="section_header">
                            Card Temporary Token
                        </div>
                        <ul>
                            <li><a href="PassportPaymentsApi/CreateCardToken.aspx">Generate Temporary Card Token</a></li>
                            <asp:HiddenField ID="cardtoken" runat="server"></asp:HiddenField>
                        </ul>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div class="section_header">
                            Express Checkout
                        </div>
                        <ul>
                            <li><a href="PassportPaymentsApi/Checkout.aspx">Checkout</a></li>
                        </ul>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div class="section_header">
                            Customer
                        </div>
                        <ul>
                            <li><a href="PassportPaymentsApi/SaveCustomer.aspx">Save Cutsomer</a></li>
                            <li><a href="PassportPaymentsApi/Customers.aspx">Cutsomers</a></li>
                        </ul>
                    </td>
                </tr>

            </table>
        </div>
    </form>
</body>
</html>
