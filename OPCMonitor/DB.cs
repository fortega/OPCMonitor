using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace OPCMonitor
{
    public class DB : IDisposable
    {
        private SqlConnection con;

        public DB()
        {
            con = new SqlConnection(Properties.Settings.Default.ConnectionString);
            con.Open();
        }

        public void Save(string procedure, string[] parameters, object[] values)
        {
                SqlCommand cmd = new SqlCommand(procedure, con);
                cmd.CommandType = CommandType.StoredProcedure;
                for (int i = 0; i < parameters.Length; i++)
                {
                    cmd.Parameters.Add(parameters[i], SqlDbType.Float).Value = values[i];
                }

                cmd.ExecuteNonQuery();
        }

        public void Dispose()
        {
            con.Close();
        }
    }
}
