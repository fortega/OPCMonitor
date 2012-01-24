<%@ Page Title="Informe Operativo - Lubricante Totalizado" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lubricante.aspx.cs" Inherits="Web.Totalizado.Lubricante" %>
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
            <asp:Series ChartType="StackedColumn" Name="Lubricante1" XValueMember="Dia" 
                YValueMembers="Lubricante1">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Lubricante2" XValueMember="Dia" 
                YValueMembers="Lubricante2">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Lubricante3" XValueMember="Dia" 
                YValueMembers="Lubricante3">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Lubricante4" XValueMember="Dia" 
                YValueMembers="Lubricante4">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Lubricante5" XValueMember="Dia" 
                YValueMembers="Lubricante5">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Lubricante6" XValueMember="Dia" 
                YValueMembers="Lubricante6">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Lubricante7" XValueMember="Dia" 
                YValueMembers="Lubricante7">
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
            <asp:BoundField DataField="Lubricante1" HeaderText="Lubricante1" ReadOnly="True" 
                SortExpression="Lubricante1" />
            <asp:BoundField DataField="Lubricante2" HeaderText="Lubricante2" ReadOnly="True" 
                SortExpression="Lubricante2" />
            <asp:BoundField DataField="Lubricante3" HeaderText="Lubricante3" ReadOnly="True" 
                SortExpression="Lubricante3" />
            <asp:BoundField DataField="Lubricante4" HeaderText="Lubricante4" ReadOnly="True" 
                SortExpression="Lubricante4" />
            <asp:BoundField DataField="Lubricante5" HeaderText="Lubricante5" ReadOnly="True" 
                SortExpression="Lubricante5" />
            <asp:BoundField DataField="Lubricante6" HeaderText="Lubricante6" ReadOnly="True" 
                SortExpression="Lubricante6" />
            <asp:BoundField DataField="Lubricante7" HeaderText="Lubricante7" ReadOnly="True" 
                SortExpression="Lubricante7" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>" SelectCommand="select Dia,
sum(Lubricante1) as Lubricante1,
sum(Lubricante2) as Lubricante2,
sum(Lubricante3) as Lubricante3,
sum(Lubricante4) as Lubricante4,
sum(Lubricante5) as Lubricante5,
sum(Lubricante6) as Lubricante6,
sum(Lubricante7) as Lubricante7
from ins.Lubricante
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
