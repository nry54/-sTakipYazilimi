using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace IsTakipYazilimi_GYG
{
    public partial class _Default : Page
    {
        SqlConnection cnn = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            cnn.ConnectionString = "Data Source=DESKTOP-CGRD7J1\\NURAY;Initial Catalog=IsTakipDB;Integrated Security=True";

            Response.Expires = 0;
            Response.Cache.SetNoStore();
            Response.AppendHeader("Pragma", "no-cache");
        }

        Model1Container db = new Model1Container();
        
        protected void btn_giris_Click(object sender, EventArgs e)
        {
            try
            {
                cnn.Open();
                SqlParameter prm1 = new SqlParameter("@P1", txt_k_ad.Text);
                SqlParameter prm2 = new SqlParameter("@P2", txt_parola.Text);
                string sql = "";
                sql = "select * FROM Kullanici WHERE kullanici_adi=@P1 and parola=@P2";
                SqlCommand cmd = new SqlCommand(sql, cnn);

                cmd.Parameters.Add(prm1);
                cmd.Parameters.Add(prm2);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                if (dt.Rows.Count == 1)
                {
                    if (dt.Rows[0][4].ToString() == "2")
                    {
                        //İsveren girisidir

                        Session.Add("kullanici_adi", txt_k_ad.Text);
                        Session.Add("ad_soyad", dt.Rows[0][3].ToString());
                        Session.Add("yetki_id", 2);

                        Response.Redirect("~/IsverenPaneli/Anasayfa.aspx",false);
                    }
                    else if (dt.Rows[0][4].ToString() == "3")
                    {
                        //İsveren girisidir
                        Session.Add("kullanici_adi", txt_k_ad.Text);
                        Session.Add("ad_soyad", dt.Rows[0][3].ToString());
                        Session.Add("yetki_id", 3);
                        Response.Redirect("~/CalisanPaneli/Anasayfa.aspx",false);
                    }
                }
                else
                {
                    Label3.Visible = true;
                    Label3.Text = "Veritabanında böyle bir kullanıcı bulunamadı";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}