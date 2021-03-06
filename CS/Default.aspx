
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Grid_Binding_CompositeKey_CompositeKey" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Change the filter combobox list values based on the value another filter combobox</title>
</head>
<body>
    <form id="form1" runat="server">
    
    <dx:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="adInvoices" Width="100%" AutoGenerateColumns="False" OnProcessColumnAutoFilter="grid_ProcessColumnAutoFilter">
        <Columns>
            <dx:GridViewDataColumn FieldName="CompanyName" VisibleIndex="1">
            </dx:GridViewDataColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Country"
                VisibleIndex="2">
                <PropertiesComboBox DataSourceID="adCountries" TextField="Country">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="City"
                VisibleIndex="2">
                <PropertiesComboBox DataSourceID="adCities" TextField="City">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataColumn FieldName="Region" VisibleIndex="4">
            </dx:GridViewDataColumn>
            
            <dx:GridViewDataColumn FieldName="Quantity" VisibleIndex="5" Name="Quantity">
            </dx:GridViewDataColumn>
            <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="6">
                <PropertiesTextEdit DisplayFormatString="c">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowGroupPanel="True" ShowFilterRow="true" />
    </dx:ASPxGridView>
    <%-- BeginRegion DataSource --%>
    <asp:AccessDataSource ID="adInvoices" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT [Customers.CompanyName] AS CompanyName, [CustomerID], [City], [Region], [Country], [Salesperson], [OrderID], [OrderDate], [ProductID], [ProductName], [UnitPrice], [Quantity], [Discount], [ExtendedPrice], [Freight] FROM [Invoices]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="adCountries" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT distinct [Country] FROM [Invoices]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="adCities" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT distinct [City] FROM [Invoices] Where [Country]=?">
        <SelectParameters>
            <asp:SessionParameter SessionField="CountryFilter" Name="Country" DefaultValue="" />
        </SelectParameters>
    </asp:AccessDataSource>
    <%-- EndRegion --%>
    </form>
</body>
</html>
