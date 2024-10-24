using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Firma_tootajate_registreeiumissysteem.Startup))]
namespace Firma_tootajate_registreeiumissysteem
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
