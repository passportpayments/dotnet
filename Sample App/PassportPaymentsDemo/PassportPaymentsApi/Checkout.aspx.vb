Imports PassportPayments
Imports PassportPayments.Wrapper
Imports PassportPayments.PResponse

Public Class Checkout
    Inherits System.Web.UI.Page

    Private ppWrapper As PassportPayments.Wrapper
    Private apiResponse As PResponse
    Private respData
 
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub checkOutClick(sender As Object, e As EventArgs)
        Try
            ppWrapper = New PassportPayments.Wrapper(AppConfig.Credentials.CLIENT_ID, AppConfig.Credentials.CLIENT_SECRET, AppConfig.Credentials.API_URL)
            apiResponse = ppWrapper.captureByTmpToken(Me.cardtoken.Text, Me.amount.Text)
            If (apiResponse.getResponseType() = PResponseStatus.RESPONSE_STATUS_SUCCESS) Then
                respData = New PCharge(apiResponse.getData())
                Me.responseText.Text = respData.getChargeObject().ToString()
            Else
                Me.responseText.Text = apiResponse.getError()
            End If
        Catch ex As Exception
            Debug.WriteLine("exception " + ex.ToString())
        End Try
    End Sub
End Class