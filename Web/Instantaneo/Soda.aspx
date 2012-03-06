<%@ Page Title="Consumo Instantaneo de Soda" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Soda.aspx.cs" Inherits="Web.Instantaneo.Soda" %>
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
                YValueMembers="soda1" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="E2L1" XValueMember="Hora" 
                YValueMembers="soda2" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="E1L2" XValueMember="Hora" 
                YValueMembers="soda3" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="E2L2" XValueMember="Hora" 
                YValueMembers="soda4" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="E1L4" XValueMember="Hora" 
                YValueMembers="soda5" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="E2L4" XValueMember="Hora" 
                YValueMembers="soda6" BorderWidth="3" Legend="Legend1">
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
            <asp:BoundField DataField="soda1" HeaderText="Est 1 Lav 1" SortExpression="soda1" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="soda2" HeaderText="Est 2 Lav 1" SortExpression="soda2" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="soda3" HeaderText="Est 1 Lav 2" SortExpression="soda3" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="soda4" HeaderText="Est 2 Lav 2" SortExpression="soda4" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="soda5" HeaderText="Est 1 Lav 4" SortExpression="soda5" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="soda6" HeaderText="Est 2 Lav 4" SortExpression="soda6" DataFormatString="{0:#,0}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>" SelectCommand="declare @factor1 float
declare @factor2 float
declare @factor3 float
declare @factor4 float
declare @factor5 float
declare @factor6 float
set @factor1 = (select soda1 from factores)
set @factor2 = (select soda2 from factores)
set @factor3 = (select soda3 from factores)
set @factor4 = (select soda4 from factores)
set @factor5 = (select soda5 from factores)
set @factor6 = (select soda6 from factores);

select min(hora) as hora,
sum(soda1)*@factor1 as soda1,sum(soda2)*@factor2 as soda2,
sum(soda3)*@factor3 as soda3,sum(soda4)*@factor4 as soda4,
sum(soda5)*@factor5 as soda5,sum(soda6)*@factor6 as soda6
from ins.soda
where dia = @dia
group by datepart(hh,hora)
order by hora">
        <SelectParameters>
            <asp:ControlParameter ControlID="cal" Name="dia" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
