<%@ Page Title="Informe Operativo - Horometro Instantaneo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Horometro.aspx.cs" Inherits="Web.Instantaneo.Horometro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Fecha</h2>
    <asp:Calendar ID="cal" runat="server" FirstDayOfWeek="Monday" CssClass="center"></asp:Calendar>
    <h3>Datos</h3>
    <asp:Chart ID="chart" runat="server" DataSourceID="ds" Width="900" Height="200">
        <Series>
            <asp:Series ChartType="Line" Name="Horometro1" XValueMember="Hora" 
                YValueMembers="Horometro1">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Horometro2" XValueMember="Hora" 
                YValueMembers="Horometro2">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Horometro3" XValueMember="Hora" 
                YValueMembers="Horometro3">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Horometro4" XValueMember="Hora" 
                YValueMembers="Horometro4">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Horometro5" XValueMember="Hora" 
                YValueMembers="Horometro5">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Horometro6" XValueMember="Hora" 
                YValueMembers="Horometro6">
            </asp:Series>
            <asp:Series ChartType="Line" Name="Horometro7" XValueMember="Hora" 
                YValueMembers="Horometro7">
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
            <asp:BoundField DataField="Horometro1" HeaderText="Horometro1" SortExpression="Horometro1" />
            <asp:BoundField DataField="Horometro2" HeaderText="Horometro2" SortExpression="Horometro2" />
            <asp:BoundField DataField="Horometro3" HeaderText="Horometro3" SortExpression="Horometro3" />
            <asp:BoundField DataField="Horometro4" HeaderText="Horometro4" SortExpression="Horometro4" />
            <asp:BoundField DataField="Horometro5" HeaderText="Horometro5" SortExpression="Horometro5" />
            <asp:BoundField DataField="Horometro6" HeaderText="Horometro6" SortExpression="Horometro6" />
            <asp:BoundField DataField="Horometro7" HeaderText="Horometro7" SortExpression="Horometro7" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>" SelectCommand="select Hora,Dia,Horometro1,Horometro2,Horometro3,Horometro4,Horometro5,Horometro6,Horometro7 from ins.Horometro
where Dia = @dia
order by hora">
        <SelectParameters>
            <asp:ControlParameter ControlID="cal" Name="dia" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
