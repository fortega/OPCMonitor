﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Web.Presupuesto
{
    public partial class Agua : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargarAños();
                SeleccionaMes();
            }
        }

        void CargarAños()
        {
            ddlAño.Items.Clear();
            int esteAño = DateTime.Today.Year;
            for (int i = esteAño - 1; i < esteAño + 2; i++)
            {
                ListItem item = new ListItem(i.ToString());
                item.Selected = i == esteAño;
                ddlAño.Items.Add(item);
            }
        }

        void SeleccionaMes()
        {
            ddlMes.Items[DateTime.Today.Month - 1].Selected = true;
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            using (SqlConnection c =
                new SqlConnection(ConfigurationManager.ConnectionStrings["OPCMonitorConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(@"insert into pre.agua (Mes,Ani,agua1,agua2,agua3,agua4,agua5,agua6,agua7)
values (@Mes,@Ani,@agua1,@agua2,@agua3,@agua4,@agua5,@agua6,@agua7)", c);
                cmd.Parameters.Add("Mes", System.Data.SqlDbType.Int).Value = int.Parse(ddlMes.SelectedValue);
                cmd.Parameters.Add("Ani", System.Data.SqlDbType.Int).Value = int.Parse(ddlAño.SelectedValue);
                cmd.Parameters.Add("agua1", System.Data.SqlDbType.Float).Value = float.Parse(tbLinea1.Text);
                cmd.Parameters.Add("agua2", System.Data.SqlDbType.Float).Value = float.Parse(tbLinea2.Text);
                cmd.Parameters.Add("agua3", System.Data.SqlDbType.Float).Value = float.Parse(tbLinea3.Text);
                cmd.Parameters.Add("agua4", System.Data.SqlDbType.Float).Value = float.Parse(tbLinea4.Text);
                cmd.Parameters.Add("agua5", System.Data.SqlDbType.Float).Value = float.Parse(tbLinea5.Text);
                cmd.Parameters.Add("agua6", System.Data.SqlDbType.Float).Value = float.Parse(tbLinea6.Text);
                cmd.Parameters.Add("agua7", System.Data.SqlDbType.Float).Value = float.Parse(tbLinea7.Text);

                c.Open();
                cmd.ExecuteNonQuery();
                c.Close();

                gv.DataBind();
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            using (SqlConnection c =
                new SqlConnection(ConfigurationManager.ConnectionStrings["OPCMonitorConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("delete from pre.agua where Mes*10000+Ani = @MesAni", c);
                cmd.Parameters.Add("MesAni", System.Data.SqlDbType.Int).Value = int.Parse(b.CommandArgument);
                c.Open();
                cmd.ExecuteNonQuery();
                c.Close();

                gv.DataBind();
            }
        }
    }
}