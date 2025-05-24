using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gamified_Survey__Graduation_Project
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Store survey start time
                Session["surveyStartTime"] = DateTime.Now;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
         
            string name = txtName.Text; // Ensure 'name' is defined
            string age = ddlAge.SelectedValue;
            string education = ddlEducation.SelectedValue;
            string gender = ddlGender.SelectedValue;
            DateTime startTime = (DateTime)Session["surveyStartTime"];
            Session["Username"] = name; // Optional, use as needed

            // Save to database and get UserId
            string connStr = WebConfigurationManager.ConnectionStrings["Survey"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
        INSERT INTO Users (Name, Age, Education, Gender, Starttime)
        OUTPUT INSERTED.UID
        VALUES (@Name, @Age, @Education, @Gender, @StartTime);";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Age", age);
                    cmd.Parameters.AddWithValue("@Education", education);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@StartTime", startTime);

                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    conn.Close();

                    if (result != null)
                    {
                        int userId = Convert.ToInt32(result);
                        Session["UserId"] = userId; // Save in session
                    }
                }
            }

            // Redirect to avatar selection page
            Response.Redirect("Avatar.aspx");
           
        }
    }
}