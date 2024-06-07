using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce.ClientSide
{
    public partial class ClientSide : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["ClientSideEmail"] != null)
            {
                LinkButton1.Visible = true;
               LinkButton3.Visible = true;  
             }
            else
            {
              LinkButton4.Visible = true;
            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("YourOrder.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Accounts/Client_Login.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Accounts/ClientSign_UP.aspx");
        }

      
    }
}