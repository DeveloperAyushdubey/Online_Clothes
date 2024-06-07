using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce.ClientSide
{
    public partial class YourOrder : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Ecommere"].ToString());
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt = new DataTable();
        SqlCommandBuilder SqlCommandBuilder;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ClientSideEmail"] != null)
            {
               
            }


            if (!IsPostBack)
            {
                bind();
            }
          

        }


        void bind()
        {
            cmd = new SqlCommand("_ViewOrderProductCustomer", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", Session["ClientSideEmail"].ToString());
            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
               
                name.Text = reader["Oname"].ToString();
                quntity.Text = reader["oquntity"].ToString();
                price.Text = reader["Oprice"].ToString();
                TotalAmount.Text = reader["Ototal"].ToString();
                Status.Text = reader["Status"].ToString();
                con.Close();
            }

            con.Close();
        }


    }
}