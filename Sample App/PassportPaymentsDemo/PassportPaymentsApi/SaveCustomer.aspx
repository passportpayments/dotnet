<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SaveCustomer.aspx.vb" Inherits="PassportPaymentsDemo.SaveCustomer" %>

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
            $("#cardtoken").hide();
            $("#save1").hide();

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
                $("#save1").click();
            }

            function cardTokenError(responseText) {
                $("#cardtoken").text("null");
                showError("cardToken API error: '" + responseText + "'");
            }
            $("#save").click(function(){
                var pp = new PassportCardToken(APP_KEY); // YOUR APPKEY
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
                        <asp:TextBox ID="ccnumber" runat="server" Text=""></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Exp Month (2 digits)"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="expmonth" runat="server" Text=""></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Exp Year (4 digits)"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="expyear" runat="server" Text=""></asp:TextBox></td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="CVV"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="cvv" runat="server" Text=""></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Emailaddress"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="emailaddress" runat="server" Text=""></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="FirstName"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="fisrtname" runat="server" Text=""></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="LastName (Optional)"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="lastname" runat="server" Text=""></asp:TextBox></td>
                </tr>
               
            </table>
        </div>
        <asp:TextBox ID="cardtoken" runat="server"></asp:TextBox>
        <asp:Label ID="lblcardToken" runat="server" Text="" Style="font-weight: bold"></asp:Label><br />
        <input type="button"  id="save" value="Save Customer" runat="server" />
        <asp:Button ID="save1"  OnClick="saveCustomerClick" runat="server" />
        <br />
        <br />
        <asp:Label ID="responseText" runat="server" Text=""></asp:Label><br />
        <br />
        <br />
        <a href="../index.aspx">Home</a>
    </form>
</body>
</html>
