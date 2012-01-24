<%@ Page Title="Informe Operativo - Aditivo Totalizado" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Aditivo.aspx.cs" Inherits="Web.Totalizado.Aditivo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table class="center">
        <tbody>
            <tr>
                <td>
                    <h2>
                        Inicio</h2>
                </td>
                <td>
                    <h2>
                        Fin</h2>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Calendar ID="calInicio" runat="server" FirstDayOfWeek="Monday"></asp:Calendar>
                </td>
                <td>
                    <asp:Calendar ID="calFin" runat="server" FirstDayOfWeek="Monday"></asp:Calendar>
                </td>
            </tr>
        </tbody>
    </table>
    <h3>
        Datos</h3>
    <asp:Chart ID="chart" runat="server" DataSourceID="ds" Width="900" Height="200">
        <Series>
            <asp:Series ChartType="StackedColumn" Name="Aditivo1" XValueMember="Dia" YValueMembers="Aditivo1">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Aditivo2" XValueMember="Dia" YValueMembers="Aditivo2">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Aditivo3" XValueMember="Dia" YValueMembers="Aditivo3">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Aditivo4" XValueMember="Dia" YValueMembers="Aditivo4">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Aditivo5" XValueMember="Dia" YValueMembers="Aditivo5">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Aditivo6" XValueMember="Dia" YValueMembers="Aditivo6">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataSourceID="ds"
        CssClass="center">
        <Columns>
            <asp:BoundField DataField="Dia" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Dia"
                SortExpression="Dia" />
            <asp:BoundField DataField="Aditivo1" HeaderText="Aditivo1" ReadOnly="True" SortExpression="Aditivo1" />
            <asp:BoundField DataField="Aditivo2" HeaderText="Aditivo2" ReadOnly="True" SortExpression="Aditivo2" />
            <asp:BoundField DataField="Aditivo3" HeaderText="Aditivo3" ReadOnly="True" SortExpression="Aditivo3" />
            <asp:BoundField DataField="Aditivo4" HeaderText="Aditivo4" ReadOnly="True" SortExpression="Aditivo4" />
            <asp:BoundField DataField="Aditivo5" HeaderText="Aditivo5" ReadOnly="True" SortExpression="Aditivo5" />
            <asp:BoundField DataField="Aditivo6" HeaderText="Aditivo6" ReadOnly="True" SortExpression="Aditivo6" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>"
        SelectCommand="select Dia,
sum(Aditivo1) as Aditivo1,
sum(Aditivo2) as Aditivo2,
sum(Aditivo3) as Aditivo3,
sum(Aditivo4) as Aditivo4,
sum(Aditivo5) as Aditivo5,
sum(Aditivo6) as Aditivo6
from ins.Aditivo
where Dia between @inicio and @fin
group by Dia
order by Dia">
        <SelectParameters>
            <asp:ControlParameter ControlID="calInicio" Name="inicio" PropertyName="SelectedDate" />
            <asp:ControlParameter ControlID="calFin" Name="fin" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
