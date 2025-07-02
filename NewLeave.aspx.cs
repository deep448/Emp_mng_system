using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace emp_mng_system
{
    public partial class NewLeave : System.Web.UI.Page
    {
        string conStr = "Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LblMessage.Text = "";
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                  
                    DateTime fromDate = Convert.ToDateTime(txtFromDate.Text);
                    DateTime toDate = Convert.ToDateTime(txtToDate.Text);
                    int totalDays = (toDate - fromDate).Days + 1; 
                    txtTotalDays.Text = totalDays.ToString();

                    using (SqlConnection con = new SqlConnection(conStr))
                    {
                        string query = "INSERT INTO Leave (EmployeeID, LeaveType, FromDate, ToDate, TotalDays, Reason) " +
                                       "VALUES (@EmpID, @LeaveType, @FromDate, @ToDate, @TotalDays, @Reason)";

                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text.Trim());
                        cmd.Parameters.AddWithValue("@LeaveType", ddlLeaveType.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@FromDate", fromDate);
                        cmd.Parameters.AddWithValue("@ToDate", toDate);
                        cmd.Parameters.AddWithValue("@TotalDays", totalDays);
                        cmd.Parameters.AddWithValue("@Reason", txtReason.Text.Trim());

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                        LblMessage.ForeColor = System.Drawing.Color.Green;
                        LblMessage.Text = "Leave application saved successfully.";

                        ClearForm();
                    }
                }
            }
            catch (Exception ex)
            {
                LblMessage.ForeColor = System.Drawing.Color.Red;
                LblMessage.Text = "Error: " + ex.Message;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
            LblMessage.Text = "";
        }

        private void ClearForm()
        {
            txtEmpID.Text = "";
            ddlLeaveType.SelectedIndex = 0;
            txtFromDate.Text = "";
            txtToDate.Text = "";
            txtTotalDays.Text = "";
            txtReason.Text = "";
        }
    }
}
