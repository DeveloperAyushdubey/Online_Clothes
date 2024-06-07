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
    public partial class ClientSign_UP : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Ecommere"].ToString());
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt = new DataTable();
        SqlCommandBuilder builder;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            cmd = new SqlCommand("_CheckClient", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email",email.Text);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
            DataTable dataTable = new DataTable();  
            sqlDataAdapter.Fill(dataTable);

            if(dataTable.Rows.Count > 0 )
            {
                Response.Write("<script>alert('Your Account is Already') </script>");

            }
            else
            {

                cmd = new SqlCommand("_insertClient", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Uemail", email.Text);   
                cmd.Parameters.AddWithValue("@Uname", name.Text);
                cmd.Parameters.AddWithValue("@Umob", Mobile.Text);
                cmd.Parameters.AddWithValue("@Uadd", addressh.Text);
                cmd.Parameters.AddWithValue("@Upass", pass.Text);
                cmd.Parameters.AddWithValue("@Uconpass", ConPass.Text);

                sqlDataAdapter = new SqlDataAdapter(cmd);   
                DataTable dataTable2 = new DataTable(); 
                sqlDataAdapter.Fill(dataTable2);

                if (dataTable2.Rows.Count == 0)
                {

                    Session["ClientSideEmail"] = email.Text;
                    Response.Redirect("../ClientSide/Index.aspx");

                }



            }
          

            }

        }
    }