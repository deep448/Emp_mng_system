using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace emp_mng_system
{
    public partial class LoginType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void btnEmp_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeLogin.aspx");
        }
    }
}