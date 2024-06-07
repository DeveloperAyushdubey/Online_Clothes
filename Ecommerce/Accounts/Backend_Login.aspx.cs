using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce.Accounts
{
    public partial class Backend_Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Ecommere"].ToString());
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt = new DataTable();
        SqlCommandBuilder builder;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("select * from admin where Aemail = @email", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@email", email.Text);
            con.Open();
            SqlDataReader sqlDataReader1 = cmd.ExecuteReader();
            if (sqlDataReader1.Read())
            {
                con.Close();



                cmd = new SqlCommand("_LoginAdmin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@pass", pass.Text);

                con.Open();
                SqlDataReader sqlDataReader = cmd.ExecuteReader();

                if (sqlDataReader.Read())
                {

                    Session["email"] = email.Text;  
                    Response.Redirect("../Backend/Index.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Please Create a Account') </script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Please Check Your Email') </script>");
            }
            con.Close();
        }
    }
}