using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce.Backend
{
    public partial class Product : System.Web.UI.Page
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
                categorydropdwon();
            }
        }



        void categorydropdwon()
        {
            cmd = new SqlCommand("select * from category", con);
            cmd.CommandType = CommandType.Text;
            adapter = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);

            DropDownList1.DataSource = dataSet;
            DropDownList1.DataTextField = "Cname";
            DropDownList1.DataValueField = "Cid";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("--Select Category--"));
        }




        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../Accounts/Backend_SignUp.aspx");
            }
            else
            {
                cmd = new SqlCommand("InsertProduct", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Sid", DropDownList2.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Pname", name.Text);
                cmd.Parameters.AddWithValue("@pPrice", Price.Text);
                cmd.Parameters.AddWithValue("@PQuntity", Quntity.Text);

                cmd.Parameters.AddWithValue("@PColor", Color.Text);

                string path = Guid.NewGuid().ToString() + Image1.FileName;
                Image1.SaveAs(Request.PhysicalApplicationPath + "/Models/" + path.ToString());
                cmd.Parameters.AddWithValue("@image1", path);



                string path2 = Guid.NewGuid().ToString() + Image2.FileName;
                Image2.SaveAs(Request.PhysicalApplicationPath + "/Models/" + path2.ToString());
                cmd.Parameters.AddWithValue("@image2", path2);

                string path3 = Guid.NewGuid().ToString() + Image3.FileName;
                Image3.SaveAs(Request.PhysicalApplicationPath + "/Models/" + path3.ToString());
                cmd.Parameters.AddWithValue("@image3", path3);


                con.Open();

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Product insert') </script>");
                con.Close();

                name.Text = "";
                Price.Text = "";
                Color.Text = "";
                Quntity.Text = "";
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmd = new SqlCommand("select * from subcategory where Cid = @id", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@id", DropDownList1.SelectedValue.ToString());
            adapter = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();

            adapter.Fill(dataSet);
            DropDownList2.DataSource = dataSet;
            DropDownList2.DataTextField = "Sname";
            DropDownList2.DataValueField = "Sid";
            DropDownList2.DataBind();

            DropDownList2.Items.Insert(0, new ListItem("--Select Subcategory--"));

        }
    }
}