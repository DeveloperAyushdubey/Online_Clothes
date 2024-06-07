using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecommerce.Backend
{
    public partial class Ecommerce : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                Literal1.Text = Session["email"].ToString();    
                Label1.Text = Session["email"].ToString();
            }
            else
            {
                //Response.Redirect("../Accounts/Backend_Login.aspx");
            }

        }
    }
}