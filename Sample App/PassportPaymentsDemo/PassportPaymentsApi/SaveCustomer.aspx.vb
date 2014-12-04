Imports PassportPayments
Imports PassportPayments.Wrapper
Imports PassportPayments.PResponse
Public Class SaveCustomer
    Inherits System.Web.UI.Page

    Private ppWrapper As PassportPayments.Wrapper
    Private apiResponse As PResponse
    Private respData

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub saveCustomerClick(sender As Object, e As EventArgs)
        Debug.WriteLine("cardtoken = " + Me.cardtoken.Text)
        Try
            ppWrapper = New PassportPayments.Wrapper(AppConfig.Credentials.CLIENT_ID, AppConfig.Credentials.CLIENT_SECRET, AppConfig.Credentials.API_URL)
            apiResponse = ppWrapper.saveCustomer(Me.emailaddress.Text, Me.fisrtname.Text, Me.cardtoken.Text, Me.lastname.Text)
            If (apiResponse.getResponseType() = PResponseStatus.RESPONSE_STATUS_SUCCESS) Then
                'respData = New PCustomer(apiResponse.getData())
                'Me.responseText.Text = respData.getCustomerObject().ToString()
            Else
                Me.responseText.Text = apiResponse.getError()
            End If
        Catch ex As Exception
            Debug.WriteLine("exception " + ex.ToString())
        End Try
    End Sub


End Class