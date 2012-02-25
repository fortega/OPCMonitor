<%@ Page Title="Consumo Instantaneo de Lubricante" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lubricante.aspx.cs" Inherits="Web.Instantaneo.Lubricante" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Fecha</h2>
    <asp:Calendar ID="cal" runat="server" FirstDayOfWeek="Monday" 
        CssClass="centerTable"></asp:Calendar>
    <h3>Datos</h3>
    <asp:Chart ID="chart" runat="server" DataSourceID="ds"  Width="960" Height="231">
        <Series>
            <asp:Series ChartType="Line" Name="L1" XValueMember="Hora" 
                YValueMembers="Lubricante1" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L2" XValueMember="Hora" 
                YValueMembers="Lubricante2" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L3" XValueMember="Hora" 
                YValueMembers="Lubricante3" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L4" XValueMember="Hora" 
                YValueMembers="Lubricante4" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L5" XValueMember="Hora" 
                YValueMembers="Lubricante5" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L6" XValueMember="Hora" 
                YValueMembers="Lubricante6" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L7" XValueMember="Hora" 
                YValueMembers="Lubricante7" BorderWidth="3" Legend="Legend1">
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
            <asp:BoundField DataField="Lubricante1" HeaderText="Linea 1" SortExpression="Lubricante1" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="Lubricante2" HeaderText="Linea 2" SortExpression="Lubricante2" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="Lubricante3" HeaderText="Linea 3" SortExpression="Lubricante3" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="Lubricante4" HeaderText="Linea 4" SortExpression="Lubricante4" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="Lubricante5" HeaderText="Linea 5" SortExpression="Lubricante5" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="Lubricante6" HeaderText="Linea 6" SortExpression="Lubricante6" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="Lubricante7" HeaderText="Linea 7" SortExpression="Lubricante7" DataFormatString="{0:#,0}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>" SelectCommand="select min(hora) as hora,
sum(lubricante1) as lubricante1,sum(lubricante2) as lubricante2,
sum(lubricante3) as lubricante3,sum(lubricante4) as lubricante4,
sum(lubricante5) as lubricante5,sum(lubricante6) as lubricante6,
sum(lubricante7) as lubricante7
from ins.lubricante
where dia = @dia
group by datepart(hh,hora)
order by hora">
        <SelectParameters>
            <asp:ControlParameter ControlID="cal" Name="dia" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
