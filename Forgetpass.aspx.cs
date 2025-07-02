using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace emp_mng_system
{
    public partial class Forgetpass : Page
    {
        string connectionString = "Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string oldPassword = txtOldPassword.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                
                string checkUserQuery = "SELECT COUNT(*) FROM Employees WHERE Email = @Email AND Phone = @Phone AND Password = @OldPassword";
                using (SqlCommand cmd = new SqlCommand(checkUserQuery, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Phone", phone);
                    cmd.Parameters.AddWithValue("@OldPassword", oldPassword);

                    int userFound = (int)cmd.ExecuteScalar();

                    if (userFound == 1)
                    {
                        
                        string updatePasswordQuery = "UPDATE Employees SET Password = @NewPassword WHERE Email = @Email";
                        using (SqlCommand updateCmd = new SqlCommand(updatePasswordQuery, con))
                        {
                            updateCmd.Parameters.AddWithValue("@NewPassword", newPassword);
                            updateCmd.Parameters.AddWithValue("@Email", email);

                            int rowsAffected = updateCmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                lblMessage.ForeColor = System.Drawing.Color.Green;
                                lblMessage.Text = "✅ Password updated successfully!";
                            }
                            else
                            {
                                lblMessage.ForeColor = System.Drawing.Color.Red;
                                lblMessage.Text = "❌ Failed to update password.";
                            }
                        }
                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "❌ Invalid email, phone, or old password!";
                    }
                }
            }
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeLogin.aspx"); 
        }
    }
}
