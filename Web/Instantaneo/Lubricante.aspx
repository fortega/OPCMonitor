<%@ Page Title="Informe Operativo - Lubricante Instantaneo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Lubricante.aspx.cs" Inherits="Web.Instantaneo.Lubricante" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Fecha</h2>
    <asp:Calendar ID="cal" runat="server" FirstDayOfWeek="Monday" CssClass="center"></asp:Calendar>
    <h3>Datos</h3>
    <asp:Chart ID="chart" runat="server" DataSourceID="ds" Width="900" Height="200">
        <Series>
            <asp:Series ChartType="Line" Name="Lubricante1" XValueMember="Hora" 
                YValueMembers="Lubricante1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Lubricante2" XValueMember="Hora" 
                YValueMembers="Lubricante2">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Lubricante3" XValueMember="Hora" 
                YValueMembers="Lubricante3">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Lubricante4" XValueMember="Hora" 
                YValueMembers="Lubricante4">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Lubricante5" XValueMember="Hora" 
                YValueMembers="Lubricante5">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Lubricante6" XValueMember="Hora" 
                YValueMembers="Lubricante6">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Lubricante7" XValueMember="Hora" 
                YValueMembers="Lubricante7">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX Interval="1" IntervalType="Hours">
                <LabelStyle Format="{0:HH:mm}" />
                </AxisX>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Hora" DataSourceID="ds" CssClass="center">
        <Columns>
            <asp:BoundField DataField="Hora" DataFormatString="{0:HH:mm}" HeaderText="Hora" 
                ReadOnly="True" SortExpression="Hora" />
            <asp:BoundField DataField="Lubricante1" HeaderText="Lubricante1" SortExpression="Lubricante1" />
            <asp:BoundField DataField="Lubricante2" HeaderText="Lubricante2" SortExpression="Lubricante2" />
            <asp:BoundField DataField="Lubricante3" HeaderText="Lubricante3" SortExpression="Lubricante3" />
            <asp:BoundField DataField="Lubricante4" HeaderText="Lubricante4" SortExpression="Lubricante4" />
            <asp:BoundField DataField="Lubricante5" HeaderText="Lubricante5" SortExpression="Lubricante5" />
            <asp:BoundField DataField="Lubricante6" HeaderText="Lubricante6" SortExpression="Lubricante6" />
            <asp:BoundField DataField="Lubricante7" HeaderText="Lubricante7" SortExpression="Lubricante7" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>" SelectCommand="select Hora,Dia,Lubricante1,Lubricante2,Lubricante3,Lubricante4,Lubricante5,Lubricante6,Lubricante7 from ins.Lubricante
where Dia = @dia
order by hora">
        <SelectParameters>
            <asp:ControlParameter ControlID="cal" Name="dia" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
