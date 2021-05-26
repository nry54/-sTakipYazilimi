using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace IsTakipYazilimi_GYG.IsverenPaneli
{
    public partial class GorevListesi : System.Web.UI.Page
    {

        SqlConnection cnn = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            /* OWASP - Broken Access Control durumu için çözüm */
            if (HttpContext.Current.Session["kullanici_adi"] == null || HttpContext.Current.Session["yetki_id"].ToString() != "2")
                HttpContext.Current.Response.Redirect("~/Default.aspx");

            cnn.ConnectionString = "Data Source=DESKTOP-CGRD7J1\\NURAY;Initial Catalog=IsTakipDB;Integrated Security=True";
        }

        protected void btn_ekle_Click(object sender, EventArgs e)
        {
            cnn.Open();
            SqlParameter prm1 = new SqlParameter("@P1", drp_personel.SelectedItem.Value);
            SqlParameter prm2 = new SqlParameter("@P2", txt_gorev.Text);
            SqlParameter prm3 = new SqlParameter("@P3", txt_baslangic.Text);
            SqlParameter prm4 = new SqlParameter("@P4", txt_bitis.Text);
            SqlParameter prm5 = new SqlParameter("@P5", txt_bitis0.Text);

            string sql = "";
            sql = "insert into Gorev(personel_id,gorev,baslangic,bitis,hedef) Values (@P1,@P2,@P3,@P4,@P5);";
            SqlCommand komut = new SqlCommand(sql, cnn);

            komut.Parameters.Add(prm1);
            komut.Parameters.Add(prm2);
            komut.Parameters.Add(prm3);
            komut.Parameters.Add(prm4);
            komut.Parameters.Add(prm5);
          

            komut.ExecuteNonQuery();
            cnn.Close();

            MessageBox.Show("Görev kayıt edildi");
            Response.Redirect("~/IsverenPaneli/GorevListesi.aspx");
        }
    }
}