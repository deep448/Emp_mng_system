using System;
using System.Data.SqlClient;

namespace emp_mng_system
{
    public partial class AddDepartment : System.Web.UI.Page
    {
         private string connectionString = "Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string deptName = TxtDeptName.Text.Trim();
            string deptCode = TxtDeptCode.Text.Trim();
            string deptHead = TxtDeptHead.Text.Trim();
            string contactNo = TxtContactNo.Text.Trim();
            string email = TxtEmail.Text.Trim();
            string location = TxtLocation.Text.Trim();
            string description = TxtDescription.Text.Trim();

            
            if (string.IsNullOrEmpty(deptName) || string.IsNullOrEmpty(deptCode) || string.IsNullOrEmpty(deptHead) ||
                string.IsNullOrEmpty(contactNo) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(location))
            {
                lblStatus.Text = "All required fields must be filled out.";
                lblStatus.ForeColor = System.Drawing.Color.Red;
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "INSERT INTO Department (DeptName, DeptCode, DeptHead, Phone, Email, Location, Description) " +
                                   "VALUES (@DeptName, @DeptCode, @DeptHead, @ContactNo, @Email, @Location, @Description)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                      
                        cmd.Parameters.AddWithValue("@DeptName", deptName);
                        cmd.Parameters.AddWithValue("@DeptCode", deptCode);
                        cmd.Parameters.AddWithValue("@DeptHead", deptHead);
                        cmd.Parameters.AddWithValue("@ContactNo", contactNo);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Location", location);
                        cmd.Parameters.AddWithValue("@Description", description);

                       
                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            lblStatus.Text = "Department added successfully!";
                            lblStatus.ForeColor = System.Drawing.Color.Green;
                            ClearForm();
                        }
                        else
                        {
                            lblStatus.Text = "An error occurred. Please try again.";
                            lblStatus.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblStatus.Text = "Error: " + ex.Message;
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
          
            ClearForm();
            lblStatus.Text = "";
        }

        private void ClearForm()
        {
            
            TxtDeptName.Text = "";
            TxtDeptCode.Text = "";
            TxtDeptHead.Text = "";
            TxtContactNo.Text = "";
            TxtEmail.Text = "";
            TxtLocation.Text = "";
            TxtDescription.Text = "";
        }

        protected void BtnView_Click(object sender, EventArgs e)
        {
            Response.Redirect("Department.aspx");
        }
    }
}
