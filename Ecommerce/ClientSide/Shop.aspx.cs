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
    public partial class Shop : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Ecommere"].ToString());
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt = new DataTable();
        SqlCommandBuilder builder;

        protected void Page_Load(object sender, EventArgs e)
        {
            cmd = new SqlCommand("select pid, Pname,PPrice,image2 from Product", con);
            cmd.CommandType = System.Data.CommandType.Text;
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);


            if (!IsPostBack)
            {
                bind();
                categorydropdown(); 
            }
        }



        void categorydropdown()
        {
            cmd = new SqlCommand("select * from category", con);
            cmd.CommandType  = CommandType.Text;
            adapter = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();    
            adapter.Fill(dataSet);

            DropDownList1.DataSource = dataSet;
            DropDownList1.DataTextField = "Cname";
            DropDownList1.DataValueField = "Cid";
            DropDownList1.DataBind();

            DropDownList1.Items.Insert(0, new ListItem("--Select category--"));

        }


        void bind()
        {
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmd = new SqlCommand("select * from subcategory where Cid= @Cid", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Cid",DropDownList1.SelectedValue.ToString()); 
            adapter = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();

            adapter.Fill(dataSet);

            DropDownList2.DataSource = dataSet;
            DropDownList2.DataTextField = "Sname";
            DropDownList2.DataValueField = "Sid";
          DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, new ListItem("--Select Subcategory--"));


                
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmd = new SqlCommand("select * from Product where Sid = @Sid", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Sid",DropDownList2.SelectedValue.ToString()); 
            adapter = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();

            adapter.Fill(dataSet);

            DropDownList3.DataSource = dataSet;
            DropDownList3.DataTextField = "Pname";
            DropDownList3.DataValueField = "pid";
            DropDownList3.DataBind();
            DropDownList3.Items.Insert(0, new ListItem("--Select Product--"));

        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmd = new SqlCommand("select * from Product where Pid = @pid", con);
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@Pid", DropDownList3.SelectedValue.ToString());
            adapter = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();

            adapter.Fill(dataSet);

           Repeater1.DataSource = dataSet;  
            Repeater1.DataBind();

        }

      
    }
}