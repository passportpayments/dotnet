# PassportPayments API SDK For .Net
The repository contains the PassportPayments SDK (VB)ASP.NET Class Library (PassportPayments.dll) and the PassportPaymentsDemo Sample (VB)ASP.NET Web Application.

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
* Browse to the folder that you just cloned and select PassportPayments.dll under libs folder, and then click OK.
* Adding a reference in this way ensures that all file dependencies (debug files, XML document files, and so on) are copied.

## Getting Started
Simple usage looks like:

```aspx-vb
  Dim ppWrapper = New PassportPayments.Wrapper(CLIENT_ID, CLIENT_SECRET)
  Dim apiResponse As GetCustomersResponse = ppWrapper.getCustomers()
  If (apiResponse.getResponseType() = PResponseStatus.RESPONSE_STATUS_SUCCESS) Then
      'Do Something with apiResponse.getData()
      Me.Label1.Text = apiResponse.getData().ToString()
  Else
      Dim respData = New PError(apiResponse.getError())
      Me.Label1.Text = respData.getErrorObject().ToString()
  End If

```

## Documentation
Please see [PassportPayments API docs](https://api.passportpayments.com/docs/) for up-to-date documentation.

## Tests
To run the test application:
* open Visual Studio
* File > Open > Project/Solution
* Browse to the folder that you just cloned and select PassportPayments.sln
* Open AppConfig.vb, Fill in your **client_id** and **client_secret** provided 
```
    Const CLIENT_ID = "xxxx"
    Const CLIENT_SECRET = "yyyyyyyy"
```
* Enter F9
* This should load the app in your default browser
