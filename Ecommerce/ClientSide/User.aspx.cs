using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce.ClientSide
{
    public partial class Index : System.Web.UI.Page
    {


        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Ecommere"].ToString());
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt = new DataTable();
        SqlCommandBuilder builder;

        protected void Page_Load(object sender, EventArgs e)
        {
            cmd = new SqlCommand("select Pname,PPrice,image2 from Product", con);
            cmd.CommandType = System.Data.CommandType.Text; 
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);


            if (!IsPostBack)
            {
                bind();
            }

        }



        void bind()
        {
            Repeater1.DataSource = dt;  
            Repeater1.DataBind();   
        }



    }
}