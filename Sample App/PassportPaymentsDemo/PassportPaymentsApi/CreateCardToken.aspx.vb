Public Class CreateCardToken
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            System.Diagnostics.Debug.WriteLine("postback called")
        End If
    End Sub

End Class