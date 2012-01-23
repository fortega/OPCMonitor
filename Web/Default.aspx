<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Web._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Agua
    </h2>
    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Hora" DataSourceID="ds">
        <Columns>
            <asp:BoundField DataField="Hora" HeaderText="Hora" ReadOnly="True" 
                SortExpression="Hora" />
            <asp:BoundField DataField="Dia" HeaderText="Dia" SortExpression="Dia" />
            <asp:BoundField DataField="Agua1" HeaderText="Agua1" SortExpression="Agua1" />
            <asp:BoundField DataField="Agua2" HeaderText="Agua2" SortExpression="Agua2" />
            <asp:BoundField DataField="Agua3" HeaderText="Agua3" SortExpression="Agua3" />
            <asp:BoundField DataField="Agua4" HeaderText="Agua4" SortExpression="Agua4" />
            <asp:BoundField DataField="Agua5" HeaderText="Agua5" SortExpression="Agua5" />
            <asp:BoundField DataField="Agua6" HeaderText="Agua6" SortExpression="Agua6" />
            <asp:BoundField DataField="Agua7" HeaderText="Agua7" SortExpression="Agua7" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" 
    ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>" 
    SelectCommand="SELECT * FROM [Agua]"></asp:SqlDataSource>
</asp:Content>
