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

### Referencing the wrapper 
Dependent library references: Newtonsoft.Json.dll

* right click on your solution (dont do the project, do the solution)
* select 'Manage Nuget Packages for Solution'
* If you see JSON.Net in the installed packages list, skip the next two steps.
* click 'online', in the search box type 'newtonsoft'
* click 'Install' on 'Json.NET' (probably, what your looking for might be in another package, I'll ask you to track it down).

Now add the PassportPayments wrapper refernce:

* In Solution Explorer, select your Web project.
* On the Website menu (for Web site projects) or the Project menu (for Web application projects), choose Add Reference. Alternatively, you can right-click the name of your Web project in Solution Explorer and then select Add Reference.
* The Add Reference dialog box is displayed.
* Select the Browse tab.
* Browse to the folder that you just cloned and select the PassportPayments.dll under libs folder, and then click OK.
* Adding a reference in this way ensures that all file dependencies (debug files, XML document files, and so on) are copied.

## Getting Started
Namespaces: 
PassportPayments.Wrapper

Simple usage looks like:

```aspx-vb
  Dim ppWrapper = New PassportPayments.Wrapper(CLIENT_ID, CLIENT_SECRET, API_URL)
  Dim apiResponse As GetCustomersResponse = ppWrapper.getCustomers()
  If (apiResponse.getResponseType() = PResponseStatus.RESPONSE_STATUS_SUCCESS) Then
      'Do Something with apiResponse.getData()
      Me.Label1.Text = apiResponse.getData().ToString()
  Else
      Me.Label1.Text = apiResponse.getError()
  End If

```

## Documentation
Please see [PassportPayments API docs](https://api.passportpayments.com/docs/?vb#) for up-to-date documentation.

## Tests
###Pre-requisites

* Visual Studio 2013 (.NET Framework 4.5) or higher Or
* Visual Studio 2012 (.NET Framework 4.5) or higher

### Please note: bin and obj folders
Please delete the bin and obj folders before switching between different versions of Visual Studio

### Loading the app
* open Visual Studio
* File > Open > Project/Solution
* Browse to the folder that you just cloned and select PassportPayments.sln
* Add libs reference
* Open AppConfig.vb, Fill in your **client Id**, **client Secret**, **apiUrl** provided 

```
  Const API_URL = "https://sandbox.passportpayments.com/"
  Const CLIENT_ID = "xxxx"
  Const CLIENT_SECRET = "yyyyyyyy"
```
* Open Scripts/config.js, add your appKey provided
```js
  var API_END_POINT = "https://sandbox.passportpayments.com/";
  var APP_KEY = "APP_KEY";
```
* Enter F9
* This should load the app in your default browser

Note: The sample app uses [JS Client Lib](https://github.com/passportpayments/js) You can use any of PassportPayments' client librares for your app

