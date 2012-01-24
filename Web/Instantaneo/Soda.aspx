<%@ Page Title="Informe Operativo - Soda Instantaneo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Soda.aspx.cs" Inherits="Web.Instantaneo.Soda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Fecha</h2>
    <asp:Calendar ID="cal" runat="server" FirstDayOfWeek="Monday" CssClass="center"></asp:Calendar>
    <h3>Datos</h3>
    <asp:Chart ID="chart" runat="server" DataSourceID="ds" Width="900" Height="200">
        <Series>
            <asp:Series ChartType="Line" Name="Soda1" XValueMember="Hora" 
                YValueMembers="Soda1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Soda2" XValueMember="Hora" 
                YValueMembers="Soda2">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Soda3" XValueMember="Hora" 
                YValueMembers="Soda3">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Soda4" XValueMember="Hora" 
                YValueMembers="Soda4">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Soda5" XValueMember="Hora" 
                YValueMembers="Soda5">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Soda6" XValueMember="Hora" 
                YValueMembers="Soda6">
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
            <asp:BoundField DataField="Soda1" HeaderText="Soda1" SortExpression="Soda1" />
            <asp:BoundField DataField="Soda2" HeaderText="Soda2" SortExpression="Soda2" />
            <asp:BoundField DataField="Soda3" HeaderText="Soda3" SortExpression="Soda3" />
            <asp:BoundField DataField="Soda4" HeaderText="Soda4" SortExpression="Soda4" />
            <asp:BoundField DataField="Soda5" HeaderText="Soda5" SortExpression="Soda5" />
            <asp:BoundField DataField="Soda6" HeaderText="Soda6" SortExpression="Soda6" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>" SelectCommand="select Hora,Dia,Soda1,Soda2,Soda3,Soda4,Soda5,Soda6 from ins.Soda
where Dia = @dia
order by hora">
        <SelectParameters>
            <asp:ControlParameter ControlID="cal" Name="dia" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
