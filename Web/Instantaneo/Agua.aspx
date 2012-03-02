<%@ Page Title="Consumo Instantaneo de Agua" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agua.aspx.cs" Inherits="Web.Instantaneo.Agua" %>
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
                YValueMembers="agua1" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L2" XValueMember="Hora" 
                YValueMembers="agua2" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L3" XValueMember="Hora" 
                YValueMembers="agua3" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L4" XValueMember="Hora" 
                YValueMembers="agua4" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L5" XValueMember="Hora" 
                YValueMembers="agua5" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L6" XValueMember="Hora" 
                YValueMembers="agua6" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L7" XValueMember="Hora" 
                YValueMembers="agua7" BorderWidth="3" Legend="Legend1">
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
            <asp:BoundField DataField="agua1" HeaderText="Linea 1 (Lts)" SortExpression="agua1" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="agua2" HeaderText="Linea 2 (Lts)" SortExpression="agua2" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="agua3" HeaderText="Linea 3 (Lts)" SortExpression="agua3" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="agua4" HeaderText="Linea 4 (Lts)" SortExpression="agua4" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="agua5" HeaderText="Linea 5 (Lts)" SortExpression="agua5" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="agua6" HeaderText="Linea 6 (Lts)" SortExpression="agua6" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="agua7" HeaderText="Linea 7 (Lts)" SortExpression="agua7" DataFormatString="{0:#,0}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>" SelectCommand="select min(hora) as hora,
sum(agua1) as agua1,sum(agua2) as agua2,
sum(agua3) as agua3,sum(agua4) as agua4,
sum(agua5) as agua5,sum(agua6) as agua6,
sum(agua7) as agua7
from ins.agua
where dia = @dia
group by datepart(hh,hora)
order by hora">
        <SelectParameters>
            <asp:ControlParameter ControlID="cal" Name="dia" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
