using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace emp_mng_system
{
    public partial class Leave : System.Web.UI.Page
    {
        string conStr = "Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False";
        static string empIdSearch = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LeaveLabelSearchResult.Text = "Enter Employee ID to search.";
            }
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            empIdSearch = TextBoxSearch.Text.Trim();
            if (!string.IsNullOrEmpty(empIdSearch))
            {
                LoadGridData();
            }
            else
            {
                LeaveLabelSearchResult.Text = "Please enter a valid Employee ID.";
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }

        private void LoadGridData()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"
            SELECT 
                e.EmployeeID,
                (e.FirstName + ' ' + e.LastName) AS FullName,
                e.Department,
                l.LeaveID,
                l.LeaveType,
                l.FromDate,
                l.ToDate,
                l.Reason,
                l.LeaveStatus
            FROM Employees e
            INNER JOIN Leave l ON e.EmployeeID = l.EmployeeID
            WHERE e.EmployeeID = @EmployeeID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmployeeID", empIdSearch);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    LeaveLabelSearchResult.Text = $"{dt.Rows.Count} record(s) found.";
                }
                else
                {
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                    LeaveLabelSearchResult.Text = "No records found for this Employee ID. You Can Add New Leave Details ";
                }
            }
        }


        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewLeave.aspx");
        }

        protected void btn_view_Click(object sender, EventArgs e)
        {
            Response.Redirect("LeaveStatus.aspx");
        }

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadGridData();
        }

        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadGridData();
        }

        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];

            string employeeId = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string leaveType = ((System.Web.UI.WebControls.TextBox)row.FindControl("txtLeaveType")).Text.Trim();
            string fromDate = ((System.Web.UI.WebControls.TextBox)row.FindControl("txtLeaveStartDate")).Text.Trim();
            string toDate = ((System.Web.UI.WebControls.TextBox)row.FindControl("txtLeaveEndDate")).Text.Trim();
            string reason = ((System.Web.UI.WebControls.TextBox)row.FindControl("txtReason")).Text.Trim();
            string leaveStatus = ((System.Web.UI.WebControls.DropDownList)row.FindControl("ddlLeaveStatus")).SelectedValue;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"UPDATE Leave 
                                SET LeaveType = @LeaveType, FromDate = @FromDate, ToDate = @ToDate, 
                                    Reason = @Reason, LeaveStatus = @LeaveStatus
                                WHERE EmployeeID = @EmployeeID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@LeaveType", leaveType);
                cmd.Parameters.AddWithValue("@FromDate", fromDate);
                cmd.Parameters.AddWithValue("@ToDate", toDate);
                cmd.Parameters.AddWithValue("@Reason", reason);
                cmd.Parameters.AddWithValue("@LeaveStatus", leaveStatus);
                cmd.Parameters.AddWithValue("@EmployeeID", employeeId);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            GridView1.EditIndex = -1;
            LoadGridData();
        }

        protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "RemoveRow")
            {
                string empId = e.CommandArgument.ToString();

                using (SqlConnection con = new SqlConnection(conStr))
                {
                    string query = "DELETE FROM Leave WHERE EmployeeID = @EmployeeID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@EmployeeID", empId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                LoadGridData();
            }
        }
    }
}
