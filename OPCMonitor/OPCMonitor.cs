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
        private OPCECCUSA opc;
        private Timer t;
        private bool first = true;

        #region ServiceBase
        public OPCMonitor()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            opc = new OPCECCUSA(Properties.Settings.Default.ProgID, Properties.Settings.Default.ItemBase);
            t = new Timer();
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
                    object[] agua = opc.Agua,
                        lubricante = opc.Lubricante,
                        horometro = opc.Horometro,
                        soda = opc.Soda,
                        aditivo = opc.Aditivo;
                    using (DB db = new DB())
                    {
                        db.Save(Properties.Settings.Default.spAgua,
                            new string[] { "agua1", "agua2", "agua3", "agua4", "agua5", "agua6", "agua7" },
                            agua);

                        db.Save(Properties.Settings.Default.spLubricante,
                            new string[] { "lubricante1", "lubricante2", "lubricante3", "lubricante4", "lubricante5", "lubricante6", "lubricante7" },
                            lubricante);

                        db.Save(Properties.Settings.Default.spHorometro,
                            new string[] { "horometro1", "horometro2", "horometro3", "horometro4", "horometro5", "horometro6", "horometro7" },
                            horometro);

                        db.Save(Properties.Settings.Default.spSoda,
                            new string[] { "soda1", "soda2", "soda3", "soda4", "soda5", "soda6" },
                            soda);

                        db.Save(Properties.Settings.Default.spAditivo,
                            new string[] { "aditivo1", "aditivo2", "aditivo3", "aditivo4", "aditivo5", "aditivo6" },
                            aditivo);
                    }
                }
                catch (Exception ex)
                {
                    Log.WriteLog(ex);
                }
            }
            t.Interval = nextInterval;
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
