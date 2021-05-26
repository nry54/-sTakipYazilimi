using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace IsTakipYazilimi_GYG.CalisanPaneli
{
    public partial class Gorevlerim : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            /* OWASP - Broken Access Control durumu için çözüm */
            if (HttpContext.Current.Session["kullanici_adi"] == null || HttpContext.Current.Session["yetki_id"].ToString() != "3")
                HttpContext.Current.Response.Redirect("~/Default.aspx");

            cnn.ConnectionString = "Data Source=DESKTOP-CGRD7J1\\NURAY;Initial Catalog=IsTakipDB;Integrated Security=True";

            lbl_session.Text = HttpContext.Current.Session["kullanici_adi"].ToString();

            SqlDataSource1.SelectParameters["session_deger"].DefaultValue = HttpContext.Current.Session["kullanici_adi"].ToString();
        }

        protected void grd_gorevlerim_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int sirano;
            SqlDataReader data;
            sirano = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Tamamlandı")
            {
                GridViewRow satir = grd_gorevlerim.Rows[sirano];
                cnn.Open();
                string gorev_id = satir.Cells[0].Text;
                MessageBox.Show(satir.Cells[0].Text);
                SqlCommand sqlComm = new SqlCommand();
                sqlComm = cnn.CreateCommand();
                sqlComm.CommandText = @"UPDATE Gorev SET tamamlanma_durumu=1 WHERE Id='" + gorev_id + "'";
                sqlComm.Parameters.Add("@Id", SqlDbType.Int);
                sqlComm.Parameters["@Id"].Value = Convert.ToInt32(gorev_id);
                sqlComm.ExecuteNonQuery();
                cnn.Close();

                Response.Redirect("~/CalisanPaneli/Gorevlerim.aspx");
            }
        }
    }
}