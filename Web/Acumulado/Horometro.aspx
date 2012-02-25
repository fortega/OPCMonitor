<%@ Page Title="Cuenta Acumulado de Horometro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Horometro.aspx.cs" Inherits="Web.Totalizado.Horometro" %>
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
                SortExpression="linea" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="ppto" HeaderText="Presupuesto" ReadOnly="True" 
                SortExpression="ppto" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="real" HeaderText="Real" ReadOnly="True" 
                SortExpression="real" DataFormatString="{0:#,0}" />
        </Columns>
    </asp:GridView>
    <h2>
        Detalle</h2>
    <asp:Chart ID="chart" runat="server" DataSourceID="ds" Width="960" Height="231">
        <Series>
            <asp:Series ChartType="StackedColumn" Name="L1" XValueMember="Dia" YValueMembers="Horometro1">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L2" XValueMember="Dia" YValueMembers="Horometro2">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L3" XValueMember="Dia" YValueMembers="Horometro3">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L4" XValueMember="Dia" YValueMembers="Horometro4">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L5" XValueMember="Dia" YValueMembers="Horometro5">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L6" XValueMember="Dia" YValueMembers="Horometro6">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="L7" XValueMember="Dia" YValueMembers="Horometro7">
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
            <asp:BoundField DataField="Horometro1" HeaderText="Linea 1" ReadOnly="True" SortExpression="Horometro1" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="Horometro2" HeaderText="Linea 2" ReadOnly="True" SortExpression="Horometro2" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="Horometro3" HeaderText="Linea 3" ReadOnly="True" SortExpression="Horometro3" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="Horometro4" HeaderText="Linea 4" ReadOnly="True" SortExpression="Horometro4" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="Horometro5" HeaderText="Linea 5" ReadOnly="True" SortExpression="Horometro5" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="Horometro6" HeaderText="Linea 6" ReadOnly="True" SortExpression="Horometro6" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="Horometro7" HeaderText="Linea 7" ReadOnly="True" SortExpression="Horometro7" DataFormatString="{0:#,0}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>"
        SelectCommand="select Dia,
sum(Horometro1) as Horometro1,
sum(Horometro2) as Horometro2,
sum(Horometro3) as Horometro3,
sum(Horometro4) as Horometro4,
sum(Horometro5) as Horometro5,
sum(Horometro6) as Horometro6,
sum(Horometro7) as Horometro7
from ins.Horometro
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
	select distinct dia from ins.Horometro
	where dia &gt;= @inicio and dia &lt;= @fin
)

select 'L1' as linea, sum(Horometro1) as ppto,
(select sum(Horometro1) from ins.Horometro where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.Horometro p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'L2' as linea, sum(Horometro2) as ppto,
(select sum(Horometro2) from ins.Horometro where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.Horometro p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'L3' as linea, sum(Horometro3) as ppto,
(select sum(Horometro3) from ins.Horometro where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.Horometro p
on month(d.dia) = p.mes and year(d.dia) = p.ani
union all

select 'L4' as linea, sum(Horometro4) as ppto,
(select sum(Horometro4) from ins.Horometro where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.Horometro p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'L5' as linea, sum(Horometro5) as ppto,
(select sum(Horometro5) from ins.Horometro where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.Horometro p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'L6' as linea, sum(Horometro6) as ppto,
(select sum(Horometro6) from ins.Horometro where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.Horometro p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'L7' as linea, sum(Horometro7) as ppto,
(select sum(Horometro7) from ins.Horometro where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.Horometro p
on month(d.dia) = p.mes and year(d.dia) = p.ani">
        <SelectParameters>
            <asp:ControlParameter ControlID="calInicio" Name="inicio" PropertyName="SelectedDate" />
            <asp:ControlParameter ControlID="calFin" Name="fin" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
