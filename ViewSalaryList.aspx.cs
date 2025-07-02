using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace YourNamespace
{
    public partial class ViewSalaryList : System.Web.UI.Page
    {
        // ✅ Change this to match your actual connection string
        string connStr = "Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSalaryData();
            }
        }

        private void LoadSalaryData()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Salary", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Set the row to edit mode
            GridView1.EditIndex = e.NewEditIndex;
            LoadSalaryData();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Cancel the edit mode and reset the grid
            GridView1.EditIndex = -1;
            LoadSalaryData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Retrieve the Employee ID (Primary Key)
            string empId = GridView1.DataKeys[e.RowIndex].Value.ToString();

            // Get the updated values from the TextBox controls in the grid row
            GridViewRow row = GridView1.Rows[e.RowIndex];

            string basic = ((TextBox)row.Cells[1].Controls[0]).Text.Trim();
            string hra = ((TextBox)row.Cells[2].Controls[0]).Text.Trim();
            string conveyance = ((TextBox)row.Cells[3].Controls[0]).Text.Trim();
            string medical = ((TextBox)row.Cells[4].Controls[0]).Text.Trim();
            string bonus = ((TextBox)row.Cells[5].Controls[0]).Text.Trim();
            string overtime = ((TextBox)row.Cells[6].Controls[0]).Text.Trim();
            string advance = ((TextBox)row.Cells[7].Controls[0]).Text.Trim();
            string netSalary = ((TextBox)row.Cells[8].Controls[0]).Text.Trim();

            // Update query
            string query = @"UPDATE Salary SET 
                                BasicSalary = @BasicSalary, 
                                HRA = @HRA, 
                                Conveyance = @Conveyance,
                                MedicalAllowance = @MedicalAllowance,
                                Bonus = @Bonus,
                                Overtime = @Overtime,
                                AdvanceDeduction = @AdvanceDeduction,
                                NetSalary = @NetSalary
                            WHERE EmployeeID = @EmployeeID";

            using (SqlConnection con = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                // Adding parameters to avoid SQL Injection
                cmd.Parameters.AddWithValue("@EmployeeID", empId);
                cmd.Parameters.AddWithValue("@BasicSalary", basic);
                cmd.Parameters.AddWithValue("@HRA", hra);
                cmd.Parameters.AddWithValue("@Conveyance", conveyance);
                cmd.Parameters.AddWithValue("@MedicalAllowance", medical);
                cmd.Parameters.AddWithValue("@Bonus", bonus);
                cmd.Parameters.AddWithValue("@Overtime", overtime);
                cmd.Parameters.AddWithValue("@AdvanceDeduction", advance);
                cmd.Parameters.AddWithValue("@NetSalary", netSalary);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Exit edit mode and reload data
            GridView1.EditIndex = -1;
            LoadSalaryData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get the Employee ID
            string empId = GridView1.DataKeys[e.RowIndex].Value.ToString();

            using (SqlConnection con = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand("DELETE FROM Salary WHERE EmployeeID = @EmployeeID", con))
            {
                // Adding the parameter to prevent SQL Injection
                cmd.Parameters.AddWithValue("@EmployeeID", empId);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Reload data after deletion
            LoadSalaryData();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchKeyword = txtSearch.Text.Trim();

            if (!string.IsNullOrEmpty(searchKeyword))
            {
                string query = @"SELECT * FROM Salary WHERE EmployeeID LIKE @SearchKeyword";

                using (SqlConnection con = new SqlConnection(connStr))
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@SearchKeyword", searchKeyword);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        lblMessage.Visible = false; // Hide the message label if results are found
                    }
                    else
                    {
                        lblMessage.Visible = true;
                        lblMessage.Text = "No results found!";
                    }
                }
            }
            else
            {
                LoadSalaryData();
                lblMessage.Visible = false; // Hide the message label if no search term is entered
            }
        }
    }
}

