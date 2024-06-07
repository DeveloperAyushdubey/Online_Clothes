using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace Ecommerce.Backend
{
    public partial class Index : System.Web.UI.Page
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
                categegoryStockYaInstock();
                SubcategoryStockYaInstock();
                OrderDetail();
            }
        }

        void categegoryStockYaInstock()
        {
             con.Open();
            string Instock = "select count(cstock) from category where cstock = 'In stock'";
            cmd = new SqlCommand(Instock, con);
            int count1 = (int)cmd.ExecuteScalar();
           Label1.Text = count1.ToString();


            string OutStock = "select count(cstock) from category where cstock = 'Out of stock'";
            cmd = new SqlCommand(OutStock, con);    
            int count2 = (int)cmd.ExecuteScalar();
           Label2.Text = count2.ToString();
            con.Close();

        }
        void SubcategoryStockYaInstock()
        {
            con.Open();
            string Instock = "select count(Sstock) from Subcategory where Sstock = 'In stock'";
            cmd = new SqlCommand(Instock, con);
            int count3 = (int)cmd.ExecuteScalar();
            Label3.Text = count3.ToString();


            string OutStock = "select count(Sstock) from Subcategory where Sstock = 'Out of stock'";
            cmd = new SqlCommand(OutStock, con);
            int count4 = (int)cmd.ExecuteScalar();
           Label4.Text = count4.ToString();
            con.Close();

        }



        void OrderDetail()
        {
            con.Open();
            cmd = new SqlCommand("select count(status) from OrderProduct where Status ='Order'", con);
            cmd.CommandType = CommandType.Text;
            int order = (int)cmd.ExecuteScalar();
            Label5.Text = order.ToString();


            cmd = new SqlCommand("select count(status) from OrderProduct where Status ='Pending'", con);
            cmd.CommandType = CommandType.Text;
            int pending = (int)cmd.ExecuteScalar();
            Label6.Text = pending.ToString();


            cmd = new SqlCommand("select count(status) from OrderProduct where Status ='Delivered'", con);
            cmd.CommandType = CommandType.Text;
            int deliverd = (int)cmd.ExecuteScalar();
            Label7.Text = deliverd.ToString();

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Category.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Subcategory.aspx");

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderDetail.aspx");

        }
    }
}
