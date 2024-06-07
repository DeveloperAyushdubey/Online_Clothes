using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce.Backend
{
    public partial class AdminProfile : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Ecommere"].ToString());
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt = new DataTable();
        SqlCommandBuilder SqlCommandBuilder;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack) 
            {
                bind();
            }

        }


        void bind()
        {
            cmd = new SqlCommand("select * from Admin where Aemail = @email", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@email", Session["email"].ToString());
            con.Open();
            SqlDataReader sqlDataReader = cmd.ExecuteReader();

            if (sqlDataReader.Read())
            {
                id.Text = sqlDataReader["AID"].ToString();
                name.Text = sqlDataReader["AName"].ToString();
                email.Text = sqlDataReader["Aemail"].ToString();
                pass.Text = sqlDataReader["Apass"].ToString();


            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            cmd = new SqlCommand("_UpdateAdminProfile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", name.Text);
            cmd.Parameters.AddWithValue("@email",email.Text);
            cmd.Parameters.AddWithValue("@pass",pass.Text);
         
            con.Open();
          int id =   cmd.ExecuteNonQuery();
            if (id > 0)
            
            {

                Response.Write("<script>alert('Update Profile') </script>");
            }
            
            con.Close();

        }
    }
}