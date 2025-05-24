using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gamified_Survey__Graduation_Project
{
    public partial class post : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Store the start time when the page is first loaded
                if (Session["UserId"] == null)

                {
                    Session["UserId"] = 1;
                    Session["sureyStartTime"] = DateTime.Now;
                    
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
             
            

            int uid = Convert.ToInt32(Session["UserId"]);
            DateTime endTime = DateTime.Now;
            DateTime startTime = Convert.ToDateTime(Session["surveyStartTime"]);
            TimeSpan duration = endTime - startTime;
            string formatted = $"{(int)duration.TotalHours:00}:{duration.Minutes:00}:{duration.Seconds:00}";






            // Update user's end time and duration
            UpdateUserSurveyTime(uid, endTime, formatted);

            // Save feedback responses
            SaveFeedbackResponse(uid, 1, question1.SelectedValue);
            SaveFeedbackResponse(uid, 2, question2.SelectedValue);
            SaveFeedbackResponse(uid, 3, question3.SelectedValue);
            SaveFeedbackResponse(uid, 4, question4.SelectedValue);
            SaveFeedbackResponse(uid, 5, question5.SelectedValue);
            SaveFeedbackResponse(uid, 6, question6.SelectedValue);
            SaveFeedbackResponse(uid, 7, question7.SelectedValue);
            SaveFeedbackResponse(uid, 8, question8.SelectedValue);
            SaveFeedbackResponse(uid, 9, question9.SelectedValue);
            SaveFeedbackResponse(uid, 10, question10.SelectedValue);
            SaveFeedbackResponse(uid, 11, question11.SelectedValue);
            SaveFeedbackResponse(uid, 12, question12.Text);

            // Show completion message
            ClientScript.RegisterStartupScript(this.GetType(), "CompletionTime",
                $"alert('Thank you for completing the survey! You took {duration.Minutes} minutes and {duration.Seconds} seconds.');", true);

            // Clear session and redirect
           
            Response.Redirect("ThankYou.aspx");
        }

        private void UpdateUserSurveyTime(int uid, DateTime endTime, string duration)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Survey"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"UPDATE Users 
                            SET Endtime = @EndTime, 
                                Duration = @Duration
                            WHERE UID = @UID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UID", uid);
                    command.Parameters.AddWithValue("@EndTime", endTime);
                    command.Parameters.AddWithValue("@Duration", duration);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

        private void SaveFeedbackResponse(int uid, int fqid, string answer)
        {
            if (string.IsNullOrEmpty(answer)) return;

            string connectionString = WebConfigurationManager.ConnectionStrings["Survey"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO Feedback_Responses 
                            (UID, FQID, Answer)
                            VALUES 
                            (@UID, @FQID, @Answer)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UID", uid);
                    command.Parameters.AddWithValue("@FQID", fqid);
                    command.Parameters.AddWithValue("@Answer", answer);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }
    }
}