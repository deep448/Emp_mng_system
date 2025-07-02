using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace emp_mng_system
{
    public partial class Employee : System.Web.UI.Page
    {
        private string connectionString = "Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            string empId = TextBoxSearch.Text.Trim();

            if (string.IsNullOrEmpty(empId))
            {
                LabelSearchResult.Text = "Please enter an Employee ID.";
                LabelSearchResult.ForeColor = System.Drawing.Color.Red;
                return;
            }

            LoadEmployeeById(empId);
        }

        private void LoadEmployeeById(string empId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT * FROM Employees WHERE EmployeeID = @EmpID";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@EmpID", empId);

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            if (dt.Rows.Count > 0)
                            {
                                GridView1.DataSource = dt;
                                GridView1.DataBind();
                                LabelSearchResult.Text = $"Found {dt.Rows.Count} record(s) for Employee ID: {empId}";
                                LabelSearchResult.ForeColor = System.Drawing.Color.Green;
                            }
                            else
                            {
                                GridView1.DataSource = null;
                                GridView1.DataBind();
                                LabelSearchResult.Text = "No employee found with the given ID.";
                                LabelSearchResult.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    LabelSearchResult.Text = "Error: " + ex.Message;
                    LabelSearchResult.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadEmployeeById(TextBoxSearch.Text.Trim());
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadEmployeeById(TextBoxSearch.Text.Trim());
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string empId = GridView1.DataKeys[e.RowIndex].Value.ToString();

            string firstName = ((TextBox)row.FindControl("txtFirstName")).Text.Trim();
            string lastName = ((TextBox)row.FindControl("txtLastName")).Text.Trim();
            string dob = ((TextBox)row.FindControl("txtDOB")).Text.Trim();
            string gender = ((DropDownList)row.FindControl("ddlGender")).SelectedValue;
            string email = ((TextBox)row.FindControl("txtEmail")).Text.Trim();
            string phone = ((TextBox)row.FindControl("txtPhone")).Text.Trim();
            string department = ((DropDownList)row.FindControl("ddlDepartment")).SelectedValue;
            string designation = ((TextBox)row.FindControl("txtDesignation")).Text.Trim();
            string employmentType = ((DropDownList)row.FindControl("ddlEmploymentType")).SelectedValue;
            string doj = ((TextBox)row.FindControl("txtDOJ")).Text.Trim();
            string workLocation = ((TextBox)row.FindControl("txtWorkLocation")).Text.Trim();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string updateQuery = @"UPDATE Employees SET 
                        FirstName=@FirstName, LastName=@LastName, DOB=@DOB, Gender=@Gender, Email=@Email, 
                        Phone=@Phone, Department=@Department, Designation=@Designation, EmploymentType=@EmploymentType, 
                        DateOfJoining=@DOJ, WorkLocation=@WorkLocation 
                        WHERE EmployeeID=@EmpID";

                    using (SqlCommand cmd = new SqlCommand(updateQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@EmpID", empId);
                        cmd.Parameters.AddWithValue("@FirstName", firstName);
                        cmd.Parameters.AddWithValue("@LastName", lastName);
                        cmd.Parameters.AddWithValue("@DOB", dob);
                        cmd.Parameters.AddWithValue("@Gender", gender);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Phone", phone);
                        cmd.Parameters.AddWithValue("@Department", department);
                        cmd.Parameters.AddWithValue("@Designation", designation);
                        cmd.Parameters.AddWithValue("@EmploymentType", employmentType);
                        cmd.Parameters.AddWithValue("@DOJ", doj);
                        cmd.Parameters.AddWithValue("@WorkLocation", workLocation);

                        cmd.ExecuteNonQuery();

                        LabelSearchResult.Text = "Employee updated successfully.";
                        LabelSearchResult.ForeColor = System.Drawing.Color.Green;

                        GridView1.EditIndex = -1;
                        LoadEmployeeById(empId);
                    }
                }
                catch (Exception ex)
                {
                    LabelSearchResult.Text = "Error updating employee: " + ex.Message;
                    LabelSearchResult.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string empId = e.CommandArgument.ToString();

            if (e.CommandName == "RemoveRow")
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    try
                    {
                        con.Open();
                        string deleteQuery = "DELETE FROM Employees WHERE EmployeeID = @EmpID";
                        using (SqlCommand cmd = new SqlCommand(deleteQuery, con))
                        {
                            cmd.Parameters.AddWithValue("@EmpID", empId);
                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                LabelSearchResult.Text = "Employee removed successfully.";
                                LabelSearchResult.ForeColor = System.Drawing.Color.Green;
                                GridView1.EditIndex = -1;
                                GridView1.DataSource = null;
                                GridView1.DataBind();
                            }
                            else
                            {
                                LabelSearchResult.Text = "Failed to remove employee.";
                                LabelSearchResult.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        LabelSearchResult.Text = "Error: " + ex.Message;
                        LabelSearchResult.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEmployee.aspx");
        }

        protected void BtnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void BtnDepartment_Click(object sender, EventArgs e)
        {
            Response.Redirect("Department.aspx");
        }

        protected void BtnEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employee.aspx");
        }

        protected void BtnSalary_Click(object sender, EventArgs e)
        {
            Response.Redirect("Salary.aspx");
        }

        protected void BtnLeave_Click(object sender, EventArgs e)
        {
            Response.Redirect("Leave.aspx");
        }

        protected void BtbBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void btn_view_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewEmpList.aspx");

        }
    }
}
