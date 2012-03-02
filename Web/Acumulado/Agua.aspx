<%@ Page Title="Consumo Acumulado de Agua" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Agua.aspx.cs" Inherits="Web.Totalizado.Agua" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="centerTable">
        <tbody>
            <tr>
                <td class="style1">
                    <h2>
                        Inicio</h2>
                </td>
                <td>
                    <h2>
                        Fin</h2>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Calendar ID="calInicio" runat="server" FirstDayOfWeek="Monday"></asp:Calendar>
                </td>
                <td>
                    <asp:Calendar ID="calFin" runat="server" FirstDayOfWeek="Monday"></asp:Calendar>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:Chart ID="charResumen" runat="server" DataSourceID="dsResumen" Width="960" Height="231">
        <Series>
            <asp:Series Name="Real" XValueMember="linea" YValueMembers="real" Legend="Legend1"
                IsValueShownAsLabel="True" LabelFormat="{0:#,0}">
            </asp:Series>
            <asp:Series Name="Presupuesto" XValueMember="linea" YValueMembers="ppto" Legend="Legend1"
                IsValueShownAsLabel="True" LabelFormat="{0:#,0}">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend Alignment="Center" Docking="Bottom" LegendStyle="Row" Name="Legend1">
            </asp:Legend>
        </Legends>
    </asp:Chart>
    <asp:GridView ID="gvDetalle" runat="server" Width="480px" AutoGenerateColumns="False"
        CssClass="centerTable" DataSourceID="dsResumen">
        <Columns>
            <asp:BoundField DataField="linea" HeaderText="Linea" ReadOnly="True" SortExpression="linea"
                DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="ppto" HeaderText="Presupuesto" ReadOnly="True" SortExpression="ppto"
                DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="real" HeaderText="Real" ReadOnly="True" SortExpression="real"
                DataFormatString="{0:#,0}" />
        </Columns>
    </asp:GridView>
    <h2>
        Detalle</h2>
    <asp:Chart ID="chart" runat="server" DataSourceID="ds" Width="960" Height="231">
        <Series>
            <asp:Series ChartType="StackedColumn" Name="L1" XValueMember="Dia" YValueMembers="agua1">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L2" XValueMember="Dia" YValueMembers="agua2">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L3" XValueMember="Dia" YValueMembers="agua3">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L4" XValueMember="Dia" YValueMembers="agua4">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L5" XValueMember="Dia" YValueMembers="agua5">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L6" XValueMember="Dia" YValueMembers="agua6">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L7" XValueMember="Dia" YValueMembers="agua7">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Interval="1" IntervalType="Days">
                </AxisX>
            </asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend Name="Legend1" Alignment="Center" Docking="Bottom" TableStyle="Wide">
            </asp:Legend>
        </Legends>
    </asp:Chart>
    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataSourceID="ds"
        CssClass="center" Width="960">
        <Columns>
            <asp:BoundField DataField="Dia" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Dia"
                SortExpression="Dia" />
            <asp:BoundField DataField="agua1" HeaderText="Linea 1 (Lts)" ReadOnly="True" SortExpression="agua1"
                DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="agua2" HeaderText="Linea 2 (Lts)" ReadOnly="True" SortExpression="agua2"
                DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="agua3" HeaderText="Linea 3 (Lts)" ReadOnly="True" SortExpression="agua3"
                DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="agua4" HeaderText="Linea 4 (Lts)" ReadOnly="True" SortExpression="agua4"
                DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="agua5" HeaderText="Linea 5 (Lts)" ReadOnly="True" SortExpression="agua5"
                DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="agua6" HeaderText="Linea 6 (Lts)" ReadOnly="True" SortExpression="agua6"
                DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="agua7" HeaderText="Linea 7 (Lts)" ReadOnly="True" SortExpression="agua7"
                DataFormatString="{0:#,0}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>"
        SelectCommand="select Dia,
sum(agua1) as agua1,
sum(agua2) as agua2,
sum(agua3) as agua3,
sum(agua4) as agua4,
sum(agua5) as agua5,
sum(agua6) as agua6,
sum(agua7) as agua7
from ins.agua
where Dia between @inicio and @fin
group by Dia
order by Dia">
        <SelectParameters>
            <asp:ControlParameter ControlID="calInicio" Name="inicio" PropertyName="SelectedDate" />
            <asp:ControlParameter ControlID="calFin" Name="fin" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsResumen" runat="server" ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>"
        SelectCommand="with dias(dia) as (
	select distinct dia from ins.agua
	where dia &gt;= @inicio and dia &lt;= @fin
)

select 'L1' as linea, sum(agua1) as ppto,
(select sum(agua1) from ins.agua where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.agua p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'L2' as linea, sum(agua2) as ppto,
(select sum(agua2) from ins.agua where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.agua p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'L3' as linea, sum(agua3) as ppto,
(select sum(agua3) from ins.agua where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.agua p
on month(d.dia) = p.mes and year(d.dia) = p.ani
union all

select 'L4' as linea, sum(agua4) as ppto,
(select sum(agua4) from ins.agua where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.agua p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'L5' as linea, sum(agua5) as ppto,
(select sum(agua5) from ins.agua where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.agua p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'L6' as linea, sum(agua6) as ppto,
(select sum(agua6) from ins.agua where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.agua p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'L7' as linea, sum(agua7) as ppto,
(select sum(agua7) from ins.agua where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.agua p
on month(d.dia) = p.mes and year(d.dia) = p.ani">
        <SelectParameters>
            <asp:ControlParameter ControlID="calInicio" Name="inicio" PropertyName="SelectedDate" />
            <asp:ControlParameter ControlID="calFin" Name="fin" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
