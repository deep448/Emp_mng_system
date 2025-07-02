using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace YourNamespace
{
    public partial class ViewEmpList : System.Web.UI.Page
    {
        string connStr = "Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEmployeeData();
            }
        }

        protected void LoadEmployeeData(string search = "")
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Employees";
                if (!string.IsNullOrEmpty(search))
                {
                    query += " WHERE EmployeeID LIKE @search OR FirstName LIKE @search OR LastName LIKE @search";
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!string.IsNullOrEmpty(search))
                    {
                        cmd.Parameters.AddWithValue("@search", "%" + search + "%");
                    }

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        lblMessage.Text = "";
                    }
                    else
                    {
                        GridView1.DataSource = null;
                        GridView1.DataBind();
                        lblMessage.Text = "No records found.";
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string search = txtSearch.Text.Trim();
            LoadEmployeeData(search);
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadEmployeeData(txtSearch.Text.Trim());
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadEmployeeData(txtSearch.Text.Trim());
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string empId = GridView1.DataKeys[e.RowIndex].Value.ToString();

            string firstName = ((TextBox)row.Cells[1].Controls[0]).Text.Trim();
            string lastName = ((TextBox)row.Cells[2].Controls[0]).Text.Trim();
            string dob = ((TextBox)row.Cells[3].Controls[0]).Text.Trim();
            string gender = ((TextBox)row.Cells[4].Controls[0]).Text.Trim();
            string email = ((TextBox)row.Cells[5].Controls[0]).Text.Trim();
            string phone = ((TextBox)row.Cells[6].Controls[0]).Text.Trim();
            string dept = ((TextBox)row.Cells[7].Controls[0]).Text.Trim();
            string empType = ((TextBox)row.Cells[8].Controls[0]).Text.Trim();
            string doj = ((TextBox)row.Cells[9].Controls[0]).Text.Trim();
            string workLoc = ((TextBox)row.Cells[10].Controls[0]).Text.Trim();

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"UPDATE Employees SET 
                                FirstName = @FirstName, 
                                LastName = @LastName, 
                                DOB = @DOB, 
                                Gender = @Gender, 
                                Email = @Email, 
                                Phone = @Phone, 
                                Department = @Department, 
                                EmploymentType = @EmploymentType, 
                                DateOfJoining = @DateOfJoining, 
                                WorkLocation = @WorkLocation 
                                WHERE EmployeeID = @EmployeeID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@DOB", dob);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Phone", phone);
                    cmd.Parameters.AddWithValue("@Department", dept);
                    cmd.Parameters.AddWithValue("@EmploymentType", empType);
                    cmd.Parameters.AddWithValue("@DateOfJoining", doj);
                    cmd.Parameters.AddWithValue("@WorkLocation", workLoc);
                    cmd.Parameters.AddWithValue("@EmployeeID", empId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            GridView1.EditIndex = -1;
            LoadEmployeeData(txtSearch.Text.Trim());
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string empId = GridView1.DataKeys[e.RowIndex].Value.ToString();

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Employees WHERE EmployeeID = @EmployeeID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmployeeID", empId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            LoadEmployeeData(txtSearch.Text.Trim());
        }
    }
}
