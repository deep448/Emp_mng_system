using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace emp_mng_system
{
    public partial class Dashboard : Page
    {
        
        private readonly string connectionString = "Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetEmployeeCount();
                GetDepartmentCount();
                GetLeaveCount();
            }
        }

        private void GetEmployeeCount()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "SELECT COUNT(*) FROM Employees"; 
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        int employeeCount = Convert.ToInt32(cmd.ExecuteScalar());

                         if (lblTotalEmployees != null)
                        {
                            lblTotalEmployees.Text = employeeCount.ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblTotalEmployees.Text = "Data unavailable";
                System.Diagnostics.Debug.WriteLine("Error in GetEmployeeCount: " + ex.Message);
            }
        }

        private void GetDepartmentCount()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "SELECT COUNT(*) FROM Department"; 
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        int departmentCount = Convert.ToInt32(cmd.ExecuteScalar());

                        if (lblTotalDepartment != null)
                        {
                            lblTotalDepartment.Text = departmentCount.ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblTotalDepartment.Text = "Data unavailable";
                System.Diagnostics.Debug.WriteLine("Error in GetDepartmentCount: " + ex.Message);
            }
        }
     

        private void GetLeaveCount()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "SELECT COUNT(*) FROM Leave"; 
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        int leaveCount = Convert.ToInt32(cmd.ExecuteScalar());

                        if (LabelLeaveStatus != null)
                        {
                            LabelLeaveStatus.Text = leaveCount.ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                LabelLeaveStatus.Text = "Data unavailable";
                System.Diagnostics.Debug.WriteLine("Error in GetLeaveCount: " + ex.Message);
            }
        }


        protected void BtnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void BtnEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employee.aspx");
        }

        protected void BtnDepartment_Click(object sender, EventArgs e)
        {
            Response.Redirect("Department.aspx");
        }

        protected void BtnSalary_Click(object sender, EventArgs e)
        {
            Response.Redirect("Salary.aspx");
        }

        protected void ImageEmployee_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ViewEmpList.aspx");

        }

        protected void ImageDept_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Department.aspx");


        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Leave.aspx");

        }
    }
}
