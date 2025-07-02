using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace emp_mng_system
{
    public partial class Addemployee : System.Web.UI.Page
    {
        // Updated connection string
        string connectionString = "Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False";
        SqlConnection con = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDepartmentDropdown();
            }
        }

        private void BindDepartmentDropdown()
        {
            try
            {
                // Use the hardcoded connection string
                con.ConnectionString = connectionString;
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT DeptID, DeptName FROM Department", con);
                SqlDataReader dr = cmd.ExecuteReader();

                DropDownDepartment.DataSource = dr;
                DropDownDepartment.DataTextField = "DeptName";
                DropDownDepartment.DataValueField = "DeptID";
                DropDownDepartment.DataBind();

                DropDownDepartment.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select Department", ""));
            }
            catch (Exception ex)
            {
                lblStatus1.Text = "Error loading departments: " + ex.Message;
            }
            finally
            {
                con.Close();
            }
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (DropDownDepartment.SelectedIndex == 0 || string.IsNullOrEmpty(DropDownDepartment.SelectedValue))
                {
                    lblStatus1.Text = "Please select a department.";
                    return; 
                }

                try
                {
                    DateTime doj;
                    if (!DateTime.TryParse(TxtDOJ.Text, out doj))
                    {
                        lblStatus1.Text = "Invalid Date of Joining format.";
                        return;
                    }

                    byte[] photoBytes = null;
                    if (FileUploadPhoto.HasFile)
                    {
                        if (FileUploadPhoto.PostedFile.ContentLength <= 1048576) {
                            photoBytes = FileUploadPhoto.FileBytes;
                        }
                        else
                        {
                            lblStatus1.Text = "Image size must be less than or equal to 1 MB.";
                            return;
                        }
                    }

                    con.ConnectionString = connectionString;
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO Employees (FirstName, LastName, FatherName, DOB, Gender, Email, Phone, LocalAddress, PermanentAddress, Department, WorkLocation, DateOfJoining, EmploymentType, EmpPhoto) VALUES (@FirstName, @LastName, @FatherName, @DOB, @Gender, @Email, @Phone, @LocalAddress, @PermanentAddress, @Department, @WorkLocation, @DOJ, @EmploymentType , @EmpPhoto)", con);

                    cmd.Parameters.AddWithValue("@FirstName", TxtEmpFn.Text.Trim());
                    cmd.Parameters.AddWithValue("@LastName", TxtEmpLn.Text.Trim());
                    cmd.Parameters.AddWithValue("@FatherName", TxtFatherName.Text.Trim());
                    cmd.Parameters.AddWithValue("@DOB", TxtDob.Text);
                    cmd.Parameters.AddWithValue("@Gender", DropDownGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@Email", TxtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Phone", TxtPhone.Text.Trim());
                    cmd.Parameters.AddWithValue("@LocalAddress", TxtLocalAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@PermanentAddress", TxtPermanentAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@Department", DropDownDepartment.SelectedValue);
                    cmd.Parameters.AddWithValue("@WorkLocation", DropDownWL.SelectedValue);
                    cmd.Parameters.AddWithValue("@DOJ", doj);
                    cmd.Parameters.AddWithValue("@EmploymentType", ddlEmploymentType.SelectedValue);
                    cmd.Parameters.AddWithValue("@EmpPhoto", (object)photoBytes ?? DBNull.Value); // Handle nulls safely

                    cmd.ExecuteNonQuery();
                    lblStatus1.Text = "Employee added successfully!";
                }
                catch (Exception ex)
                {
                    lblStatus1.Text = "Error: " + ex.Message;
                }
                finally
                {
                    con.Close();
                }
            }
        }



        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            TxtEmpFn.Text = string.Empty;
            TxtEmpLn.Text = string.Empty;
            TxtFatherName.Text = string.Empty;
            TxtDob.Text = string.Empty;
            DropDownGender.SelectedIndex = 0;
            TxtEmail.Text = string.Empty;
            TxtPhone.Text = string.Empty;
            TxtLocalAddress.Text = string.Empty;
            TxtPermanentAddress.Text = string.Empty;
            DropDownDepartment.SelectedIndex = 0;
            DropDownWL.SelectedIndex = 0;
            ddlEmploymentType.SelectedIndex = 0;
            lblStatus1.Text = string.Empty;
        }
    }
}
