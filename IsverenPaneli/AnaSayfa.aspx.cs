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
    public partial class AnaSayfa : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            /* OWASP - Broken Access Control durumu için çözüm */
            if (HttpContext.Current.Session["kullanici_adi"] == null || HttpContext.Current.Session["yetki_id"].ToString() != "2")
                HttpContext.Current.Response.Redirect("~/Default.aspx");

           
            cnn.ConnectionString = "Data Source=DESKTOP-CGRD7J1\\NURAY;Initial Catalog=IsTakipDB;Integrated Security=True";
        }
        protected void btn_kaydet_Click(object sender, EventArgs e)
        {
            SHA1 sha = new SHA1CryptoServiceProvider();
            cnn.Open();
            SqlParameter prm1 = new SqlParameter("@P1", txt_ad_soyad.Text);
            SqlParameter prm2 = new SqlParameter("@P2", txt_kullanici_adi.Text);
            SqlParameter prm3 = new SqlParameter("@P3", Convert.ToBase64String(sha.ComputeHash(Encoding.UTF8.GetBytes(txt_parola.Text))));
            SqlParameter prm4 = new SqlParameter("@P4", drp_yetki.SelectedValue);

            string sql = "";
            sql = "insert into Kullanici(kullanici_adi,parola,ad_soyad,yetki_id) Values (@P2,@P3,@P1,@P4);";
            SqlCommand komut = new SqlCommand(sql, cnn);


            komut.Parameters.Add(prm1);
            komut.Parameters.Add(prm2);
            komut.Parameters.Add(prm3);
            komut.Parameters.Add(prm4);

            komut.ExecuteNonQuery();
            cnn.Close();

            MessageBox.Show("Kullanıcı kayıt edildi");
            Response.Redirect("~/IsverenPaneli/Anasayfa.aspx");
        }

        protected void grd_kullanicilar_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int sirano;
            SqlDataReader data;
            sirano = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Update")
            {
                GridViewRow satir = grd_kullanicilar.Rows[sirano];
                cnn.Open();
                string index = satir.Cells[0].Text;
                SqlCommand sorgu = new SqlCommand();
                sorgu.Connection = cnn;
                sorgu.CommandText = "SELECT * FROM Kullanici where Id='" + satir.Cells[0].Text + "'";

                data = sorgu.ExecuteReader();
                while (data.Read())
                {

                }

                cnn.Close();
            }
        }
    }
}