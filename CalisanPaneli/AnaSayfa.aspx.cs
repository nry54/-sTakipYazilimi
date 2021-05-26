using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IsTakipYazilimi_GYG.CalisanPaneli
{
    public partial class AnaSayfa : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            /* OWASP - Broken Access Control durumu için çözüm */
            if (HttpContext.Current.Session["kullanici_adi"] == null || HttpContext.Current.Session["yetki_id"].ToString() != "3")
                HttpContext.Current.Response.Redirect("~/Default.aspx");


            cnn.ConnectionString = "Data Source=DESKTOP-CGRD7J1\\NURAY;Initial Catalog=IsTakipDB;Integrated Security=True";
        }
    }
}