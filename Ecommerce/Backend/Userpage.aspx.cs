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
    public partial class Userpage : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Ecommere"].ToString());
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt = new DataTable();
        SqlCommandBuilder SqlCommandBuilder;
        protected void Page_Load(object sender, EventArgs e)
        {

            cmd = new SqlCommand("select * from client", con);
            cmd.CommandType = CommandType.Text;
            adapter = new SqlDataAdapter(cmd);  
            adapter.Fill(dt);

            if (!IsPostBack)
            {
                bind();
            }

        }


        void bind()
        {
            GridView1.DataSource = dt;  
            GridView1.DataBind();
        }
    }
}