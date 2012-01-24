<%@ Page Title="Informe Operativo - Agua Instantaneo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agua.aspx.cs" Inherits="Web.Instantaneo.Agua" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Fecha</h2>
    <asp:Calendar ID="cal" runat="server" FirstDayOfWeek="Monday" CssClass="center"></asp:Calendar>
    <h3>Datos</h3>
    <asp:Chart ID="chart" runat="server" DataSourceID="ds" Width="900" Height="200">
        <Series>
            <asp:Series ChartType="Line" Name="Agua1" XValueMember="Hora" 
                YValueMembers="Agua1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Agua2" XValueMember="Hora" 
                YValueMembers="Agua2">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Agua3" XValueMember="Hora" 
                YValueMembers="Agua3">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Agua4" XValueMember="Hora" 
                YValueMembers="Agua4">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Agua5" XValueMember="Hora" 
                YValueMembers="Agua5">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Agua6" XValueMember="Hora" 
                YValueMembers="Agua6">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Agua7" XValueMember="Hora" 
                YValueMembers="Agua7">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Interval="1" IntervalType="Hours">
                <LabelStyle Format="{0:HH:mm}" />
                </AxisX>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Hora" DataSourceID="ds" CssClass="center">
        <Columns>
            <asp:BoundField DataField="Hora" DataFormatString="{0:HH:mm}" HeaderText="Hora" 
                ReadOnly="True" SortExpression="Hora" />
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
        ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>" SelectCommand="select Hora,Dia,Agua1,Agua2,Agua3,Agua4,Agua5,Agua6,Agua7 from ins.Agua
where Dia = @dia
order by hora">
        <SelectParameters>
            <asp:ControlParameter ControlID="cal" Name="dia" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
