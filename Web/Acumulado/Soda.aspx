<%@ Page Title="Consumo Acumulado de Soda" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Soda.aspx.cs" Inherits="Web.Totalizado.Soda" %>
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
            <asp:Series Name="Real" XValueMember="linea" YValueMembers="real" Legend="Legend1" IsValueShownAsLabel="True" LabelFormat="{0:#,0}">
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" Name="Presupuesto" XValueMember="linea" YValueMembers="ppto"
                Legend="Legend1" IsValueShownAsLabel="True" LabelFormat="{0:#,0}">
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
            <asp:Series ChartType="StackedColumn" Name="E1L1" XValueMember="Dia" YValueMembers="soda1">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="E2L1" XValueMember="Dia" YValueMembers="soda2">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="E1L2" XValueMember="Dia" YValueMembers="soda3">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="E2L2" XValueMember="Dia" YValueMembers="soda4">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="E1L4" XValueMember="Dia" YValueMembers="soda5">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="E2L4" XValueMember="Dia" YValueMembers="soda6">
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
            <asp:BoundField DataField="soda1" HeaderText="Est 1 Lav 1 (Lts)" ReadOnly="True" SortExpression="soda1" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="soda2" HeaderText="Est 2 Lav 1 (Lts)" ReadOnly="True" SortExpression="soda2" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="soda3" HeaderText="Est 1 Lav 2 (Lts)" ReadOnly="True" SortExpression="soda3" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="soda4" HeaderText="Est 2 Lav 2 (Lts)" ReadOnly="True" SortExpression="soda4" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="soda5" HeaderText="Est 1 Lav 4 (Lts)" ReadOnly="True" SortExpression="soda5" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="soda6" HeaderText="Est 2 Lav 4 (Lts)" ReadOnly="True" SortExpression="soda6" DataFormatString="{0:#,0}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>"
        SelectCommand="declare @factor float
set @factor = (select soda from factores);

select Dia,
sum(soda1)*@factor as soda1,
sum(soda2)*@factor as soda2,
sum(soda3)*@factor as soda3,
sum(soda4)*@factor as soda4,
sum(soda5)*@factor as soda5,
sum(soda6)*@factor as soda6
from ins.soda
where Dia between @inicio and @fin
group by Dia
order by Dia">
        <SelectParameters>
            <asp:ControlParameter ControlID="calInicio" Name="inicio" PropertyName="SelectedDate" />
            <asp:ControlParameter ControlID="calFin" Name="fin" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsResumen" runat="server" ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>"
        SelectCommand="declare @factor float
set @factor = (select soda from factores);

with dias(dia) as (
	select distinct dia from ins.soda
	where dia &gt;= @inicio and dia &lt;= @fin
)

select 'E1L1' as linea, sum(soda1) as ppto,
(select sum(soda1)*@factor from ins.soda where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.soda p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'E2L1' as linea, sum(soda2) as ppto,
(select sum(soda2)*@factor from ins.soda where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.soda p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'E1L2' as linea, sum(soda3) as ppto,
(select sum(soda3)*@factor from ins.soda where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.soda p
on month(d.dia) = p.mes and year(d.dia) = p.ani
union all

select 'E2L2' as linea, sum(soda4) as ppto,
(select sum(soda4)*@factor from ins.soda where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.soda p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'E1L4' as linea, sum(soda5) as ppto,
(select sum(soda5)*@factor from ins.soda where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.soda p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'E2L4' as linea, sum(soda6) as ppto,
(select sum(soda6)*@factor from ins.soda where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.soda p
on month(d.dia) = p.mes and year(d.dia) = p.ani">
        <SelectParameters>
            <asp:ControlParameter ControlID="calInicio" Name="inicio" PropertyName="SelectedDate" />
            <asp:ControlParameter ControlID="calFin" Name="fin" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
