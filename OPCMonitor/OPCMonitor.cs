using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Timers;
using OPCHelper;
using System.Data.SqlClient;

namespace OPCMonitor
{
    public partial class OPCMonitor : ServiceBase
    {
        private OPCConnection opc;
        private Timer t;
        private bool first = true;

        #region ServiceBase
        public OPCMonitor()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            opc = new OPCConnection(Properties.Settings.Default.ProgID);
            t = new Timer();

            foreach (string name in new string[] { "agua", "lubric", "horom" })
            {
                for (int i = 1; i <= 7; i++)
                {
                    string queryName = string.Concat(name, i);
                    string tagName = string.Concat(Properties.Settings.Default.ItemBase, ".", queryName);
                    opc.AddItem(queryName, tagName);
                }
            }

            foreach (string name in new string[] { "soda", "aditiv" })
            {
                for (int i = 1; i <= 6; i++)
                {
                    string queryName = string.Concat(name, i);
                    string tagName = string.Concat(Properties.Settings.Default.ItemBase, ".", queryName);
                    opc.AddItem(queryName, tagName);
                }
            }

            t.Elapsed += new ElapsedEventHandler(t_Elapsed);

            t.Interval = nextInterval;
            t.Start();
        }

        protected override void OnStop(){
            t.Stop();

            opc.Dispose();
        }
        #endregion

        void t_Elapsed(object sender, ElapsedEventArgs e)
        {
            if (first)
            {
                first = false;
            }
            else
            {
                try
                {
                    double[] valAgua = getItemValues("agua", 7),
                        valLubricante = getItemValues("lubric", 7),
                        valHorometro = getItemValues("horom", 7),
                        valSoda = getItemValues("soda", 6),
                        valAditivo = getItemValues("aditiv", 6);

                    using (SqlConnection con = new SqlConnection(Properties.Settings.Default.ConnectionString))
                    {
                        SqlCommand cmdAgua = new SqlCommand(Properties.Settings.Default.spAgua, con);
                        cmdAgua.CommandType = CommandType.StoredProcedure;
                        for (int i = 1; i <= valAgua.Length; i++)
                        {
                            cmdAgua.Parameters.Add("agua" + i, SqlDbType.Float).Value = valAgua[i - 1];
                        }

                        SqlCommand cmdLubricante = new SqlCommand(Properties.Settings.Default.spLubricante, con);
                        cmdLubricante.CommandType = CommandType.StoredProcedure;
                        for (int i = 1; i <= valLubricante.Length; i++)
                        {
                            cmdLubricante.Parameters.Add("lubricante" + i, SqlDbType.Float).Value = valLubricante[i - 1];
                        }

                        SqlCommand cmdHorometro = new SqlCommand(Properties.Settings.Default.spHorometro, con);
                        cmdHorometro.CommandType = CommandType.StoredProcedure;
                        for (int i = 1; i <= valHorometro.Length; i++)
                        {
                            cmdHorometro.Parameters.Add("horometro" + i, SqlDbType.Float).Value = valHorometro[i - 1];
                        }

                        SqlCommand cmdSoda = new SqlCommand(Properties.Settings.Default.spSoda, con);
                        cmdSoda.CommandType = CommandType.StoredProcedure;
                        for (int i = 1; i <= valSoda.Length; i++)
                        {
                            cmdSoda.Parameters.Add("soda" + i, SqlDbType.Float).Value = valSoda[i - 1];
                        }

                        SqlCommand cmdAditivo = new SqlCommand(Properties.Settings.Default.spAditivo, con);
                        cmdAditivo.CommandType = CommandType.StoredProcedure;
                        for (int i = 1; i <= valAditivo.Length; i++)
                        {
                            cmdAditivo.Parameters.Add("aditivo" + i, SqlDbType.Float).Value = valAditivo[i - 1];
                        }

                        con.Open();

                        cmdAgua.ExecuteNonQuery();
                        cmdLubricante.ExecuteNonQuery();
                        cmdHorometro.ExecuteNonQuery();
                        cmdSoda.ExecuteNonQuery();
                        cmdAditivo.ExecuteNonQuery();

                        con.Close();

                    }
                }
                catch (Exception ex)
                {
                    Log.WriteLog(ex);
                }
            }
            t.Interval = nextInterval;
        }

        double[] getItemValues(string basename, int num)
        {
            double[] r = new double[num];

            for (int i = 1; i <= num; i++)
            {
                r[i - 1] = (double)opc[basename + i];
            }

            return r;
        }

        double nextInterval
        {
            get
            {
                DateTime now = DateTime.Now;
                DateTime next = new DateTime(now.Year, now.Month, now.Day, now.Hour, now.Minute, 0).AddMinutes(1);

                return (next-now).TotalMilliseconds;
            }
        }
    }
}
