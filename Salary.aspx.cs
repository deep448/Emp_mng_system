using System;
using System.Data.SqlClient;
using System.Configuration;

namespace emp_mng_system
{
    public partial class Salary : System.Web.UI.Page
    {
        
        string conString = "Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblStatus.Text = "";
            }
        }

       
        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            try
            {
                decimal basicSalary = Convert.ToDecimal(txtBasic.Text.Trim());
                decimal hraPercent = Convert.ToDecimal(ddlHRA.SelectedValue);
                decimal conveyancePercent = Convert.ToDecimal(ddlConveyance.SelectedValue);
                decimal medicalPercent = Convert.ToDecimal(ddlMedical.SelectedValue);
                decimal bonusPercent = Convert.ToDecimal(ddlBonus.SelectedValue);
                decimal overtime = string.IsNullOrEmpty(txtOvertime.Text.Trim()) ? 0 : Convert.ToDecimal(txtOvertime.Text.Trim());

                decimal hraAmount = (basicSalary * hraPercent) / 100;
                decimal conveyanceAmount = (basicSalary * conveyancePercent) / 100;
                decimal medicalAmount = (basicSalary * medicalPercent) / 100;
                decimal bonusAmount = (basicSalary * bonusPercent) / 100;

                decimal netSalary = basicSalary + hraAmount + conveyanceAmount + medicalAmount + bonusAmount + overtime;

                lblStatus.Text = "Calculated Net Salary: ₹" + netSalary.ToString("F2");
                lblStatus.ForeColor = System.Drawing.Color.Blue;
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error in calculation: " + ex.Message;
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnsave_Click1(object sender, EventArgs e)
        {
            try
            {
                int employeeID = Convert.ToInt32(txtEmpId.Text.Trim());
                decimal basicSalary = Convert.ToDecimal(txtBasic.Text.Trim());
                decimal hraPercent = Convert.ToDecimal(ddlHRA.SelectedValue);
                decimal conveyancePercent = Convert.ToDecimal(ddlConveyance.SelectedValue);
                decimal medicalPercent = Convert.ToDecimal(ddlMedical.SelectedValue);
                decimal bonusPercent = Convert.ToDecimal(ddlBonus.SelectedValue);
                decimal overtime = string.IsNullOrEmpty(txtOvertime.Text.Trim()) ? 0 : Convert.ToDecimal(txtOvertime.Text.Trim());

                decimal hraAmount = (basicSalary * hraPercent) / 100;
                decimal conveyanceAmount = (basicSalary * conveyancePercent) / 100;
                decimal medicalAmount = (basicSalary * medicalPercent) / 100;
                decimal bonusAmount = (basicSalary * bonusPercent) / 100;

                decimal netSalary = basicSalary + hraAmount + conveyanceAmount + medicalAmount + bonusAmount + overtime;

                using (SqlConnection con = new SqlConnection(conString))
                {
                    string query = @"INSERT INTO Salary
            (EmployeeID, BasicSalary, HRA, Conveyance, MedicalAllowance, Bonus, Overtime, NetSalary, SalaryDate)
            VALUES
            (@EmployeeID, @BasicSalary, @HRA, @Conveyance, @Medical, @Bonus, @Overtime, @NetSalary, @SalaryDate)";

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@EmployeeID", employeeID); 
                    cmd.Parameters.AddWithValue("@BasicSalary", basicSalary);
                    cmd.Parameters.AddWithValue("@HRA", hraPercent);
                    cmd.Parameters.AddWithValue("@Conveyance", conveyancePercent);
                    cmd.Parameters.AddWithValue("@Medical", medicalPercent);
                    cmd.Parameters.AddWithValue("@Bonus", bonusPercent);
                    cmd.Parameters.AddWithValue("@Overtime", overtime);
                    cmd.Parameters.AddWithValue("@NetSalary", netSalary);
                    cmd.Parameters.AddWithValue("@SalaryDate", DateTime.Now);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rowsAffected > 0)
                    {
                        lblStatus.Text = "Salary Saved Successfully!";
                        lblStatus.ForeColor = System.Drawing.Color.Green;
                        ClearFields();
                    }
                    else
                    {
                        lblStatus.Text = "Failed to Save Salary.";
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


        // View All Salary records
        protected void btnView_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewSalaryList.aspx");
        }

        // Clear all fields after saving
        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearFields();
            lblStatus.Text = "";
        }

        private void ClearFields()
        {
            txtEmpId.Text = "";
            txtBasic.Text = "";
            txtDate.Text = "";
            ddlHRA.SelectedIndex = 0;
            ddlConveyance.SelectedIndex = 0;
            ddlMedical.SelectedIndex = 0;
            ddlBonus.SelectedIndex = 0;
            txtOvertime.Text = "";
        }
    }
}
