Imports PassportPayments
Imports PassportPayments.Wrapper
Imports PassportPayments.PResponse
Public Class Charge
    Inherits System.Web.UI.Page

    Private ppWrapper As PassportPayments.Wrapper
    Private apiResponse As GetCustomersResponse
    Private chargeResponse As ChargeResponse
    Private respData
    Dim customers
    Dim cards

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) Then
            Try
                ppWrapper = New PassportPayments.Wrapper(AppConfig.Credentials.CLIENT_ID, AppConfig.Credentials.CLIENT_SECRET)
                apiResponse = ppWrapper.getCustomers()
                If (apiResponse.getResponseType() = PResponseStatus.RESPONSE_STATUS_SUCCESS) Then
                    customersList.Items.Clear()
                    customers = New List(Of PCustomer)
                    customers = apiResponse.getData()
                    Session("customers") = customers
                    For Each customer As PCustomer In customers
                        customersList.Items.Add(New ListItem(customer.Email(), customer.Id()))
                    Next
                    loadCards()
                Else
                    respData = New PError(apiResponse.getError())
                    Me.responseText.Text = respData.getErrorObject().ToString()
                End If
            Catch ex As Exception
                Debug.WriteLine("exception " + ex.ToString())
            End Try
        End If
    End Sub

    Protected Sub customersListChange(sender As Object, e As EventArgs) Handles customersList.SelectedIndexChanged
        loadCards()
    End Sub

    Protected Sub cardsListChange(sender As Object, e As EventArgs) Handles cardsList.SelectedIndexChanged

    End Sub

    Protected Sub chargeClick(sender As Object, e As EventArgs) Handles chargeCustomer.Click
        Try
            ppWrapper = New PassportPayments.Wrapper(AppConfig.Credentials.CLIENT_ID, AppConfig.Credentials.CLIENT_SECRET)
            chargeResponse = ppWrapper.captureByCardId(cardsList.SelectedItem.Value, amount.Text)
            If (chargeResponse.getResponseType() = PResponseStatus.RESPONSE_STATUS_SUCCESS) Then
                respData = New PCharge(chargeResponse.getData())
                Me.responseText.Text = respData.getChargeObject().ToString()
            Else
                respData = New PError(apiResponse.getError())
                Me.responseText.Text = respData.getErrorObject().ToString()
            End If
        Catch ex As Exception
            Debug.WriteLine("exception " + ex.ToString())
        End Try
    End Sub
    Protected Sub loadCards()
        'If (cards.Count > 0) Then
        'cards.Clear()
        'End If
        cards = getCardByCustId(customersList.SelectedItem.Value)

        For Each card As PCard In cards
            cardsList.Items.Add(New ListItem("Card ending in " + card.Tail, card.Id))
        Next
    End Sub

    Protected Function getCardByCustId(ByVal customerId As String) As List(Of PCard)
        Debug.WriteLine("cust id to search = " + customerId)
        customers = CType(Session("customers"), List(Of PCustomer))
        For Each customer As PCustomer In customers
            Debug.WriteLine("cust id  = " + customer.Id)
            If (customer.Id = customerId) Then
                Debug.WriteLine("found")
                Return customer.Cards()
            End If
        Next

        Return Nothing
    End Function

End Class