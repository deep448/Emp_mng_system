using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;

namespace emp_mng_system
{
    public partial class EmployeeDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string email = GetEmailFromSession();

                if (!string.IsNullOrEmpty(email))
                {
                    LoadEmployeeData(email);
                }
                else
                {
                    Response.Redirect("EmployeeLogin.aspx");
                }
            }
        }

        private string GetEmailFromSession()
        {
            return Session["Email"]?.ToString();
        }

        // Method to safely return a value or "N/A" if the value is null
        private string GetSafeValue(object obj)
        {
            return obj != DBNull.Value ? obj.ToString() : "N/A";
        }

        private void LoadEmployeeData(string email)
        {
            string connectionString = "Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    
                    string queryPersonal = "SELECT * FROM Employees WHERE Email = @Email";
                    SqlCommand cmdPersonal = new SqlCommand(queryPersonal, conn);
                    cmdPersonal.Parameters.AddWithValue("@Email", email);
                    SqlDataReader readerPersonal = cmdPersonal.ExecuteReader();

                    if (readerPersonal.Read())
                    {
                        lblEmpID.Text = GetSafeValue(readerPersonal["EmployeeID"]);
                        lblEmail1.Text = GetSafeValue(readerPersonal["Email"]);
                        LblFn.Text = GetSafeValue(readerPersonal["FirstName"]);
                        LblLn.Text = GetSafeValue(readerPersonal["LastName"]);
                        lblEmail.Text = GetSafeValue(readerPersonal["Email"]);
                        lblDepartment.Text = GetSafeValue(readerPersonal["Department"]);
                        lblFatherName.Text = GetSafeValue(readerPersonal["FatherName"]);
                        lblDOB.Text = readerPersonal["DOB"] != DBNull.Value ? Convert.ToDateTime(readerPersonal["DOB"]).ToString("yyyy-MM-dd") : "N/A";
                        lblGender.Text = GetSafeValue(readerPersonal["Gender"]);
                        lblPhone.Text = GetSafeValue(readerPersonal["Phone"]);
                        lblLocalAddress.Text = GetSafeValue(readerPersonal["LocalAddress"]);
                        lblPermanentAddress.Text = GetSafeValue(readerPersonal["PermanentAddress"]);
                        lblJoinDate.Text = readerPersonal["DateOfJoining"] != DBNull.Value ? Convert.ToDateTime(readerPersonal["DateOfJoining"]).ToString("yyyy-MM-dd") : "N/A";
                    }
                    readerPersonal.Close();

                   
                    string querySalary = "SELECT * FROM Salary WHERE EmployeeID = (SELECT EmployeeID FROM Employees WHERE Email = @Email)";
                    SqlCommand cmdSalary = new SqlCommand(querySalary, conn);
                    cmdSalary.Parameters.AddWithValue("@Email", email);
                    SqlDataReader readerSalary = cmdSalary.ExecuteReader();

                    if (readerSalary.Read())
                    {
                        lblBasic.Text = GetSafeValue(readerSalary["BasicSalary"]);
                        lblDate.Text = readerSalary["SalaryDate"] != DBNull.Value ? Convert.ToDateTime(readerSalary["SalaryDate"]).ToString("yyyy-MM-dd") : "N/A";
                        LabelHRA.Text = GetSafeValue(readerSalary["HRA"]);
                        LabelConveyance.Text = GetSafeValue(readerSalary["Conveyance"]);
                        lblBonus.Text = GetSafeValue(readerSalary["Bonus"]);
                        lblOvertime.Text = GetSafeValue(readerSalary["Overtime"]);
                        lblNetSalary.Text = GetSafeValue(readerSalary["NetSalary"]);
                    }
                    readerSalary.Close();

                    string queryDept = @"
                        SELECT * FROM Department 
                        WHERE DeptName = (SELECT Department FROM Employees WHERE Email = @Email)";
                    SqlCommand cmdDept = new SqlCommand(queryDept, conn);
                    cmdDept.Parameters.AddWithValue("@Email", email);
                    SqlDataReader readerDept = cmdDept.ExecuteReader();

                    if (readerDept.Read())
                    {
                        lblDeptCode.Text = GetSafeValue(readerDept["DeptCode"]);
                        lblDeptHead.Text = GetSafeValue(readerDept["DeptHead"]);
                        lblDeptContact.Text = GetSafeValue(readerDept["Phone"]);
                        lblDeptEmail.Text = GetSafeValue(readerDept["Email"]);
                        lblDeptLocation.Text = GetSafeValue(readerDept["Location"]);
                        lblDeptDescription.Text = GetSafeValue(readerDept["Description"]);
                    }
                    readerDept.Close();

                    string queryLeave = "SELECT * FROM Leave WHERE EmployeeID = (SELECT EmployeeID FROM Employees WHERE Email = @Email)";
                    SqlCommand cmdLeave = new SqlCommand(queryLeave, conn);
                    cmdLeave.Parameters.AddWithValue("@Email", email);
                    SqlDataReader readerLeave = cmdLeave.ExecuteReader();

                    if (readerLeave.Read())
                    {
                        lblLeaveType.Text = GetSafeValue(readerLeave["LeaveType"]);
                        lblFromDate.Text = readerLeave["FromDate"] != DBNull.Value ? Convert.ToDateTime(readerLeave["FromDate"]).ToString("yyyy-MM-dd") : "N/A";
                        lblToDate.Text = readerLeave["ToDate"] != DBNull.Value ? Convert.ToDateTime(readerLeave["ToDate"]).ToString("yyyy-MM-dd") : "N/A";
                        lblTotalDays.Text = GetSafeValue(readerLeave["TotalDays"]);
                        lblReason.Text = GetSafeValue(readerLeave["Reason"]);
                        lblLeaveStatus.Text = GetSafeValue(readerLeave["LeaveStatus"]);
                    }
                    readerLeave.Close();

                  
                    string queryImage = "SELECT EmpPhoto FROM Employees WHERE Email = @Email";
                    SqlCommand cmdImage = new SqlCommand(queryImage, conn);
                    cmdImage.Parameters.AddWithValue("@Email", email);
                    SqlDataReader readerImage = cmdImage.ExecuteReader();

                    if (readerImage.Read())
                    {
                        object photo = readerImage["EmpPhoto"];
                        if (photo != DBNull.Value && !string.IsNullOrWhiteSpace(photo.ToString()))
                        {
                            EmpPhoto.ImageUrl = "~/Images/" + photo.ToString();
                            lblError.Text = "";
                        }
                        else
                        {
                            EmpPhoto.ImageUrl = "~/Images/default.jpg";
                            lblError.Text = "Employee photo unavailable.";
                        }
                    }
                    else
                    {
                        EmpPhoto.ImageUrl = "~/Images/default.jpg";
                        lblError.Text = "Employee not found.";
                    }
                    readerImage.Close();
                }
                catch (Exception ex)
                {
                    lblError.Text = "Error loading data: " + ex.Message;
                }
            }
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("EmployeeLogin.aspx");
        }
    }
}
