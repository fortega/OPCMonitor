<%@ Page Title="Informe Operativo - Horometro Totalizado" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Horometro.aspx.cs" Inherits="Web.Totalizado.Horometro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table class="center">
    <tbody>
        <tr>
            <td><h2>Inicio</h2></td>
            <td><h2>Fin</h2></td>
        </tr>
        <tr>
            <td><asp:Calendar ID="calInicio" runat="server" FirstDayOfWeek="Monday"></asp:Calendar></td>
            <td><asp:Calendar ID="calFin" runat="server" FirstDayOfWeek="Monday"></asp:Calendar></td>
        </tr>
    </tbody>
</table>
    <h3>Datos</h3>
    <asp:Chart ID="chart" runat="server" DataSourceID="ds" Width="900" Height="200">
        <Series>
            <asp:Series ChartType="StackedColumn" Name="Horometro1" XValueMember="Dia" 
                YValueMembers="Horometro1">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Horometro2" XValueMember="Dia" 
                YValueMembers="Horometro2">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Horometro3" XValueMember="Dia" 
                YValueMembers="Horometro3">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Horometro4" XValueMember="Dia" 
                YValueMembers="Horometro4">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Horometro5" XValueMember="Dia" 
                YValueMembers="Horometro5">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Horometro6" XValueMember="Dia" 
                YValueMembers="Horometro6">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Horometro7" XValueMember="Dia" 
                YValueMembers="Horometro7">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" 
        DataSourceID="ds" CssClass="center">
        <Columns>
            <asp:BoundField DataField="Dia" DataFormatString="{0:dd-MM-yyyy}" 
                HeaderText="Dia" SortExpression="Dia" />
            <asp:BoundField DataField="Horometro1" HeaderText="Horometro1" ReadOnly="True" 
                SortExpression="Horometro1" />
            <asp:BoundField DataField="Horometro2" HeaderText="Horometro2" ReadOnly="True" 
                SortExpression="Horometro2" />
            <asp:BoundField DataField="Horometro3" HeaderText="Horometro3" ReadOnly="True" 
                SortExpression="Horometro3" />
            <asp:BoundField DataField="Horometro4" HeaderText="Horometro4" ReadOnly="True" 
                SortExpression="Horometro4" />
            <asp:BoundField DataField="Horometro5" HeaderText="Horometro5" ReadOnly="True" 
                SortExpression="Horometro5" />
            <asp:BoundField DataField="Horometro6" HeaderText="Horometro6" ReadOnly="True" 
                SortExpression="Horometro6" />
            <asp:BoundField DataField="Horometro7" HeaderText="Horometro7" ReadOnly="True" 
                SortExpression="Horometro7" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>" SelectCommand="select Dia,
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
            <asp:ControlParameter ControlID="calInicio" Name="inicio" 
                PropertyName="SelectedDate" />
            <asp:ControlParameter ControlID="calFin" Name="fin" 
                PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
