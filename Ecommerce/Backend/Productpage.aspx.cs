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
    public partial class Productpage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Ecommere"].ToString());
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt = new DataTable();
        SqlCommandBuilder SqlCommandBuilder;

        public  int id { get; set; }
        public string name { get; set; }
        public string price { get; set; }
        public int qunity { get; set; }
        public string color { get; set; }    

        public  decimal totalamount { get; set; }   
        public string image1 { get; set; }
        public string image2 { get; set; }
        public string image3  { get; set; }


       


        protected void Page_Load(object sender, EventArgs e)
        {
            cmd = new SqlCommand("select * from Product", con);
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (Session["email"] == null)
            {
                Response.Redirect("../Accounts/Backend_SignUp.aspx");
            }
            else
            {
                GridViewRow selectedRow = GridView1.SelectedRow;

                id = Convert.ToInt16(selectedRow.Cells[0].Text);
                name = selectedRow.Cells[1].Text;
                price = selectedRow.Cells[2].Text;
                qunity = Convert.ToInt16(selectedRow.Cells[4].Text);
                color = selectedRow.Cells[3].Text;
                totalamount = Convert.ToDecimal(selectedRow.Cells[5].Text);

                image1 = selectedRow.Cells[7].Text;



                TextBox6.Text = id.ToString();
                TextBox1.Text = name;
                TextBox2.Text = price;
                TextBox3.Text = qunity.ToString();
                TextBox4.Text = color;

                TextBox5.Text = totalamount.ToString();



            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.EditIndex = e.NewPageIndex;
            bind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            cmd = new SqlCommand("UpdateProduct", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Pname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@pprice", TextBox2.Text);
            cmd.Parameters.AddWithValue("@PQuntity", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Pid", Convert.ToInt16(TextBox6.Text));
            con.Open(); 
            int i = cmd.ExecuteNonQuery();

            if (i >= 0)
            {
                Response.Write("<script>alert('Product is Update') </script>");
                Response.AddHeader("Refresh", "0");

            }
            else
            {
                Response.Write("<script>alert('Product is not Update') </script>");

            }
            con.Close();    

           

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("DeleteProduct", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Pid", Convert.ToInt16(TextBox6.Text));

            con.Open();

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Write("<script>alert('Product id Deleted') </script>");
                Response.AddHeader("Refresh", "0");
            }
            else
            {
                Response.Write("<script>alert('Product id not Deleted') </script>");
                Response.AddHeader("Refresh", "0");


            }
            con.Close();

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (TextBox7.Text == "")
            {
                bind();
            }
            else
            {

                cmd = new SqlCommand("_SearchProduct", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@key", TextBox7.Text);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet);
                GridView1.DataSource = dataSet;
                GridView1.DataBind();
            }

        }

        protected void TextBox7_TextChanged(object sender, EventArgs e)
        {

            cmd = new SqlCommand("_SearchProduct", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@key", TextBox7.Text);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);
            GridView1.DataSource = dataSet;
            GridView1.DataBind();
        }
    }
}