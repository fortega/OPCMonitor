using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OPCMonitor
{
    public class Log
    {
        const string ProgName = "OPCMonitor";
        public static void WriteLog(Exception ex)
        {
            System.Diagnostics.EventLog.WriteEntry(ProgName, ex.Message, System.Diagnostics.EventLogEntryType.Error);
        }
    }
}
