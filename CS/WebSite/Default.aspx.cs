using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxGridView;

public partial class Different_Columns_In_Detail_GridView : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void ProductGridView_BeforePerformDataSelect(object sender, EventArgs e) {
        Session["CategoryID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }
    protected void ASPxGridView2_DataBound(object sender, EventArgs e) {
        ASPxGridView gridView = sender as ASPxGridView;
        int keyValue = (int)gridView.GetMasterRowKeyValue();
        gridView.Columns["ProductName"].Visible = keyValue % 2 == 0;
    }
}
