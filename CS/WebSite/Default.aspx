<%-- BeginRegion --%>
<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="Different_Columns_In_Detail_GridView" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.1"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Showing different columns in the Detail ASPxGridView</title>
</head>
<body>   
    <form id="form1" runat="server">
        
        <asp:AccessDataSource ID="dsCategories" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [Categories]">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="dsProducts" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsOnOrder], [Discontinued] FROM [Products] WHERE ([CategoryID] = ?)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="-1" Name="CategoryID" SessionField="CategoryID"
                    Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
            DataSourceID="dsCategories" KeyFieldName="CategoryID" Width="561px">
            <Columns>
                <dxwgv:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="Description" VisibleIndex="2">
                </dxwgv:GridViewDataTextColumn>
            </Columns>
            <SettingsDetail ShowDetailRow="True" />
            <Templates>
                <DetailRow>
                    <dxwgv:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False"
                        DataSourceID="dsProducts" KeyFieldName="ProductID" OnBeforePerformDataSelect="ProductGridView_BeforePerformDataSelect" OnDataBound="ASPxGridView2_DataBound">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="1">
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="3">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="4">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="QuantityPerUnit" VisibleIndex="5">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="6">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="7">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataCheckColumn FieldName="Discontinued" VisibleIndex="8">
                            </dxwgv:GridViewDataCheckColumn>
                        </Columns>
                    </dxwgv:ASPxGridView>
                </DetailRow>
            </Templates>
            <SettingsBehavior ConfirmDelete="True" />
        </dxwgv:ASPxGridView>
    </form>
</body>
</html>
