﻿<%@ Page Title="Presupuesto Diario de Horometro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Horometro.aspx.cs" Inherits="Web.Presupuesto.Horometro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
                <td>Linea 1</td>
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
                <td>Linea 2</td>
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
                <td>Linea 3</td>
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
                <td>Linea 4</td>
                <td>
                    <asp:TextBox ID="tbLinea4" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv4" runat="server" ErrorMessage="*" 
                        ControlToValidate="tbLinea4" ValidationGroup="crear" />
                    <asp:RegularExpressionValidator ID="rev4" runat="server" 
                        ControlToValidate="tbLinea4" ErrorMessage="Numero Invalido" 
                        ValidationExpression="\d{1,5}" ValidationGroup="crear" /></td>
            </tr>
            <tr>
                <td>Linea 5</td>
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
                <td>Linea 6</td>
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
                <td>Linea 7</td>
                <td>
                    <asp:TextBox ID="tbLinea7" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv7" runat="server" ErrorMessage="*" 
                        ControlToValidate="tbLinea7" ValidationGroup="crear" />
                    <asp:RegularExpressionValidator ID="rev7" runat="server" 
                        ControlToValidate="tbLinea7" ErrorMessage="Numero Invalido" 
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
            <asp:BoundField DataField="horometro1" HeaderText="Linea 1 (Hrs)" 
                SortExpression="horometro1" />
            <asp:BoundField DataField="horometro2" HeaderText="Linea 2 (Hrs)" 
                SortExpression="horometro2" />
            <asp:BoundField DataField="horometro3" HeaderText="Linea 3 (Hrs)" 
                SortExpression="horometro3" />
            <asp:BoundField DataField="horometro4" HeaderText="Linea 4 (Hrs)" 
                SortExpression="horometro4" />
            <asp:BoundField DataField="horometro5" HeaderText="Linea 5 (Hrs)" 
                SortExpression="horometro5" />
            <asp:BoundField DataField="horometro6" HeaderText="Linea 6 (Hrs)" 
                SortExpression="horometro6" />
            <asp:BoundField DataField="horometro7" HeaderText="Linea 7 (Hrs)" 
                SortExpression="horometro7" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="ds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OPCMonitorConnectionString %>" SelectCommand="select Mes,Ani,horometro1,horometro2,horometro3,horometro4,horometro5,horometro6,horometro7,Mes*10000+Ani as MesAni
from pre.horometro
order by Mes,Ani" >
        <InsertParameters>
            <asp:Parameter Name="Mes" />
            <asp:Parameter Name="Ani" />
            <asp:Parameter Name="horometro1" />
            <asp:Parameter Name="horometro2" />
            <asp:Parameter Name="horometro3" />
            <asp:Parameter Name="horometro4" />
            <asp:Parameter Name="horometro5" />
            <asp:Parameter Name="horometro6" />
            <asp:Parameter Name="horometro7" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
