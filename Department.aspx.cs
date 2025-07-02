    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Configuration;
    using System.Web.UI.WebControls;

    namespace emp_mng_system
    {
        public partial class Department : System.Web.UI.Page
        {
            private string connectionString = "Server=DESKTOP-RAN16E1;Database=emp_mng_system;Integrated Security=True;Encrypt=False";

            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    LoadDepartments();
                }
            }

            private void LoadDepartments()
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT * FROM Department";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridViewDepartments.DataSource = dt;
                    GridViewDepartments.DataBind();
                }
            }

            protected void btnAdd_Click(object sender, EventArgs e)
            {
                Response.Redirect("AddDepartment.aspx");
            }

            protected void btnBack_Click(object sender, EventArgs e)
            {
                Response.Redirect("Dashboard.aspx");
            }

            protected void GridViewDepartments_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
            {
                GridViewDepartments.EditIndex = e.NewEditIndex;
                LoadDepartments();
            }

            protected void GridViewDepartments_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
            {
                GridViewDepartments.EditIndex = -1;
                LoadDepartments();
            }

            protected void GridViewDepartments_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
            {
                GridViewRow row = GridViewDepartments.Rows[e.RowIndex];
                int deptID = Convert.ToInt32(GridViewDepartments.DataKeys[e.RowIndex].Value);

                string deptName = ((System.Web.UI.HtmlControls.HtmlInputText)row.FindControl("txtEditDeptName")).Value;
                string deptCode = ((System.Web.UI.HtmlControls.HtmlInputText)row.FindControl("txtEditDeptCode")).Value;
                string deptHead = ((System.Web.UI.HtmlControls.HtmlInputText)row.FindControl("txtEditDeptHead")).Value;
                string location = ((System.Web.UI.HtmlControls.HtmlInputText)row.FindControl("txtEditLocation")).Value;
                string phone = ((System.Web.UI.HtmlControls.HtmlInputText)row.FindControl("txtEditPhone")).Value;
                string email = ((System.Web.UI.HtmlControls.HtmlInputText)row.FindControl("txtEditEmail")).Value;
                string description = ((System.Web.UI.HtmlControls.HtmlInputText)row.FindControl("txtEditDescription")).Value;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string updateQuery = @"UPDATE Department SET DeptName = @DeptName, DeptCode = @DeptCode, DeptHead = @DeptHead,
                                        Location = @Location, Phone = @Phone, Email = @Email, Description = @Description 
                                        WHERE DeptID = @DeptID";
                    SqlCommand cmd = new SqlCommand(updateQuery, con);
                    cmd.Parameters.AddWithValue("@DeptName", deptName);
                    cmd.Parameters.AddWithValue("@DeptCode", deptCode);
                    cmd.Parameters.AddWithValue("@DeptHead", deptHead);
                    cmd.Parameters.AddWithValue("@Location", location);
                    cmd.Parameters.AddWithValue("@Phone", phone);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@DeptID", deptID);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                GridViewDepartments.EditIndex = -1;
                LoadDepartments();
            }

            protected void GridViewDepartments_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
            {
                int deptID = Convert.ToInt32(GridViewDepartments.DataKeys[e.RowIndex].Value);

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string deleteQuery = "DELETE FROM Department WHERE DeptID = @DeptID";
                    SqlCommand cmd = new SqlCommand(deleteQuery, con);
                    cmd.Parameters.AddWithValue("@DeptID", deptID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                LoadDepartments();
            }
        }
    }
