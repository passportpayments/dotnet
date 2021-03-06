﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Checkout.aspx.vb" Inherits="PassportPaymentsDemo.Checkout" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PassportPayments SDK Demo</title>
    <link rel="stylesheet" type="text/css" href="../Styles/sdk.css" />
    <!-- JQuery is used only for the demo app. PassportPayments library is not dependent on it. -->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="../Scripts/config.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://s3.amazonaws.com/passportpayments/js/passportpayments-1.0.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#chargeSec").hide();
            $("#cardtoken").hide();
            function showError(message) {
                $("#lblError").text(message);
                $("#lblError").show();
            }

            function hideError() {
                $("#lblError").text("");
                $("#lblError").hide();
            }

            function cardTokenSuccess(cardToken) {
                console.log("cardToken = " + cardToken);
                $("#getCardToken").hide();
                $("#chargeSec").show();
                $("#lblcardToken").text(cardToken);
                $("#cardtoken").val(cardToken);
            }

            function cardTokenError(responseText) {
                $("#cardtoken").text("null");
                showError("cardToken API error: '" + responseText + "'");
            }
            $("#getCardToken").click(function () {
                var pp = new PassportCardToken(APP_KEY, API_END_POINT);
                var params = {
                    "cardnumber": $("#ccnumber").val().trim(),
                    "expmonth": $("#expmonth").val(),
                    "expyear": $("#expyear").val(),
                    "cvv": $("#cvv").val()
                }
                //validate input is optional, you can use your own input validation
                var validation = pp.validateInput(params);
                if (validation) {
                    // params, successCallback, errorCallback, complete_response
                    pp.getCardToken(params, cardTokenSuccess, cardTokenError, false);
                } else {
                    showError("input error");
                }
            });
        });
    </script>
</head>
<body>
    <form runat="server">
        <h2>PassportPayments SDK - API Samples</h2>
        <h3>Checkout</h3>
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="CardNumber"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="ccnumber" runat="server" Text="4111-1111-1111-1111"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Exp Month"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="expmonth" runat="server" Text="12"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Exp Year"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="expyear" runat="server" Text="2020"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="CVV"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="cvv" runat="server" Text="123"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Amount (In cents)"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="amount" runat="server" Text="100"></asp:TextBox></td>
                </tr>
            </table>
        </div>

        <div>
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
            <input id="getCardToken" value="Get Temp Token" type="button" />
            <asp:TextBox ID="cardtoken" runat="server"></asp:TextBox>
        </div>
        <br />
        <div id="chargeSec">
            <asp:Label ID="Label3" runat="server" Text="Your Temporary card token is: "></asp:Label>
            <asp:Label ID="lblcardToken" runat="server" Text="" Style="font-weight: bold"></asp:Label><br />
            <asp:Button ID="charge" OnClick="checkOutClick" Text="Capture" runat="server" />
        </div>

        <asp:Label ID="responseText" runat="server" Text=""></asp:Label><br />
        <br />
        <br />
        <a href="../index.aspx">Home</a>
    </form>
</body>
</html>
