<%@ Page Title="Cuenta Instantanea de Horometro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Horometro.aspx.cs" Inherits="Web.Instantaneo.Horometro" %>
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
                YValueMembers="horometro1" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L2" XValueMember="Hora" 
                YValueMembers="horometro2" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L3" XValueMember="Hora" 
                YValueMembers="horometro3" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L4" XValueMember="Hora" 
                YValueMembers="horometro4" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L5" XValueMember="Hora" 
                YValueMembers="horometro5" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L6" XValueMember="Hora" 
                YValueMembers="horometro6" BorderWidth="3" Legend="Legend1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="L7" XValueMember="Hora" 
                YValueMembers="horometro7" BorderWidth="3" Legend="Legend1">
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
            <asp:BoundField DataField="horometro1" HeaderText="Linea 1 (Hrs)" SortExpression="horometro1" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="horometro2" HeaderText="Linea 2 (Hrs)" SortExpression="horometro2" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="horometro3" HeaderText="Linea 3 (Hrs)" SortExpression="horometro3" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="horometro4" HeaderText="Linea 4 (Hrs)" SortExpression="horometro4" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="horometro5" HeaderText="Linea 5 (Hrs)" SortExpression="horometro5" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="horometro6" HeaderText="Linea 6 (Hrs)" SortExpression="horometro6" DataFormatString="{0:#,0}" />
            <asp:BoundField DataField="horometro7" HeaderText="Linea 7 (Hrs)" SortExpression="horometro7" DataFormatString="{0:#,0}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>" SelectCommand="select min(hora) as hora,
sum(horometro1) as horometro1,sum(horometro2) as horometro2,
sum(horometro3) as horometro3,sum(horometro4) as horometro4,
sum(horometro5) as horometro5,sum(horometro6) as horometro6,
sum(horometro7) as horometro7
from ins.horometro
where dia = @dia
group by datepart(hh,hora)
order by hora">
        <SelectParameters>
            <asp:ControlParameter ControlID="cal" Name="dia" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
