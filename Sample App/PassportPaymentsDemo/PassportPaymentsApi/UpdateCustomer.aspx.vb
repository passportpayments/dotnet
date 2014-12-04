Imports PassportPayments
Imports PassportPayments.PResponse
Public Class UpdateCustomer
    Inherits System.Web.UI.Page

    Private ppWrapper As PassportPayments.Wrapper
    Private apiResponse As GetCustomersResponse

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) Then
            Try
                ppWrapper = New PassportPayments.Wrapper(AppConfig.Credentials.CLIENT_ID, AppConfig.Credentials.CLIENT_SECRET, AppConfig.Credentials.API_URL)
                apiResponse = ppWrapper.getCustomers()
                If (apiResponse.getResponseType() = PResponseStatus.RESPONSE_STATUS_SUCCESS) Then
                    Dim customers As New List(Of PCustomer)
                    customers = apiResponse.getData()
                    Session("customers") = customers
                  
                    'populate the dropdown
                    For Each customer As PCustomer In customers
                        customersListDropDown.Items.Add(New ListItem(customer.Email(), customer.Id()))
                    Next

                    Me.customersListResponse.Text = apiResponse.getRawResponse().ToString()
                    'load card info for each customer
                    loadCustomerInfo()
                Else
                    Me.customersListResponse.Text = apiResponse.getError()
                End If
            Catch ex As Exception
                Debug.WriteLine("exception " + ex.ToString())
            End Try

            'Try
            '    ppWrapper = New PassportPayments.Wrapper(AppConfig.Credentials.CLIENT_ID, AppConfig.Credentials.CLIENT_SECRET, AppConfig.Credentials.API_URL)
            '    Dim resp As GetCustomerResponse = ppWrapper.getCustomer("cus_548029ab823a2")
            '    If (resp.getResponseType() = PResponseStatus.RESPONSE_STATUS_SUCCESS) Then
            '        Dim customer As PCustomer = resp.getData()
            '    End If
            'Catch ex As Exception

            'End Try
        End If
    End Sub

    Protected Sub customersListDropDownChange(sender As Object, e As EventArgs) Handles customersListDropDown.SelectedIndexChanged
        loadCustomerInfo()
    End Sub

    Protected Sub loadCustomerInfo()
        Try
            ppWrapper = New PassportPayments.Wrapper(AppConfig.Credentials.CLIENT_ID, AppConfig.Credentials.CLIENT_SECRET, AppConfig.Credentials.API_URL)
            Dim resp As GetCustomerResponse = ppWrapper.getCustomer(customersListDropDown.SelectedItem.Value)
            If (resp.getResponseType() = PResponseStatus.RESPONSE_STATUS_SUCCESS) Then
                Dim customer As PCustomer = resp.getData()
                Me.fisrtname.Text = customer.FirstName()
                Me.lastname.Text = customer.LastName()
                Me.phone.Text = customer.PhoneNumber()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub updateClick(sender As Object, e As EventArgs)
        Try
            ppWrapper = New PassportPayments.Wrapper(AppConfig.Credentials.CLIENT_ID, AppConfig.Credentials.CLIENT_SECRET, AppConfig.Credentials.API_URL)
            Dim resp As UpdateCustomerResponse = ppWrapper.updateCustomer(customersListDropDown.SelectedItem.Value, Me.fisrtname.Text, Me.lastname.Text, Me.phone.Text)
            If (resp.getResponseType() = PResponseStatus.RESPONSE_STATUS_SUCCESS) Then
                Me.responseText.Text = resp.getData().ToString()
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class