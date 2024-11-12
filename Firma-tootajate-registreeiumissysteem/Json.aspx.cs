using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Firma_tootajate_registreeiumissysteem
{
    public partial class About : Page
    {
        public string JsonContent { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadJsonContent();
            }
        }

        private void LoadJsonContent()
        {
            // Путь к JSON файлу
            string filePath = Server.MapPath("~/Kompaania.json");

            // Чтение JSON файла как строки
            if (File.Exists(filePath))
            {
                JsonContent = File.ReadAllText(filePath);
            }
            else
            {
                JsonContent = "JSON файл не найден.";
            }
        }
    }
}