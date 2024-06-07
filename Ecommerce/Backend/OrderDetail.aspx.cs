using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Ecommerce.Backend
{
    public partial class OrderDetail : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Ecommere"].ToString());
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt = new DataTable();
        SqlCommandBuilder SqlCommandBuilder;
        protected void Page_Load(object sender, EventArgs e)
        {
            cmd = new SqlCommand("select * from OrderProduct ", con);
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("_UpdateOrderStatus", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@status",DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@id",TextBox1.Text);
            con.Open();

            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                Response.Write("<script>alert('Order Status is Update') </script>");
                Response.AddHeader("refresh", "0");
            }
            else
            {
                Response.Write("");
            }
            con.Close();


            TextBox1.Text = "";
            TextBox1.Text = "";
         
            

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("../Accounts/Backend_SignUp.aspx");
            }
            else
            {

                GridViewRow selectedrow = GridView1.SelectedRow;

                int id = Convert.ToInt16(selectedrow.Cells[0].Text);
                string name = selectedrow.Cells[1].Text;
                string status = selectedrow.Cells[6].Text;




                TextBox1.Text = id.ToString();
                TextBox2.Text = name.ToString();
                TextBox3.Text = status.ToString();

            }
           
 
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the run time error "
            //Control 'GridView1' of type 'Grid View' must be placed inside a form tag with runat=server."
        }
        //private void ExportGridToExcel()
        //{
        //    Response.Clear();
        //    Response.Buffer = true;
        //    Response.ClearContent();
        //    Response.ClearHeaders();
        //    Response.Charset = "";
        //    string FileName = "Vithal" + DateTime.Now + ".xls";
        //    StringWriter strwritter = new StringWriter();
        //    HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    Response.ContentType = "application/vnd.ms-excel";
        //    Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        //    GridView1.GridLines = GridLines.Both;
        //    GridView1.HeaderStyle.Font.Bold = true;
        //    GridView1.RenderControl(htmltextwrtter);
        //    Response.Write(strwritter.ToString());
        //    Response.End();
        //}

        protected void Button3_Click(object sender, EventArgs e)
        {
            //ExportGridToExcel();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("SearchOrder",con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@key",TextBox4.Text);
           adapter = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);

            GridView1.DataSource = dataSet;
            GridView1.DataBind();
            con.Close();
        }
    }
}