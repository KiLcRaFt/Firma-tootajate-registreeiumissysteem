using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Firma_tootajate_registreeiumissysteem
{
    public partial class Contact : Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            await UpdateJsonUsingPhp();
        }
        public async Task UpdateJsonUsingPhp()
        {
            using (HttpClient client = new HttpClient())
            {
                try
                {
                    string filePath = Server.MapPath("~/convert_to_json.php");

                    HttpResponseMessage response = await client.GetAsync(filePath);

                    if (response.IsSuccessStatusCode)
                    {
                        // Успешное обновление
                        StatusLabel.Text = "JSON файл успешно обновлен.";
                        StatusLabel.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        // Ошибка при обновлении
                        StatusLabel.Text = "Ошибка при вызове PHP скрипта: " + response.ReasonPhrase;
                        StatusLabel.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    // Исключение, например, ошибка сети
                    StatusLabel.Text = "Ошибка: " + ex.Message;
                    StatusLabel.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}