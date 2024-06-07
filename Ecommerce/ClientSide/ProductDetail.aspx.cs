using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce.ClientSide
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Ecommere"].ToString());
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt = new DataTable();
        SqlCommandBuilder builder;
        double id;
        protected void Page_Load(object sender, EventArgs e)
        {

             id = Convert.ToInt64(Request.QueryString["Pid"]);

            if (!IsPostBack)
            {
                displaydata();
                dropdown();
            }
        }



        void displaydata()
        {
            cmd = new SqlCommand("select pid, Pname,PPrice,Pquntity, image1,image2,image3,Pcolor,totalamount from Product where pid = @pid", con);
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Parameters.AddWithValue("@pid", id);
            con.Open();
            SqlDataReader sqlDataReader = cmd.ExecuteReader();

            if (sqlDataReader.Read())
            {
               Image1.ImageUrl = "/Models/"+sqlDataReader["image2"].ToString();
                //Image2.ImageUrl = "/Models/"+sqlDataReader["image1"].ToString();
                //Image3.ImageUrl = "/Models"+sqlDataReader["image3"].ToString();
                Label1.Text = sqlDataReader["Pid"].ToString();
                Label2.Text = sqlDataReader["Pname"].ToString();
                Label3.Text = sqlDataReader["Pcolor"].ToString();
                Label4.Text = sqlDataReader["totalamount"].ToString();
                Label5.Text = sqlDataReader["Pprice"].ToString();



                Product_name.Text = sqlDataReader["Pname"].ToString();





            }

            con.Close();

        }




        void dropdown()
        {
            cmd = new SqlCommand("select pQuntity  from product where Pid = @Pid ", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Pid", id);
            adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);

            DropDownList1.DataSource = dt;

            DropDownList1.DataTextField = "pQuntity";
           
            DropDownList1.DataBind();

         
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["ClientSideEmail"] != null)
            {
                cmd = new SqlCommand("_insertOrder", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Oname",Label2.Text);
                cmd.Parameters.AddWithValue("@Oprice",Label5.Text);
                cmd.Parameters.AddWithValue("@Ototal", Convert.ToDecimal(Label4.Text));
                cmd.Parameters.AddWithValue("@pid",Convert.ToInt16(Label1.Text));
                cmd.Parameters.AddWithValue("@Customername", Session["ClientSideEmail"].ToString());
                cmd.Parameters.AddWithValue("@Oquntity", DropDownList1.SelectedValue.ToString());

                con.Open();

              int i =    cmd.ExecuteNonQuery();



                if (i > 0)
                {
                    Response.Write("<script>alert('Your Order Successfully') </script>");
                }
                else
                {
                    Response.Write("");
                }

                con.Close();
            }
            else
            {
                Response.Redirect("../Accounts/Client_Login.aspx");
            }
        }
    }
}