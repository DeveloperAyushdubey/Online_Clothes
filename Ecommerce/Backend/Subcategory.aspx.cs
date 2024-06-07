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
    public partial class Subcategory : System.Web.UI.Page
    {
     
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Ecommere"].ToString());
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt = new DataTable();
        SqlCommandBuilder SqlCommandBuilder;
        protected void Page_Load(object sender, EventArgs e)
        {

            cmd = new SqlCommand("select * from SubCategory", con);
            cmd.CommandType = CommandType.Text;
            adapter = new SqlDataAdapter(cmd);  
            adapter.Fill(dt);   
            SqlCommandBuilder = new SqlCommandBuilder(adapter);    
            if (!IsPostBack)
            {
                CategoryDropdown();
                bind();

            }  

        }



        void bind()
        {
            GridView1.DataSource = dt;  
            GridView1.DataBind();   
        }


        void CategoryDropdown()
        {
          if(DropDownList1.SelectedValue == "--Select Category--")
            {
             
                Label1.Visible = true;

            }
            else
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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../Accounts/Backend_SignUp.aspx");
            }
            else
            {

                cmd = new SqlCommand("select sname,cid from  SubCategory where sname=@name and cid = @cid", con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@cid", DropDownList1.SelectedValue.ToString());
                con.Open();
                SqlDataReader sqlDataReader = cmd.ExecuteReader();

                if (sqlDataReader.HasRows)
                {
                    Response.Write("<script>alert('Data is Already Exits') </script>");
                }
                else
                {
                    con.Close();



                    cmd = new SqlCommand("_insertSubcategory", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("Cid", DropDownList1.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("name", TextBox1.Text);
                    if (CheckBox1.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("stock", "In Stock");

                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("stock", "Out Of Stock");

                    }

                    con.Open();

                    cmd.ExecuteNonQuery();

                    Response.Write("<script>alert('Subcategory Insert') </script>");
                    Response.AddHeader("refresh", "1");


                    con.Close();
                    TextBox1.Text = "";
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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataRow[] dr = dt.Select("Sid=" + Convert.ToInt16(GridView1.Rows[e.RowIndex].Cells[0].Text));
            dr[0].Delete();
            adapter.Update(dt);
            Response.Write("<script>alert('Subcategory is Deleted') </script>");
            bind();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../Accounts/Backend_SignUp.aspx");
            }
            else
            {

                DataRow[] dr = dt.Select("Sid=" + Convert.ToInt16(GridView1.Rows[e.RowIndex].Cells[0].Text));
                dr[0][1] = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
                dr[0][2] = ((CheckBox)GridView1.Rows[e.RowIndex].FindControl("CheckBox2")).Checked ? "In Stock" : "Out Of Stock";
                adapter.Update(dt);
                GridView1.EditIndex = -1;
                bind();
                Response.Write("<script>alert('Subcategory Update') </script>");
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            GridView1.EditIndex = -1;
            bind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.EditIndex = e.NewPageIndex;
            bind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("_searchSubcategory",con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@key",TextBox2.Text);
           adapter = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);  

            GridView1.DataSource = dataSet; 
            GridView1.DataBind();   
            
        }
    }
        }