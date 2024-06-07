using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace Ecommerce.Accounts
{
    public partial class Sinup : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Ecommere"].ToString());
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("_insertAdmin", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", name.Text);
            cmd.Parameters.AddWithValue("@email", Email.Text);
            cmd.Parameters.AddWithValue("@pass", Password.Text);
            con.Open(); 

          int i =   cmd.ExecuteNonQuery();
            if (1 >= 1)
            {
                Session["email"] = Email.Text;   
            }

            Response.Redirect("../Backend/Index.aspx");
            con.Close();

        }
    }
}