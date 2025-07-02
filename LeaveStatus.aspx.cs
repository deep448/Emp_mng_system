using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace YourNamespace
{
    public partial class LeaveStatus : System.Web.UI.Page
    {
        string connectionString = "Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Optional: load default leave records
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindLeaveStatus();
        }

        private void BindLeaveStatus()
        {
            string employeeId = txtEmployeeID.Text.Trim();
            if (string.IsNullOrEmpty(employeeId))
            {
                lblMessage.Text = "Please enter an Employee ID.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                GridViewLeaveStatus.DataSource = null;
                GridViewLeaveStatus.DataBind();
                return;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT LeaveID, EmployeeID, LeaveType, FromDate, ToDate, Reason, LeaveStatus FROM Leave WHERE EmployeeID = @EmployeeID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmployeeID", employeeId);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            GridViewLeaveStatus.DataSource = dt;
                            GridViewLeaveStatus.DataBind();
                            lblMessage.Text = "";
                        }
                        else
                        {
                            lblMessage.Text = "No leave records found.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            GridViewLeaveStatus.DataSource = null;
                            GridViewLeaveStatus.DataBind();
                        }
                    }
                }
            }
        }

        protected void GridViewLeaveStatus_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateStatus")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewLeaveStatus.Rows[rowIndex];

                DropDownList ddlStatus = (DropDownList)row.FindControl("ddlStatus");
                if (ddlStatus != null)
                {
                    string selectedStatus = ddlStatus.SelectedValue;
                    string leaveId = GridViewLeaveStatus.DataKeys[row.RowIndex].Value.ToString(); // From DataKeyNames

                    UpdateLeaveStatus(leaveId, selectedStatus);
                    BindLeaveStatus(); 
                }
            }
        }

        private void UpdateLeaveStatus(string leaveId, string status)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE Leave SET LeaveStatus = @Status WHERE LeaveID = @LeaveID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Status", status);
                    cmd.Parameters.AddWithValue("@LeaveID", leaveId);
                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    Lblmssg.Text = rowsAffected > 0
                        ? "Leave Status Updated Successfully."
                        : "Error updating leave status.";
                    Lblmssg.ForeColor = rowsAffected > 0 ? System.Drawing.Color.Green : System.Drawing.Color.Red;
                }
            }
        }

    }
}
