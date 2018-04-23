Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxGridView

Partial Public Class Different_Columns_In_Detail_GridView
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	End Sub
	Protected Sub ProductGridView_BeforePerformDataSelect(ByVal sender As Object, ByVal e As EventArgs)
		Session("CategoryID") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
	End Sub
	Protected Sub ASPxGridView2_DataBound(ByVal sender As Object, ByVal e As EventArgs)
		Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)
		Dim keyValue As Integer = CInt(Fix(gridView.GetMasterRowKeyValue()))
		gridView.Columns("ProductName").Visible = keyValue Mod 2 = 0
	End Sub
End Class
