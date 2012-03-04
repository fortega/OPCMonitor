using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Web.Presupuesto
{
    public partial class soda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                cargarFactor();
                CargarAños();
                SeleccionaMes();
            }
        }

        void cargarFactor()
        {
            using (SqlConnection c =
                new SqlConnection(ConfigurationManager.ConnectionStrings["OPCMonitorConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("select soda from factores", c);

                c.Open();
                double factor = (double)cmd.ExecuteScalar();
                c.Close();

                tbFactor.Text = factor.ToString();
            }
        }


        protected void btnFactor_Click(object sender, EventArgs e)
        {
            using (SqlConnection c =
                new SqlConnection(ConfigurationManager.ConnectionStrings["OPCMonitorConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("update factores set soda = @factor", c);
                cmd.Parameters.Add("factor", System.Data.SqlDbType.Float).Value = float.Parse(tbFactor.Text);
                
                c.Open();
                cmd.ExecuteNonQuery();
                c.Close();
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
                SqlCommand cmd = new SqlCommand(@"insert into pre.soda (Mes,Ani,soda1,soda2,soda3,soda4,soda5,soda6)
values (@Mes,@Ani,@soda1,@soda2,@soda3,@soda4,@soda5,@soda6)", c);
                cmd.Parameters.Add("Mes", System.Data.SqlDbType.Int).Value = int.Parse(ddlMes.SelectedValue);
                cmd.Parameters.Add("Ani", System.Data.SqlDbType.Int).Value = int.Parse(ddlAño.SelectedValue);
                cmd.Parameters.Add("soda1", System.Data.SqlDbType.Float).Value = float.Parse(tbLinea1.Text);
                cmd.Parameters.Add("soda2", System.Data.SqlDbType.Float).Value = float.Parse(tbLinea2.Text);
                cmd.Parameters.Add("soda3", System.Data.SqlDbType.Float).Value = float.Parse(tbLinea3.Text);
                cmd.Parameters.Add("soda4", System.Data.SqlDbType.Float).Value = float.Parse(tbLinea4.Text);
                cmd.Parameters.Add("soda5", System.Data.SqlDbType.Float).Value = float.Parse(tbLinea5.Text);
                cmd.Parameters.Add("soda6", System.Data.SqlDbType.Float).Value = float.Parse(tbLinea6.Text);

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
                SqlCommand cmd = new SqlCommand("delete from pre.soda where Mes*10000+Ani = @MesAni", c);
                cmd.Parameters.Add("MesAni", System.Data.SqlDbType.Int).Value = int.Parse(b.CommandArgument);
                c.Open();
                cmd.ExecuteNonQuery();
                c.Close();

                gv.DataBind();
            }
        }
    }
}