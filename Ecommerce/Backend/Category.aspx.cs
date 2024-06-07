using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;

namespace Ecommerce.Backend
{
    public partial class Category : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Ecommere"].ToString());
        SqlCommand cmd;
        SqlDataAdapter adapter; 
        DataTable dt =  new DataTable();
        SqlCommandBuilder SqlCommandBuilder;
        protected void Page_Load(object sender, EventArgs e)
        {

           

            cmd = new SqlCommand("select * from category", con);
            cmd.CommandType = CommandType.Text;
            adapter = new SqlDataAdapter(cmd);  
            adapter.Fill(dt);
            SqlCommandBuilder  = new SqlCommandBuilder(adapter);
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



        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../Accounts/Backend_SignUp.aspx");
            }
            else
            {

                cmd = new SqlCommand("select Cname from category where Cname=@Cname", con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@cname", TextBox1.Text);
                con.Open();
                SqlDataReader sqlDataReader = cmd.ExecuteReader();


                if (sqlDataReader.HasRows)
                {
                    Response.Write("<script>alert('data is duplicate') </script>");
                }
                else
                {
                    con.Close();


                    cmd = new SqlCommand("_insertcategory", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@name", TextBox1.Text);

                    if (CheckBox1.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@stock", "In Stock");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@stock", "Out of Stock");

                    }

                    con.Open();




                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Submit data') </script>");
                    Response.AddHeader("Refresh", "1");
                    con.Close();
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../Accounts/Backend_SignUp.aspx");
            }
            else
            {
                GridView1.EditIndex = e.NewEditIndex;
                bind();
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            bind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DataRow[] dr = dt.Select("Cid=" + Convert.ToInt16(GridView1.Rows[e.RowIndex].Cells[0].Text));
            dr[0][1] = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
        
            dr[0][2] = ((CheckBox)GridView1.Rows[e.RowIndex].FindControl("CheckBox2")).Checked ? "In Stock": "Out of Stock";
            adapter.Update(dt);
            Response.Write("<script>alert('Category Update') </script>");
            GridView1.EditIndex = -1;
            bind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../Accounts/Backend_SignUp.aspx");
            }
            else
            {
                DataRow[] dr = dt.Select("Cid=" + Convert.ToInt16(GridView1.Rows[e.RowIndex].Cells[0].Text));
                dr[0].Delete();
                adapter.Update(dt);
                bind();
                Response.Write("<script>alert('Delete Category') </script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.EditIndex = e.NewPageIndex;
            bind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("_searchCategory",con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@key", TextBox2.Text);
            adapter = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);
            GridView1.DataSource = dataSet;
            GridView1.DataBind();


        }
    }
}