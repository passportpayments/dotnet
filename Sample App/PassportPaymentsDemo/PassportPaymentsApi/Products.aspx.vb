Imports PassportPayments
Imports PassportPayments.PResponse

Public Class Products
    Inherits System.Web.UI.Page

    Private ppWrapper As PassportPayments.Wrapper
    Private apiResponse As GetProductsResponse
    Dim products
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) Then
            Try
                ppWrapper = New PassportPayments.Wrapper(AppConfig.Credentials.CLIENT_ID, AppConfig.Credentials.CLIENT_SECRET, AppConfig.Credentials.API_URL)
                apiResponse = ppWrapper.getAllProducts()
                If (apiResponse.getResponseType() = PResponseStatus.RESPONSE_STATUS_SUCCESS) Then
                    Dim customers As New List(Of PProduct)
                    products = apiResponse.getData()

                    'load the gridview
                    productsList.DataSource = products
                    productsList.DataBind()

                Else
                    Me.productsListResponse.Text = apiResponse.getError()
                End If
            Catch ex As Exception
                Debug.WriteLine("exception " + ex.ToString())
            End Try
        End If
    End Sub

End Class