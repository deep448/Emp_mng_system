using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace emp_mng_system
{
    public partial class EmployeeSignUp : System.Web.UI.Page
    {
        private string connStr = "Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Labelmssg.Text = "";
            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string email = EmptxtEmail.Text.Trim();
            string phone = EmptxtPhone.Text.Trim();
            string password = EmptxtPassword.Text.Trim();

            if (string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(phone) ||
                string.IsNullOrWhiteSpace(password))
            {
                Labelmssg.Text = "⚠️ All fields are required!";
                Labelmssg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();

                      string checkQuery = @"SELECT COUNT(*) FROM Employees 
                                          WHERE Email = @Email AND Phone = @Phone 
                                          AND (Password IS NULL OR Password = '')";

                    using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                    {
                        checkCmd.Parameters.AddWithValue("@Email", email);
                        checkCmd.Parameters.AddWithValue("@Phone", phone);

                        int matchCount = (int)checkCmd.ExecuteScalar();

                        if (matchCount > 0)
                        {
                           
                            string updateQuery = @"UPDATE Employees 
                                                   SET Password = @Password 
                                                   WHERE Email = @Email AND Phone = @Phone";

                            using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                            {
                                updateCmd.Parameters.AddWithValue("@Password", password);
                                updateCmd.Parameters.AddWithValue("@Email", email);
                                updateCmd.Parameters.AddWithValue("@Phone", phone);

                                int updated = updateCmd.ExecuteNonQuery();

                                if (updated > 0)
                                {
                                    Labelmssg.Text = "✅ User SignUP successfully!";
                                    Labelmssg.ForeColor = System.Drawing.Color.Green;
                                }
                                else
                                {
                                    Labelmssg.Text = "❌ Failed .";
                                    Labelmssg.ForeColor = System.Drawing.Color.Red;
                                }
                            }
                        }
                        else
                        {
                            Labelmssg.Text = "❌ Email and Phone not matched or password already set.";
                            Labelmssg.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Labelmssg.Text = "❌ Error: " + ex.Message;
                    Labelmssg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
