using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(NicDevs_MasterPage.Startup))]
namespace NicDevs_MasterPage
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
