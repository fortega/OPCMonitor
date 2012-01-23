using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OPCAutomation;

namespace OPCHelper
{
    public class OPCConnection : IDisposable
    {
        const string GroupName = "MyGroup", ClientName = "OPCMonitor";
        private OPCServer server;
        private OPCGroup group;
        private Dictionary<string, OPCItem> items = new Dictionary<string, OPCItem>();

        public OPCConnection(string ProgID)
        {
            server = new OPCServer();
            server.ClientName = ClientName;
            server.Connect(ProgID, null);

            group = server.OPCGroups.Add(GroupName);
            group.IsSubscribed = true;
        }

        public void AddItem(string queryName, string tagName)
        {
            items.Add(queryName,group.OPCItems.AddItem(tagName, items.Count));
        }

        public object this[string i]
        {
            get { return items[i].Value; }
        }

        public void Dispose()
        {
            if (server != null)
                server.Disconnect();
        }
    }
}
