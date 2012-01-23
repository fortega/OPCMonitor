using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OPCHelper
{
    public class OPCECCUSA : OPCHelper.OPCConnection
    {
        struct TagHelper
        {
            public int Num { get; set; }
            public string Base { get; set; }

            public string[] Tags
            {
                get
                {
                    string[] r = new string[Num];

                    for (int i = 0; i < Num; i++)
                    {
                        r[i] = string.Concat(Base, i + 1);
                    }

                    return r;
                }
            }
        }

        static TagHelper[] tags = new TagHelper[]{
            new TagHelper() { Base = "agua", Num = 7 },
            new TagHelper() { Base = "lubric", Num = 7 },
            new TagHelper() { Base = "horom", Num = 7 },
            new TagHelper() { Base = "soda", Num = 6 },
            new TagHelper() { Base = "aditiv", Num = 6 }
        };

        public OPCECCUSA(string ProgID, string itemBase)
            : base(ProgID)
        {
            foreach (TagHelper t in tags)
            {
                foreach (string n in t.Tags)
                {
                    string tagName = string.Concat(itemBase, ".", n);
                    AddItem(n, tagName);
                }
            }
        }
        private object[] getData(int n)
        {
            TagHelper t = tags[n];
            object[] r = new object[t.Num];
            string[] tagNames = t.Tags;

            for(int i = 0; i < t.Num; i++)
            {
                r[i] = this[tagNames[i]];
            }
            return r;
        }

        public object[] Agua { get { return getData(0); }}
        public object[] Lubricante { get { return getData(1); } }
        public object[] Horometro { get { return getData(2); } }
        public object[] Soda { get { return getData(3); } }
        public object[] Aditivo { get { return getData(4); } }
    }
}
