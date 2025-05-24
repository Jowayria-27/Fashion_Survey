using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;

namespace Gamified_Survey__Graduation_Project
{
    public partial class Survey : System.Web.UI.Page
    {
        // State properties using ViewState
        private int currentQuestion
        {
            get => ViewState["CurrentQuestion"] != null ? (int)ViewState["CurrentQuestion"] : 1;
            set => ViewState["CurrentQuestion"] = value;
        }

        public int currentPanelnum
        {
            get => ViewState["CurrentPanelnum"] != null ? (int)ViewState["CurrentPanelnum"] : 1;
            set => ViewState["CurrentPanelnum"] = value;
        }

        public int points
        {
            get => Session["Points"] != null ? (int)Session["Points"] : 0;
            set => Session["Points"] = value;
        }
        private int userId
        {
            get => Session["UserId"] != null ? (int)Session["UserId"] : 0;
            set => Session["UserId"] = value;
        }

        private const int totalQuestions = 20; // Actual questions (excluding congratulatory panels)
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitializeSurvey();
            }
        }

        private void InitializeSurvey()
        {
            if (Session["Username"] != null)
            {
                username.InnerText = Session["Username"].ToString(); 
                if (Session["SelectedAvatar"] != null)
                {
                    userAvatar.ImageUrl = Session["SelectedAvatar"].ToString();
                }

                if (Session["UserId"] != null && int.TryParse(Session["UserId"].ToString(), out int result))
                {
                    userId = result;
                }
                lblThankYouName.Text = Session["Username"].ToString();
                Literal1.Text = Session["Username"].ToString();
                UsernamePlaceholder14.Text =Session["Username"].ToString();

                ShowQuestion(1);
            }
            else
            {
                username.InnerText = "Jowayria Khaled";
            }
        }

        private void ShowQuestion(int questionNumber)
        {
            // Hide all question panels
            for (int i = 1; i <= 20; i++)
            {
                var panel = FindControl("quest" + i) as Panel;
                if (panel != null) panel.Visible = false;
            }

            // Show the requested question
            var currentPanel = FindControl("quest" + questionNumber) as Panel;
            if (currentPanel != null) currentPanel.Visible = true;

            UpdateProgress(questionNumber);
            
        }

        private void UpdateProgress(int questionNumber)
        {
            double progressPercent = (questionNumber / (double)totalQuestions) * 100;
            progress.Style["width"] = $"{progressPercent}%";
        }

        protected void NextButton_Click(object sender, EventArgs e)
        {
            // Save current question answer if it's not a badge panel (9 or 14)
            if (currentPanelnum != 9 && currentPanelnum != 14)
            {
                SaveAnswer(currentQuestion);
                currentQuestion++;
            }
           

            currentPanelnum++;
            ShowQuestion(currentPanelnum);
        }

        protected void PreviousButton_Click(object sender, EventArgs e)
        {
            if (currentPanelnum > 1)
            {
                currentPanelnum--;

                if (currentPanelnum != 9 && currentPanelnum != 14 && currentQuestion > 1)
                {
                    currentQuestion--;
                }

                ShowQuestion(currentPanelnum);
            }
        }

        // Handles the "Other" option selection for question 16
        protected void rblResponsibility_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlOtherReason.Visible = (RadioButtonList16.SelectedValue == "other");
        }

        private void SaveAnswer(int questionNumber)
        {
            // Check if question was already answered using the stored answers
            if (IsQuestionAnswered(questionNumber))
            {
                return; // Exit if already answered
            }

            string answer = string.Empty;
            int pointsEarned = 0;

            // Handle different question types
            switch (questionNumber)
            {
                case 16:
                    answer = RadioButtonList16.SelectedValue;
                    if (answer == "other" && !string.IsNullOrEmpty(txtOtherReason.Text))
                    {
                        answer = txtOtherReason.Text;
                    }
                    pointsEarned = 10;
                    break;

                case 17:
                    var txtBox = FindControl("txtQuestion17") as TextBox;
                    answer = txtBox?.Text;

                    if (!string.IsNullOrEmpty(answer))
                    {
                        pointsEarned = 10;
                        int wordCount = answer.Split(new[] { ' ', '.', ',', '!', '?', ';', ':', '\t', '\n', '\r' },
                           StringSplitOptions.RemoveEmptyEntries).Length;
                        pointsEarned += wordCount * 10;
                    }
                    break;

                default:
                    var rbl = FindControl("RadioButtonList" + questionNumber) as RadioButtonList;
                    answer = rbl?.SelectedValue;
                    pointsEarned = 10;
                    break;
            }

            if (!string.IsNullOrEmpty(answer))
            {
                points += pointsEarned;
                userPoints.InnerText = points.ToString();
                StoreAnswer(questionNumber, answer); // Store the answer in session
                SaveAnswerToDatabase(questionNumber, answer); // Save to database
            }
        }

        private void SaveAnswerToDatabase(int questionNumber, string answer)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Survey"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Get the current user's UID (you'll need to implement this)
                int userId = GetCurrentUserId();

                if (userId == 0)
                {
                    // Handle error - user not found
                    return;
                }

                // Check if this is a survey question or feedback question
                if (questionNumber <= 17) // Survey questions
                {
                    string query = "INSERT INTO Survey_Responses (Answer, UID, QID) VALUES (@Answer, @UID, @QID)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Answer", answer);
                        command.Parameters.AddWithValue("@UID", userId);
                        command.Parameters.AddWithValue("@QID", questionNumber);
                        command.ExecuteNonQuery();
                    }
                }
                else // Feedback questions (assuming QID > 17 are feedback questions)
                {
                    string query = "INSERT INTO Feedback_Responses (Answer, UID, FQID) VALUES (@Answer, @UID, @FQID)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Answer", answer);
                        command.Parameters.AddWithValue("@UID", userId);
                        command.Parameters.AddWithValue("@FQID", questionNumber);
                        command.ExecuteNonQuery();
                    }
                }
            }
        }

        private int GetCurrentUserId()
        {
            // Implement logic to get the current user's ID
            // This might come from session, authentication, or other context

            if (Session["UserId"] != null)
            {
                return Convert.ToInt32(Session["UserId"]);
            }

            // Alternatively, you might need to look it up based on name or other identifier
            return 0;
        }

        private bool IsQuestionAnswered(int questionNumber)
        {
            if (Session["SurveyAnswers"] == null)
                return false;

            var answers = (Dictionary<int, string>)Session["SurveyAnswers"];
            return answers.ContainsKey(questionNumber);
        }

        private void StoreAnswer(int questionNumber, string answer)
        {
            // Initialize if doesn't exist
            if (Session["SurveyAnswers"] == null)
            {
                Session["SurveyAnswers"] = new Dictionary<int, string>();
            }

            var answers = (Dictionary<int, string>)Session["SurveyAnswers"];

            // Only store if not already answered (prevent overwrites)
            if (!answers.ContainsKey(questionNumber))
            {
                answers[questionNumber] = answer;
            }
        }

        protected void btnPostSurvey_Click(object sender, EventArgs e)
        {
            // You can add any final processing here if needed
            Response.Redirect("post.aspx");

        }

    }
}