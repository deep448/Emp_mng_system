using System;
using System.Data.SqlClient;

namespace emp_mg_system
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        string connectionString = "Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
           if (!IsPostBack)
            {
                lblUsernameMsg.Text = "";
                lblPasswordMsg.Text = "";
            }
        }

        protected void loginbt_Click(object sender, EventArgs e)
        {
            string username = AdmintxtUn.Text.Trim();
            string password = AdmintxtPs.Text.Trim();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();


                string checkUsernameQuery = "SELECT COUNT(*) FROM adminLogin WHERE Username = @username";
                using (SqlCommand cmd = new SqlCommand(checkUsernameQuery, con))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    int userExists = (int)cmd.ExecuteScalar();

                    if (userExists == 0)
                    {
                        lblUsernameMsg.Text = "❌ Invalid username! Please try again.";
                        lblPasswordMsg.Text = ""; 
                        return;
                    }
                }


                string checkPasswordQuery = "SELECT COUNT(*) FROM adminLogin WHERE Username = @username AND Password = @password";
                using (SqlCommand cmd = new SqlCommand(checkPasswordQuery, con))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password);
                    int isValid = (int)cmd.ExecuteScalar();

                    if (isValid > 0)
                    {
                        Session["Username"] = username;
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        lblPasswordMsg.Text = "🔐 Incorrect password! Please try again.";
                        lblUsernameMsg.Text = ""; 
                    }
                }
            }
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginType.aspx");
        }
    }
}
