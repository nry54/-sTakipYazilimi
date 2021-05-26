using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Windows.Forms;

namespace IsTakipYazilimi_GYG
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        void Application_End(object sender, EventArgs e)
        {
           
        }

        void Application_Error(object sender, EventArgs e)
        {
            
        }

        void Session_OnStart(object sender, EventArgs e)
        {
            
        }

        void Session_End(object sender, EventArgs e)
        {
        }
    }
}