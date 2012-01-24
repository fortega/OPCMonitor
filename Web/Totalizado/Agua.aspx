<%@ Page Title="Agua" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agua.aspx.cs" Inherits="Web.Totalizado.Agua" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="center">
    <tbody>
        <tr>
            <td><h2>Inicio</h2></td>
            <td><h2>Fin</h2></td>
        </tr>
        <tr>
            <td><asp:Calendar ID="calInicio" runat="server" FirstDayOfWeek="Monday"></asp:Calendar></td>
            <td><asp:Calendar ID="calFin" runat="server" FirstDayOfWeek="Monday"></asp:Calendar></td>
        </tr>
    </tbody>
</table>
    <h3>Datos</h3>
    <asp:Chart ID="chart" runat="server" DataSourceID="ds" Width="900" Height="200">
        <Series>
            <asp:Series ChartType="StackedColumn" Name="Agua1" XValueMember="Dia" 
                YValueMembers="Agua1">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Agua2" XValueMember="Dia" 
                YValueMembers="Agua2">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Agua3" XValueMember="Dia" 
                YValueMembers="Agua3">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Agua4" XValueMember="Dia" 
                YValueMembers="Agua4">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Agua5" XValueMember="Dia" 
                YValueMembers="Agua5">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Agua6" XValueMember="Dia" 
                YValueMembers="Agua6">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Agua7" XValueMember="Dia" 
                YValueMembers="Agua7">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" 
        DataSourceID="ds" CssClass="center">
        <Columns>
            <asp:BoundField DataField="Dia" DataFormatString="{0:dd-MM-yyyy}" 
                HeaderText="Dia" SortExpression="Dia" />
            <asp:BoundField DataField="Agua1" HeaderText="Agua1" ReadOnly="True" 
                SortExpression="Agua1" />
            <asp:BoundField DataField="Agua2" HeaderText="Agua2" ReadOnly="True" 
                SortExpression="Agua2" />
            <asp:BoundField DataField="Agua3" HeaderText="Agua3" ReadOnly="True" 
                SortExpression="Agua3" />
            <asp:BoundField DataField="Agua4" HeaderText="Agua4" ReadOnly="True" 
                SortExpression="Agua4" />
            <asp:BoundField DataField="Agua5" HeaderText="Agua5" ReadOnly="True" 
                SortExpression="Agua5" />
            <asp:BoundField DataField="Agua6" HeaderText="Agua6" ReadOnly="True" 
                SortExpression="Agua6" />
            <asp:BoundField DataField="Agua7" HeaderText="Agua7" ReadOnly="True" 
                SortExpression="Agua7" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>" SelectCommand="select Dia,
sum(Agua1) as Agua1,
sum(Agua2) as Agua2,
sum(Agua3) as Agua3,
sum(Agua4) as Agua4,
sum(Agua5) as Agua5,
sum(Agua6) as Agua6,
sum(Agua7) as Agua7
from ins.agua
where Dia between @inicio and @fin
group by Dia
order by Dia">
        <SelectParameters>
            <asp:ControlParameter ControlID="calInicio" Name="inicio" 
                PropertyName="SelectedDate" />
            <asp:ControlParameter ControlID="calFin" Name="fin" 
                PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
