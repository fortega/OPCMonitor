<%@ Page Title="Presupuesto Diario de Soda" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="soda.aspx.cs" Inherits="Web.Presupuesto.soda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Factores</h2>
    Est 1 Lav 1: <asp:TextBox ID="tbFactor1" runat="server"></asp:TextBox><br />
    Est 2 Lav 1: <asp:TextBox ID="tbFactor2" runat="server"></asp:TextBox><br />
    Est 1 Lav 2: <asp:TextBox ID="tbFactor3" runat="server"></asp:TextBox><br />
    Est 2 Lav 2: <asp:TextBox ID="tbFactor4" runat="server"></asp:TextBox><br />
    Est 1 Lav 4: <asp:TextBox ID="tbFactor5" runat="server"></asp:TextBox><br />
    Est 2 Lav 4: <asp:TextBox ID="tbFactor6" runat="server"></asp:TextBox><br />
    <asp:Button ID="btnFactor" runat="server" Text="Actualizar" 
        onclick="btnFactor_Click" />
    <h2>Crear</h2>
    <table>
        <tbody>
            <tr>
                <td>Mes</td>
                <td>
                    <asp:DropDownList ID="ddlMes" runat="server">
                        <asp:ListItem Text="Enero" Value="1" />
                        <asp:ListItem Text="Febrero" Value="2" />
                        <asp:ListItem Text="Marzo" Value="3" />
                        <asp:ListItem Text="Abril" Value="4" />
                        <asp:ListItem Text="Mayo" Value="5" />
                        <asp:ListItem Text="Junio" Value="6" />
                        <asp:ListItem Text="Julio" Value="7" />
                        <asp:ListItem Text="Agosto" Value="8" />
                        <asp:ListItem Text="Septiembre" Value="9" />
                        <asp:ListItem Text="Octubre" Value="10" />
                        <asp:ListItem Text="Noviembre" Value="11" />
                        <asp:ListItem Text="Diciembre" Value="12" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Año</td>
                <td>
                    <asp:DropDownList ID="ddlAño" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Est 1 Lav 1</td>
                <td>
                    <asp:TextBox ID="tbLinea1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="*"
                     ControlToValidate="tbLinea1" ValidationGroup="crear" />
                    <asp:RegularExpressionValidator ID="rev1" runat="server" 
                        ControlToValidate="tbLinea1" ErrorMessage="Numero Invalido" 
                        ValidationExpression="\d{1,5}" ValidationGroup="crear" />
                </td>
            </tr>
            <tr>
                <td>Est 2 Lav 1</td>
                <td>
                <asp:TextBox ID="tbLinea2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="*"
                     ControlToValidate="tbLinea2" ValidationGroup="crear" />
                    <asp:RegularExpressionValidator ID="rev2" runat="server" 
                        ControlToValidate="tbLinea2" ErrorMessage="Numero Invalido" 
                        ValidationExpression="\d{1,5}" ValidationGroup="crear" />
                </td>
            </tr>
            <tr>
                <td>Est 1 Lav 2</td>
                <td>
                    <asp:TextBox ID="tbLinea3" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv3" runat="server" ErrorMessage="*"
                    ControlToValidate="tbLinea3" ValidationGroup="crear" />
                    <asp:RegularExpressionValidator ID="rev3" runat="server" 
                        ControlToValidate="tbLinea3" ErrorMessage="Numero Invalido" 
                        ValidationExpression="\d{1,5}" ValidationGroup="crear" />
                </td>
            </tr>
            <tr>
                <td>Est 2 Lav 2</td>
                <td>
                    <asp:TextBox ID="tbLinea4" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv4" runat="server" ErrorMessage="*" 
                        ControlToValidate="tbLinea4" ValidationGroup="crear" />
                    <asp:RegularExpressionValidator ID="rev4" runat="server" 
                        ControlToValidate="tbLinea4" ErrorMessage="Numero Invalido" 
                        ValidationExpression="\d{1,5}" ValidationGroup="crear" /></td>
            </tr>
            <tr>
                <td>Est 1 Lav 4</td>
                <td>
                    <asp:TextBox ID="tbLinea5" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv5" runat="server" ErrorMessage="*" 
                        ControlToValidate="tbLinea5" ValidationGroup="crear" />
                    <asp:RegularExpressionValidator ID="rev5" runat="server" 
                        ControlToValidate="tbLinea5" ErrorMessage="Numero Invalido" 
                        ValidationExpression="\d{1,5}" ValidationGroup="crear" />
                </td>
            </tr>
            <tr>
                <td>Est 2 Lav 4</td>
                <td>
                    <asp:TextBox ID="tbLinea6" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv6" runat="server" ErrorMessage="*" 
                        ControlToValidate="tbLinea6" ValidationGroup="crear" />
                    <asp:RegularExpressionValidator ID="rev6" runat="server" 
                        ControlToValidate="tbLinea6" ErrorMessage="Numero Invalido" 
                        ValidationExpression="\d{1,5}" ValidationGroup="crear" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnCrear" runat="server" Text="Crear" ValidationGroup="crear" 
                        onclick="btnCrear_Click" />
                </td>
            </tr>
        </tbody>
    </table>
    <h2>Lista</h2>
    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Mes,Ani" DataSourceID="ds" Width="960">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnEliminar" runat="server" 
                        CommandArgument='<%# Eval("MesAni") %>' onclick="btnEliminar_Click" 
                        Text="Eliminar" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Mes" HeaderText="Mes" ReadOnly="True" 
                SortExpression="Mes" />
            <asp:BoundField DataField="Ani" HeaderText="Año" ReadOnly="True" 
                SortExpression="Ani" />
            <asp:BoundField DataField="soda1" HeaderText="Est 1 Lav 1" 
                SortExpression="soda1" />
            <asp:BoundField DataField="soda2" HeaderText="Est 2 Lav 1" 
                SortExpression="soda2" />
            <asp:BoundField DataField="soda3" HeaderText="Est 1 Lav 2" 
                SortExpression="soda3" />
            <asp:BoundField DataField="soda4" HeaderText="Est 2 Lav 2" 
                SortExpression="soda4" />
            <asp:BoundField DataField="soda5" HeaderText="Est 1 Lav 4" 
                SortExpression="soda5" />
            <asp:BoundField DataField="soda6" HeaderText="Est 2 Lav 4" 
                SortExpression="soda6" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>" SelectCommand="select Mes,Ani,soda1,soda2,soda3,soda4,soda5,soda6,Mes*10000+Ani as MesAni
from pre.soda
order by Mes,Ani" >
    </asp:SqlDataSource>
</asp:Content>
