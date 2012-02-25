<%@ Page Title="Cuenta Diario de Horometro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Horometro.aspx.cs" Inherits="Web.Diario.Horometro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Fecha:</h2>
    <asp:DropDownList ID="ddlFecha" runat="server" DataSourceID="dsFechas" DataTextField="dia"
        DataTextFormatString="{0:MMMM yyyy}" DataValueField="MesAni" AutoPostBack="True">
    </asp:DropDownList>
    <br />
    <asp:Chart ID="Chart1" runat="server" DataSourceID="dsGrafico" Width="960" Height="231">
        <Series>
            <asp:Series Name="L1" ChartType="Line" Legend="Legend1" XValueMember="dia" YValueMembers="Linea1"
                BorderWidth="3">
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" ChartType="Line" Legend="Legend1" Name="L2" XValueMember="dia"
                YValueMembers="Linea2" BorderWidth="3">
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" ChartType="Line" Legend="Legend1" Name="L3" XValueMember="dia"
                YValueMembers="Linea3" BorderWidth="3">
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" ChartType="Line" Legend="Legend1" Name="L4" XValueMember="dia"
                YValueMembers="Linea4" BorderWidth="3">
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" ChartType="Line" Legend="Legend1" Name="L5" XValueMember="dia"
                YValueMembers="Linea5" BorderWidth="3">
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" ChartType="Line" Legend="Legend1" Name="L6" XValueMember="dia"
                YValueMembers="Linea6" BorderWidth="3">
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" ChartType="Line" Legend="Legend1" Name="L7" XValueMember="dia"
                YValueMembers="Linea7" BorderWidth="3">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Interval="1" IntervalType="Days" IsMarginVisible="False">
                </AxisX>
            </asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend Name="Legend1" Alignment="Center" Docking="Bottom" TableStyle="Wide">
            </asp:Legend>
        </Legends>
    </asp:Chart>
    <asp:GridView ID="gv" runat="server" Width="960" AutoGenerateColumns="False" DataSourceID="dsDatos">
        <Columns>
            <asp:BoundField DataField="linea" HeaderText="" ReadOnly="True" SortExpression="linea" />
            <asp:BoundField DataField="1" HeaderText="1" ReadOnly="True" SortExpression="1" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="2" HeaderText="2" ReadOnly="True" SortExpression="2" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="3" HeaderText="3" ReadOnly="True" SortExpression="3" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="4" HeaderText="4" ReadOnly="True" SortExpression="4" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="5" HeaderText="5" ReadOnly="True" SortExpression="5" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="6" HeaderText="6" ReadOnly="True" SortExpression="6" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="7" HeaderText="7" ReadOnly="True" SortExpression="7" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="8" HeaderText="8" ReadOnly="True" SortExpression="8" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="9" HeaderText="9" ReadOnly="True" SortExpression="9" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="10" HeaderText="10" ReadOnly="True" SortExpression="10" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="11" HeaderText="11" ReadOnly="True" SortExpression="11" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="12" HeaderText="12" ReadOnly="True" SortExpression="12" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="13" HeaderText="13" ReadOnly="True" SortExpression="13" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="14" HeaderText="14" ReadOnly="True" SortExpression="14" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="15" HeaderText="15" ReadOnly="True" SortExpression="15" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="16" HeaderText="16" ReadOnly="True" SortExpression="16" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="17" HeaderText="17" ReadOnly="True" SortExpression="17" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="18" HeaderText="18" ReadOnly="True" SortExpression="18" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="19" HeaderText="19" ReadOnly="True" SortExpression="19" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="20" HeaderText="20" ReadOnly="True" SortExpression="20" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="21" HeaderText="21" ReadOnly="True" SortExpression="21" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="22" HeaderText="22" ReadOnly="True" SortExpression="22" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="23" HeaderText="23" ReadOnly="True" SortExpression="23" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="24" HeaderText="24" ReadOnly="True" SortExpression="24" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="25" HeaderText="25" ReadOnly="True" SortExpression="25" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="26" HeaderText="26" ReadOnly="True" SortExpression="26" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="27" HeaderText="27" ReadOnly="True" SortExpression="27" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="28" HeaderText="28" ReadOnly="True" SortExpression="28" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="29" HeaderText="29" ReadOnly="True" SortExpression="29" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="30" HeaderText="30" ReadOnly="True" SortExpression="30" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="31" HeaderText="31" ReadOnly="True" SortExpression="31" DataFormatString="{0:#,0}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dsFechas" runat="server" ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>"
        SelectCommand="select min(dia) as dia,month(dia)*10000+year(dia) as MesAni from ins.horometro
group by month(dia),year(dia)
order by dia desc"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsDatos" runat="server" ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>"
        SelectCommand="select linea,[1],[2],[3],[4],[5],[6],[7],[8],[9],
[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],
[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],
[30],[31] from (
select 'L1' as linea,day(dia) as dia,sum(horometro1) as dato
from ins.horometro
where month(dia) = (@fecha-(@fecha%10000))/10000 and year(dia) = @fecha%10000
group by dia

union all

select 'L2' as linea,day(dia) as dia,sum(horometro2) as dato
from ins.horometro
where month(dia) = (@fecha-(@fecha%10000))/10000 and year(dia) = @fecha%10000
group by dia

union all

select 'L3' as linea,day(dia) as dia,sum(horometro3) as dato
from ins.horometro
where month(dia) = (@fecha-(@fecha%10000))/10000 and year(dia) = @fecha%10000
group by dia

union all

select 'L4' as linea,day(dia) as dia,sum(horometro4) as dato
from ins.horometro
where month(dia) = (@fecha-(@fecha%10000))/10000 and year(dia) = @fecha%10000
group by dia

union all

select 'L5' as linea,day(dia) as dia,sum(horometro5) as dato
from ins.horometro
where month(dia) = (@fecha-(@fecha%10000))/10000 and year(dia) = @fecha%10000
group by dia

union all

select 'L6' as linea,day(dia) as dia,sum(horometro6) as dato
from ins.horometro
where month(dia) = (@fecha-(@fecha%10000))/10000 and year(dia) = @fecha%10000
group by dia

union all

select 'L7' as linea,day(dia) as dia,sum(horometro7) as dato
from ins.horometro
where month(dia) = (@fecha-(@fecha%10000))/10000 and year(dia) = @fecha%10000
group by dia) as d
pivot (sum(dato) for dia in ([1],[2],[3],[4],[5],[6],[7],[8],[9],
[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],
[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],
[30],[31])) as p">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFecha" Name="fecha" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsGrafico" runat="server" ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>"
        SelectCommand="select dia,
sum(horometro1) as Linea1,
sum(horometro2) as Linea2,
sum(horometro3) as Linea3,
sum(horometro4) as Linea4,
sum(horometro5) as Linea5,
sum(horometro6) as Linea6,
sum(horometro7) as Linea7
from ins.horometro
where month(dia) = (@fecha-(@fecha%10000))/10000 and year(dia) = @fecha%10000
group by dia">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFecha" Name="fecha" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
