<%@ Page Title="Consumo Instantaneo de Aditivo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Aditivo.aspx.cs" Inherits="Web.Instantaneo.Aditivo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Fecha</h2>
    <asp:Calendar ID="cal" runat="server" FirstDayOfWeek="Monday" 
        CssClass="centerTable"></asp:Calendar>
    <h3>Datos</h3>
    <asp:Chart ID="chart" runat="server" DataSourceID="ds"  Width="960" Height="231">
        <Series>
            <asp:Series ChartType="Line" Name="E1L1" XValueMember="Hora" 
                YValueMembers="aditivo1" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="E2L1" XValueMember="Hora" 
                YValueMembers="aditivo2" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="E1L2" XValueMember="Hora" 
                YValueMembers="aditivo3" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="E2L2" XValueMember="Hora" 
                YValueMembers="aditivo4" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="E1L4" XValueMember="Hora" 
                YValueMembers="aditivo5" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="E2L4" XValueMember="Hora" 
                YValueMembers="aditivo6" BorderWidth="3" Legend="Legend1">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Interval="1" IntervalType="Hours" IsMarginVisible="false">
                <LabelStyle Format="{0:HH:mm}" />
                </AxisX>
            </asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend Alignment="Center" Docking="Bottom" Name="Legend1" 
                TableStyle="Wide">
            </asp:Legend>
        </Legends>
    </asp:Chart>
    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Hora" DataSourceID="ds" CssClass="center" Width="960">
        <Columns>
            <asp:BoundField DataField="Hora" DataFormatString="{0:HH:mm}" HeaderText="Hora" 
                ReadOnly="True" SortExpression="Hora" />
            <asp:BoundField DataField="aditivo1" HeaderText="Est 1 Lav 1" SortExpression="aditivo1" DataFormatString="{0:#,0.0}" />
            <asp:BoundField DataField="aditivo2" HeaderText="Est 2 Lav 1" SortExpression="aditivo2" DataFormatString="{0:#,0.0}" />
            <asp:BoundField DataField="aditivo3" HeaderText="Est 1 Lav 2" SortExpression="aditivo3" DataFormatString="{0:#,0.0}" />
            <asp:BoundField DataField="aditivo4" HeaderText="Est 2 Lav 2" SortExpression="aditivo4" DataFormatString="{0:#,0.0}" />
            <asp:BoundField DataField="aditivo5" HeaderText="Est 1 Lav 4" SortExpression="aditivo5" DataFormatString="{0:#,0.0}" />
            <asp:BoundField DataField="aditivo6" HeaderText="Est 2 Lav 4" SortExpression="aditivo6" DataFormatString="{0:#,0.0}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>" SelectCommand="declare @factor1 float
declare @factor2 float
declare @factor3 float
declare @factor4 float
declare @factor5 float
declare @factor6 float
set @factor1 = (select aditivo1 from factores)
set @factor2 = (select aditivo2 from factores)
set @factor3 = (select aditivo3 from factores)
set @factor4 = (select aditivo4 from factores)
set @factor5 = (select aditivo5 from factores)
set @factor6 = (select aditivo6 from factores)

select min(hora) as hora,
sum(aditivo1)*@factor1 as aditivo1,sum(aditivo2)*@factor2 as aditivo2,
sum(aditivo3)*@factor3 as aditivo3,sum(aditivo4)*@factor4 as aditivo4,
sum(aditivo5)*@factor5 as aditivo5,sum(aditivo6)*@factor6 as aditivo6
from ins.aditivo
where dia = @dia
group by datepart(hh,hora)
order by hora">
        <SelectParameters>
            <asp:ControlParameter ControlID="cal" Name="dia" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
