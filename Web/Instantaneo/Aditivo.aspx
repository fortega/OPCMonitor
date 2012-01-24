<%@ Page Title="Informe Operativo - Aditivo Instantaneo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Aditivo.aspx.cs" Inherits="Web.Instantaneo.Aditivo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Fecha</h2>
    <asp:Calendar ID="cal" runat="server" FirstDayOfWeek="Monday" CssClass="center"></asp:Calendar>
    <h3>Datos</h3>
    <asp:Chart ID="chart" runat="server" DataSourceID="ds" Width="900" Height="200">
        <Series>
            <asp:Series ChartType="Line" Name="Aditivo1" XValueMember="Hora" 
                YValueMembers="Aditivo1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Aditivo2" XValueMember="Hora" 
                YValueMembers="Aditivo2">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Aditivo3" XValueMember="Hora" 
                YValueMembers="Aditivo3">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Aditivo4" XValueMember="Hora" 
                YValueMembers="Aditivo4">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Aditivo5" XValueMember="Hora" 
                YValueMembers="Aditivo5">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Aditivo6" XValueMember="Hora" 
                YValueMembers="Aditivo6">
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
            <asp:BoundField DataField="Aditivo1" HeaderText="Aditivo1" SortExpression="Aditivo1" />
            <asp:BoundField DataField="Aditivo2" HeaderText="Aditivo2" SortExpression="Aditivo2" />
            <asp:BoundField DataField="Aditivo3" HeaderText="Aditivo3" SortExpression="Aditivo3" />
            <asp:BoundField DataField="Aditivo4" HeaderText="Aditivo4" SortExpression="Aditivo4" />
            <asp:BoundField DataField="Aditivo5" HeaderText="Aditivo5" SortExpression="Aditivo5" />
            <asp:BoundField DataField="Aditivo6" HeaderText="Aditivo6" SortExpression="Aditivo6" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>" SelectCommand="select Hora,Dia,Aditivo1,Aditivo2,Aditivo3,Aditivo4,Aditivo5,Aditivo6 from ins.Aditivo
where Dia = @dia
order by hora">
        <SelectParameters>
            <asp:ControlParameter ControlID="cal" Name="dia" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
