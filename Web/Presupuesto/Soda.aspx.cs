using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

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
                SqlDataAdapter da = new SqlDataAdapter("select soda1,soda2,soda3,soda4,soda5,soda6 from factores", c);
                DataTable dt = new DataTable();
                da.Fill(dt);

                tbFactor1.Text = dt.Rows[0]["soda1"].ToString();
                tbFactor2.Text = dt.Rows[0]["soda2"].ToString();
                tbFactor3.Text = dt.Rows[0]["soda3"].ToString();
                tbFactor4.Text = dt.Rows[0]["soda4"].ToString();
                tbFactor5.Text = dt.Rows[0]["soda5"].ToString();
                tbFactor6.Text = dt.Rows[0]["soda6"].ToString();
            }
        }


        protected void btnFactor_Click(object sender, EventArgs e)
        {
            using (SqlConnection c =
                new SqlConnection(ConfigurationManager.ConnectionStrings["OPCMonitorConnectionString"].ConnectionString))
            {
                SqlCommand cmd =
                    new SqlCommand("update factores set soda1 = @factor1, soda2 = @factor2, soda3 = @factor3, soda4 = @factor4, soda5 = @factor5, soda6 = @factor6", c);
                cmd.Parameters.Add("factor1", System.Data.SqlDbType.Float).Value = double.Parse(tbFactor1.Text);
                cmd.Parameters.Add("factor2", System.Data.SqlDbType.Float).Value = double.Parse(tbFactor2.Text);
                cmd.Parameters.Add("factor3", System.Data.SqlDbType.Float).Value = double.Parse(tbFactor3.Text);
                cmd.Parameters.Add("factor4", System.Data.SqlDbType.Float).Value = double.Parse(tbFactor4.Text);
                cmd.Parameters.Add("factor5", System.Data.SqlDbType.Float).Value = double.Parse(tbFactor5.Text);
                cmd.Parameters.Add("factor6", System.Data.SqlDbType.Float).Value = double.Parse(tbFactor6.Text);

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