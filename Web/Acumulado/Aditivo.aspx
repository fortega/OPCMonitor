<%@ Page Title="Consumo Acumulado de Aditivo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Aditivo.aspx.cs" Inherits="Web.Totalizado.Aditivo" %>
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
            <asp:Series Name="Real" XValueMember="linea" YValueMembers="real" 
                Legend="Legend1" IsValueShownAsLabel="True" LabelFormat="{0:#,0.0}">
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" Name="Presupuesto" XValueMember="linea" YValueMembers="ppto"
                Legend="Legend1" IsValueShownAsLabel="True" LabelFormat="{0:#,0.0}">
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
                SortExpression="linea" DataFormatString="{0:#,0.0}" />
            <asp:BoundField DataField="ppto" HeaderText="Presupuesto" ReadOnly="True" 
                SortExpression="ppto" DataFormatString="{0:#,0.0}" />
            <asp:BoundField DataField="real" HeaderText="Real" ReadOnly="True" 
                SortExpression="real" DataFormatString="{0:#,0.0}" />
        </Columns>
    </asp:GridView>
    <h2>
        Detalle</h2>
    <asp:Chart ID="chart" runat="server" DataSourceID="ds" Width="960" Height="231">
        <Series>
            <asp:Series ChartType="StackedColumn" Name="E1L1" XValueMember="Dia" YValueMembers="aditivo1">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="E2L1" XValueMember="Dia" YValueMembers="aditivo2">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="E1L2" XValueMember="Dia" YValueMembers="aditivo3">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="E2L2" XValueMember="Dia" YValueMembers="aditivo4">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="E1L4" XValueMember="Dia" YValueMembers="aditivo5">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="E2L4" XValueMember="Dia" YValueMembers="aditivo6">
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
            <asp:BoundField DataField="aditivo1" HeaderText="Est 1 Lav 1 (Lts)" ReadOnly="True" SortExpression="aditivo1" DataFormatString="{0:#,0.0}" />
            <asp:BoundField DataField="aditivo2" HeaderText="Est 2 Lav 1 (Lts)" ReadOnly="True" SortExpression="aditivo2" DataFormatString="{0:#,0.0}" />
            <asp:BoundField DataField="aditivo3" HeaderText="Est 1 Lav 2 (Lts)" ReadOnly="True" SortExpression="aditivo3" DataFormatString="{0:#,0.0}" />
            <asp:BoundField DataField="aditivo4" HeaderText="Est 2 Lav 2 (Lts)" ReadOnly="True" SortExpression="aditivo4" DataFormatString="{0:#,0.0}" />
            <asp:BoundField DataField="aditivo5" HeaderText="Est 1 Lav 4 (Lts)" ReadOnly="True" SortExpression="aditivo5" DataFormatString="{0:#,0.0}" />
            <asp:BoundField DataField="aditivo6" HeaderText="Est 2 Lav 4 (Lts)" ReadOnly="True" SortExpression="aditivo6" DataFormatString="{0:#,0.0}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>"
        SelectCommand="declare @factor float
set @factor = (select aditivo from factores)

select Dia,
sum(aditivo1)*@factor as aditivo1,
sum(aditivo2)*@factor as aditivo2,
sum(aditivo3)*@factor as aditivo3,
sum(aditivo4)*@factor as aditivo4,
sum(aditivo5)*@factor as aditivo5,
sum(aditivo6)*@factor as aditivo6
from ins.aditivo
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
set @factor = (select aditivo from factores);

        with dias(dia) as (
	select distinct dia from ins.aditivo
	where dia &gt;= @inicio and dia &lt;= @fin
)

select 'E1L1' as linea, sum(aditivo1) as ppto,
(select sum(aditivo1)*@factor from ins.aditivo where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.aditivo p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'E2L1' as linea, sum(aditivo2) as ppto,
(select sum(aditivo2)*@factor from ins.aditivo where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.aditivo p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'E1L2' as linea, sum(aditivo3) as ppto,
(select sum(aditivo3)*@factor from ins.aditivo where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.aditivo p
on month(d.dia) = p.mes and year(d.dia) = p.ani
union all

select 'E2L2' as linea, sum(aditivo4) as ppto,
(select sum(aditivo4)*@factor from ins.aditivo where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.aditivo p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'E1L4' as linea, sum(aditivo5) as ppto,
(select sum(aditivo5)*@factor from ins.aditivo where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.aditivo p
on month(d.dia) = p.mes and year(d.dia) = p.ani

union all

select 'E2L4' as linea, sum(aditivo6) as ppto,
(select sum(aditivo6)*@factor from ins.aditivo where dia &gt;= @inicio and dia &lt;= @fin) as real
from dias d
left join pre.aditivo p
on month(d.dia) = p.mes and year(d.dia) = p.ani">
        <SelectParameters>
            <asp:ControlParameter ControlID="calInicio" Name="inicio" PropertyName="SelectedDate" />
            <asp:ControlParameter ControlID="calFin" Name="fin" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
