Imports PassportPayments
Imports PassportPayments.PResponse

Public Class Customers
    Inherits System.Web.UI.Page

    Private ppWrapper As PassportPayments.Wrapper
    Private apiResponse As GetCustomersResponse
    Private chargeResponse As ChargeResponse
    Private transactionsResponse As GetTransactionsResponse
    Private voidRefundResponse As ChargeResponse
    Private respData
    Dim customers
    Dim cards

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) Then
            Try
                ppWrapper = New PassportPayments.Wrapper(AppConfig.Credentials.CLIENT_ID, AppConfig.Credentials.CLIENT_SECRET, AppConfig.Credentials.API_URL)
                apiResponse = ppWrapper.getCustomers()
                If (apiResponse.getResponseType() = PResponseStatus.RESPONSE_STATUS_SUCCESS) Then
                    Dim customers As New List(Of PCustomer)
                    customers = apiResponse.getData()
                    Session("customers") = customers
                    'load the gridview
                    customersList1.DataSource = customers
                    customersList1.DataBind()

                    'populate the dropdown
                    For Each customer As PCustomer In customers
                        customersListDropDown.Items.Add(New ListItem(customer.Email(), customer.Id()))
                    Next

                    Me.customersListResponse.Text = apiResponse.getRawResponse().ToString()
                    'load card info for each customer
                    loadCards()

                    'load Transactions for a customer
                    loadTransactions()
                Else
                    Me.customersListResponse.Text = apiResponse.getError()
                End If
            Catch ex As Exception
                Debug.WriteLine("exception " + ex.ToString())
            End Try
        End If
    End Sub

    Protected Sub customersListDropDownChange(sender As Object, e As EventArgs) Handles customersListDropDown.SelectedIndexChanged
        loadCards()
        loadTransactions()
    End Sub

    Protected Sub cardsListDropdownChange(sender As Object, e As EventArgs) Handles cardsListDropdown.SelectedIndexChanged

    End Sub

    Protected Sub chargeClick(sender As Object, e As EventArgs) Handles chargeCustomer.Click
        Try
            ppWrapper = New PassportPayments.Wrapper(AppConfig.Credentials.CLIENT_ID, AppConfig.Credentials.CLIENT_SECRET, AppConfig.Credentials.API_URL)
            chargeResponse = ppWrapper.captureByCardId(cardsListDropdown.SelectedItem.Value, amount.Text)
            If (chargeResponse.getResponseType() = PResponseStatus.RESPONSE_STATUS_SUCCESS) Then
                respData = New PCharge(chargeResponse.getData())
                Me.chargeResponselbl.Text = respData.getChargeObject().ToString()
                loadTransactions()
            Else
                respData = New PError(chargeResponse.getError())
                Me.chargeResponselbl.Text = respData.getErrorObject().ToString()
            End If
        Catch ex As Exception
            Debug.WriteLine("exception " + ex.ToString())
        End Try
    End Sub
    Protected Sub loadCards()
        'If (cards.Count > 0) Then
        'cards.Clear()
        'End If
        cards = getCardsByCustId(customersListDropDown.SelectedItem.Value)

        For Each card As PCard In cards
            cardsListDropdown.Items.Add(New ListItem("Card ending in " + card.Tail, card.Id))
        Next
    End Sub

    Protected Function getCardsByCustId(ByVal customerId As String) As List(Of PCard)
        'Debug.WriteLine("cust id to search = " + customerId)
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

    Protected Sub loadTransactions()
        Try
            ppWrapper = New PassportPayments.Wrapper(AppConfig.Credentials.CLIENT_ID, AppConfig.Credentials.CLIENT_SECRET, AppConfig.Credentials.API_URL)
            transactionsResponse = ppWrapper.getTransactionsByCustomerId(customersListDropDown.SelectedItem.Value)
            If (transactionsResponse.getResponseType() = PResponseStatus.RESPONSE_STATUS_SUCCESS) Then
                Dim transactions As New List(Of PTransaction)
                transactionsList.Visible = True
                transactions = transactionsResponse.getData()
                'Session("transactions") = transactions
                'load the gridview
                transactionsList.DataSource = transactions
                transactionsList.DataBind()
                transactionResponselbl.Visible = False
            Else
                transactionsList.Visible = False
                transactionResponselbl.Visible = True
                transactionResponselbl.Text = transactionsResponse.getError()
            End If
        Catch ex As Exception
            Debug.WriteLine("exception " + ex.ToString())
        End Try
    End Sub

    Protected Sub onVoidClick(sender As Object, e As GridViewCommandEventArgs)
        If (e.CommandName = "Refund") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim row As GridViewRow = transactionsList.Rows(index)
            Dim selectedTransactionId = transactionsList.Rows(index).Cells(1).Text
            Try
                ppWrapper = New PassportPayments.Wrapper(AppConfig.Credentials.CLIENT_ID, AppConfig.Credentials.CLIENT_SECRET, AppConfig.Credentials.API_URL)
                voidRefundResponse = ppWrapper.refundTransaction(selectedTransactionId)
                If (voidRefundResponse.getResponseType() = PResponseStatus.RESPONSE_STATUS_SUCCESS) Then
                    loadTransactions()
                Else
                    transactionResponselbl.Visible = True
                    transactionResponselbl.Text = voidRefundResponse.getError()
                End If
                'transactionResponselbl.Text = 
            Catch ex As Exception
                Debug.WriteLine("exception " + ex.ToString())
            End Try
        End If
    End Sub
End Class