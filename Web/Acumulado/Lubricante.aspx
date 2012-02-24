<%@ Page Title="Consumo Acumulado de Lubricante" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Lubricante.aspx.cs" Inherits="Web.Totalizado.Lubricante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 217px;
        }
    </style>
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
            <asp:Series Name="Real" XValueMember="linea" YValueMembers="real" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" Name="Presupuesto" XValueMember="linea" YValueMembers="ppto"
                Legend="Legend1">
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
    <asp:GridView ID="gvDetalle" runat="server" Width="480px" 
    AutoGenerateColumns="False" CssClass="centerTable" DataSourceID="dsResumen">
        <Columns>
            <asp:BoundField DataField="linea" HeaderText="Linea" ReadOnly="True" 
                SortExpression="linea" />
            <asp:BoundField DataField="ppto" HeaderText="Presupuesto" ReadOnly="True" 
                SortExpression="ppto" />
            <asp:BoundField DataField="real" HeaderText="Real" ReadOnly="True" 
                SortExpression="real" />
        </Columns>
    </asp:GridView>
    <h2>
        Detalle</h2>
    <asp:Chart ID="chart" runat="server" DataSourceID="ds" Width="960" Height="231">
        <Series>
            <asp:Series ChartType="StackedColumn" Name="L1" XValueMember="Dia" YValueMembers="Lubricante1">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L2" XValueMember="Dia" YValueMembers="Lubricante2">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L3" XValueMember="Dia" YValueMembers="Lubricante3">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L4" XValueMember="Dia" YValueMembers="Lubricante4">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L5" XValueMember="Dia" YValueMembers="Lubricante5">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L6" XValueMember="Dia" YValueMembers="Lubricante6">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L7" XValueMember="Dia" YValueMembers="Lubricante7">
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
            <asp:BoundField DataField="Lubricante1" HeaderText="Linea 1" ReadOnly="True" SortExpression="Lubricante1" />
            <asp:BoundField DataField="Lubricante2" HeaderText="Linea 2" ReadOnly="True" SortExpression="Lubricante2" />
            <asp:BoundField DataField="Lubricante3" HeaderText="Linea 3" ReadOnly="True" SortExpression="Lubricante3" />
            <asp:BoundField DataField="Lubricante4" HeaderText="Linea 4" ReadOnly="True" SortExpression="Lubricante4" />
            <asp:BoundField DataField="Lubricante5" HeaderText="Linea 5" ReadOnly="True" SortExpression="Lubricante5" />
            <asp:BoundField DataField="Lubricante6" HeaderText="Linea 6" ReadOnly="True" SortExpression="Lubricante6" />
            <asp:BoundField DataField="Lubricante7" HeaderText="Linea 7" ReadOnly="True" SortExpression="Lubricante7" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>"
        SelectCommand="select Dia,
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
            <asp:ControlParameter ControlID="calInicio" Name="inicio" PropertyName="SelectedDate" />
            <asp:ControlParameter ControlID="calFin" Name="fin" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsResumen" runat="server" ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>"
        SelectCommand="with dias(dia) as (
	select distinct dia from ins.lubricante
	where dia &gt;= @inicio and dia &lt;= @fin
)

select 'L1' as linea, sum(lubricante1) as ppto,
(select sum(lubricante1) from ins.lubricante where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.lubricante p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'L2' as linea, sum(lubricante2) as ppto,
(select sum(lubricante2) from ins.lubricante where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.lubricante p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'L3' as linea, sum(lubricante3) as ppto,
(select sum(lubricante3) from ins.lubricante where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.lubricante p
on month(d.dia) = p.mes and year(d.dia) = p.ani
union all

select 'L4' as linea, sum(lubricante4) as ppto,
(select sum(lubricante4) from ins.lubricante where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.lubricante p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'L5' as linea, sum(lubricante5) as ppto,
(select sum(lubricante5) from ins.lubricante where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.lubricante p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'L6' as linea, sum(lubricante6) as ppto,
(select sum(lubricante6) from ins.lubricante where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.lubricante p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'L7' as linea, sum(lubricante7) as ppto,
(select sum(lubricante7) from ins.lubricante where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.lubricante p
on month(d.dia) = p.mes and year(d.dia) = p.ani">
        <SelectParameters>
            <asp:ControlParameter ControlID="calInicio" Name="inicio" PropertyName="SelectedDate" />
            <asp:ControlParameter ControlID="calFin" Name="fin" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
