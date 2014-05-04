using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MVC_nicadevs.Startup))]
namespace MVC_nicadevs
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
