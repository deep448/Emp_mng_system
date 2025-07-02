using System;
using System.Data;
using System.Data.SqlClient;

namespace emp_mng_system
{
    public partial class Report : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid(); 
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            string selectedEmployeeID = GridView1.SelectedDataKey.Value.ToString();
            }

      
        protected void BindGrid()
        {
            try
            {
                string query = @"SELECT 
                                    e.EmployeeID, 
                                    e.FirstName, 
                                    e.LastName, 
                                    e.DOB, 
                                    e.Gender, 
                                    e.Email, 
                                    e.Phone, 
                                    e.Department, 
                                    e.EmploymentType,
                                    s.BasicSalary, 
                                    s.HRA, 
                                    s.Bonus, 
                                    s.NetSalary, 
                                    s.SalaryDate
                                FROM Employees e
                                INNER JOIN Salary s ON e.EmployeeID = s.EmployeeID";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                LabelSearchResult.Text = "Error loading data: " + ex.Message;
                LabelSearchResult.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string searchValue = TextBoxSearch.Text.Trim();
                if (!string.IsNullOrEmpty(searchValue))
                {
                    string query = @"SELECT 
                                        e.EmployeeID, 
                                        e.FirstName, 
                                        e.LastName, 
                                        e.DOB, 
                                        e.Gender, 
                                        e.Email, 
                                        e.Phone, 
                                        e.Department, 
                                        e.EmploymentType,
                                        s.BasicSalary, 
                                        s.HRA, 
                                        s.Bonus, 
                                        s.NetSalary, 
                                        s.SalaryDate
                                     FROM Employees e
                                     INNER JOIN Salary s ON e.EmployeeID = s.EmployeeID
                                     WHERE e.EmployeeID LIKE @search OR e.Department LIKE @search";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@search", "%" + searchValue + "%");

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        LabelSearchResult.Text = $"{dt.Rows.Count} record(s) found.";
                        LabelSearchResult.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        GridView1.DataSource = null;
                        GridView1.DataBind();
                        LabelSearchResult.Text = "No records found!";
                        LabelSearchResult.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    // Reload full data if search is empty
                    BindGrid();
                    LabelSearchResult.Text = "Enter Employee ID or Department to search.";
                    LabelSearchResult.ForeColor = System.Drawing.Color.Gray;
                }
            }
            catch (Exception ex)
            {
                LabelSearchResult.Text = "Error searching data: " + ex.Message;
                LabelSearchResult.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
