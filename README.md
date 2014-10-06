# PassportPayments API SDK For .Net
The repository contains the PassportPayments SDK ASP.NET VB Class Library (PassportPayments.dll) and the PassportPaymentsDemo Sample ASP.NET VB Web Application.

## Requirements
 * Sign up for a PassportPayments Merchant account at [passportpayments.com](https://passportpayments.com)
 * VisualStudio 2013 or later

## Setup
### Download
Obtain the latest version of the PassportPayments .Net bindings at:

```
git clone https://github.com/passportpayments/dotnet
```

### Adding lib 
To add PassportPayments.dll to your project

* In Solution Explorer, select your Web project.

* On the Website menu (for Web site projects) or the Project menu (for Web application projects), choose Add Reference. Alternatively, you can right-click the name of your Web project in Solution Explorer and then select Add Reference.

* The Add Reference dialog box is displayed.

* Select the Browse tab.

* Browse to the folder that you just cloned and select PassportPayments.dll, and then click OK.

* Adding a reference in this way ensures that all file dependencies (debug files, XML document files, and so on) are copied.


## Getting Started
    
Simple usage looks like:

```aspx-vb
ppWrapper = New PassportPayments.Wrapper(clientId, clientSecret)
Dim apiResponse As GetCustomersResponse = ppWrapper.getCustomers()
If (apiResponse.getResponseType() = PResponseStatus.RESPONSE_STATUS_SUCCESS) Then
  'Do Something with apiResponse.getData()
 Else
    Dim respData = New PError(apiResponse.getError())
    Me.responseText.Text = respData.getErrorObject().ToString()
End If

```

## Documentation

Please see [PassportPayments API docs](https://api.passportpayments.com/docs/) for up-to-date documentation.

## Tests

In Samples directory, 
