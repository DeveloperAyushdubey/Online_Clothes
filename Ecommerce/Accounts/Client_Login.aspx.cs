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
    public partial class Client_Login : System.Web.UI.Page
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

            cmd = new SqlCommand("SELECT * FROM Client WHERE Uemail = @email ", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@email", email.Text);
            con.Open();

            SqlDataReader sqlDataReader1 = cmd.ExecuteReader();
            if (sqlDataReader1.Read())
            {
                con.Close();

                cmd = new SqlCommand("_loginClient", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@pass", pass.Text);
                con.Open();
                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                if (sqlDataReader.Read())
                {
                    Session["ClientSideEmail"] = email.Text;
                    Response.Redirect("../ClientSide/Index.aspx");
                }
                else
                {

                }
                con.Close();

            }
            else
            {

                Response.Write("<script>alert('Please Check Your Email') </script>");
            }
        }
    }
}