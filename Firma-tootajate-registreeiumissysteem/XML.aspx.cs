using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Firma_tootajate_registreeiumissysteem
{
    public partial class Xml : Page
    {
        public string XmlContent { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string xmlFilePath = Server.MapPath("~/Kompaania.xml");

            if (File.Exists(xmlFilePath))
            {
                try
                {
                    XDocument xmlDoc = XDocument.Load(xmlFilePath);
                    XmlContent = xmlDoc.ToString();
                }
                catch (Exception ex)
                {
                    XmlContent = "Viga XML-faili laadimisel: " + ex.Message;
                }
            }
            else
            {
                XmlContent = "XML-fail ei leinud.";
            }
        }
    }
}