using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce.Accounts
{
    public partial class ForgetPass : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Ecommere"].ToString());
        SqlCommand cmd; 
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("_ForgetPassadmin", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email",email.Text);
            con.Open(); 
            SqlDataReader reader = cmd.ExecuteReader();

            if(reader.Read())
            {
                //Response.Write("<script>alert('Your Password : '"+sqlDataReader["Apass"].ToString()+"')</script>");
                Response.Write("<script>alert('Your Password: " + reader["Apass"].ToString() + "');</script>");


            }

            con.Close();    

        }
    }
}