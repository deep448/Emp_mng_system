using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace emp_mng_system
{
    public partial class EmployeeLogin : Page
    {
        private string connectionString = "Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False";
        private const int MaxAttempts = 3;
        private const int LockoutMinutes = 5;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
        }

        protected void loginbt_Click(object sender, EventArgs e)
        {
            lblUsernameMsg.Text = "";
            lblPasswordMsg.Text = "";

            if (Session["LockoutTime"] != null)
            {
                DateTime lockoutTime = (DateTime)Session["LockoutTime"];
                if (DateTime.Now < lockoutTime)
                {
                    lblUsernameMsg.Text = $"Too many attempts. Try again at {lockoutTime.ToShortTimeString()}";
                    lblUsernameMsg.ForeColor = System.Drawing.Color.Red;
                    return;
                }
                else
                {
                    Session["LoginAttempts"] = 0;
                    Session["LockoutTime"] = null;
                }
            }

          
            if (string.IsNullOrWhiteSpace(EmptxtEmail.Text) || string.IsNullOrWhiteSpace(EmptxtPs.Text))
            {
                if (string.IsNullOrWhiteSpace(EmptxtEmail.Text))
                {
                    lblUsernameMsg.Text = "Please enter Email!";
                    lblUsernameMsg.ForeColor = System.Drawing.Color.Red;
                }

                if (string.IsNullOrWhiteSpace(EmptxtPs.Text))
                {
                    lblPasswordMsg.Text = "Please enter Password!";
                    lblPasswordMsg.ForeColor = System.Drawing.Color.Red;
                }
                return;
            }

          
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    string query = "SELECT EmployeeID, Email, password FROM Employees WHERE Email = @Email";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", EmptxtEmail.Text.Trim());

                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            string storedPassword = reader["password"].ToString();
                            string employeeID = reader["EmployeeID"].ToString();
                            string email = reader["Email"].ToString();

                            if (storedPassword == EmptxtPs.Text.Trim())
                            {
                                Session["LoginAttempts"] = 0;
                                Session["EmployeeID"] = employeeID;
                                Session["Email"] = email;

                                Response.Redirect("EmployeeDashboard.aspx");
                            }
                            else
                            {
                                HandleIncorrectPassword();
                            }
                        }
                        else
                        {
                            HandleInvalidEmail();
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblUsernameMsg.Text = "Error: " + ex.Message;
                    lblUsernameMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        private void HandleInvalidEmail()
        {
            int attempts = Session["LoginAttempts"] != null ? (int)Session["LoginAttempts"] : 0;
            attempts++;
            Session["LoginAttempts"] = attempts;

            if (attempts >= MaxAttempts)
            {
                Session["LockoutTime"] = DateTime.Now.AddMinutes(LockoutMinutes);
                lblUsernameMsg.Text = $"Too many attempts. Try again after {LockoutMinutes} minutes.";
            }
            else
            {
                lblUsernameMsg.Text = $"Incorrect Email! Attempts left: {MaxAttempts - attempts}";
            }

            lblUsernameMsg.ForeColor = System.Drawing.Color.Red;
            lblPasswordMsg.Text = "";
        }

        private void HandleIncorrectPassword()
        {
            int attempts = Session["LoginAttempts"] != null ? (int)Session["LoginAttempts"] : 0;
            attempts++;
            Session["LoginAttempts"] = attempts;

            if (attempts >= MaxAttempts)
            {
                Session["LockoutTime"] = DateTime.Now.AddMinutes(LockoutMinutes);
                lblPasswordMsg.Text = $"Too many attempts. Try again after {LockoutMinutes} minutes.";
            }
            else
            {
                lblPasswordMsg.Text = $"Incorrect password! Attempts left: {MaxAttempts - attempts}";
            }

            lblPasswordMsg.ForeColor = System.Drawing.Color.Red;
            lblUsernameMsg.Text = "";
        }

        protected void signtb_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeSignUp.aspx");
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginType.aspx");
        }
    }
}
