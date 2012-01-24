<%@ Page Title="Informe Operativo - Soda Totalizado" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Soda.aspx.cs" Inherits="Web.Totalizado.Soda" %>
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
            <asp:Series ChartType="StackedColumn" Name="Soda1" XValueMember="Dia" YValueMembers="Soda1">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Soda2" XValueMember="Dia" YValueMembers="Soda2">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Soda3" XValueMember="Dia" YValueMembers="Soda3">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Soda4" XValueMember="Dia" YValueMembers="Soda4">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Soda5" XValueMember="Dia" YValueMembers="Soda5">
            </asp:Series>
            <asp:Series ChartType="StackedColumn" Name="Soda6" XValueMember="Dia" YValueMembers="Soda6">
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
            <asp:BoundField DataField="Soda1" HeaderText="Soda1" ReadOnly="True" SortExpression="Soda1" />
            <asp:BoundField DataField="Soda2" HeaderText="Soda2" ReadOnly="True" SortExpression="Soda2" />
            <asp:BoundField DataField="Soda3" HeaderText="Soda3" ReadOnly="True" SortExpression="Soda3" />
            <asp:BoundField DataField="Soda4" HeaderText="Soda4" ReadOnly="True" SortExpression="Soda4" />
            <asp:BoundField DataField="Soda5" HeaderText="Soda5" ReadOnly="True" SortExpression="Soda5" />
            <asp:BoundField DataField="Soda6" HeaderText="Soda6" ReadOnly="True" SortExpression="Soda6" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>"
        SelectCommand="select Dia,
sum(Soda1) as Soda1,
sum(Soda2) as Soda2,
sum(Soda3) as Soda3,
sum(Soda4) as Soda4,
sum(Soda5) as Soda5,
sum(Soda6) as Soda6
from ins.Soda
where Dia between @inicio and @fin
group by Dia
order by Dia">
        <SelectParameters>
            <asp:ControlParameter ControlID="calInicio" Name="inicio" PropertyName="SelectedDate" />
            <asp:ControlParameter ControlID="calFin" Name="fin" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
