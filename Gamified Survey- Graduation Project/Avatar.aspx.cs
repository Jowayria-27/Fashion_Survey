using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gamified_Survey__Graduation_Project
{
    public partial class Avatar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
    
        }

        protected void SelectAvatar(object sender, EventArgs e)
        {
            // Get the CommandArgument (which is the avatar image name)
            string selectedAvatar = (sender as ImageButton).CommandArgument;

            // Save the selected avatar to session or another method
            Session["SelectedAvatar"] = selectedAvatar;

            // Remove "selected" class from all avatars on the client side
            foreach (Control control in form1.Controls)
            {
                if (control is ImageButton imgBtn)
                {
                    imgBtn.CssClass = "avatar"; // Reset the avatar's CSS class
                }
            }

            // Add the "selected" class to the clicked avatar
            var clickedAvatar = sender as ImageButton;
            clickedAvatar.CssClass += " selected";

            // Enable the "Next" button after avatar selection
            nextButton.Enabled = true;
        }

        protected void ProceedToSurvey(object sender, EventArgs e)
        {
            // Get the selected avatar
            var selectedAvatar = Session["SelectedAvatar"] as string;

            if (string.IsNullOrEmpty(selectedAvatar))
            {
                Response.Write("<script>alert('Please select an avatar before proceeding.');</script>");
            }
            else
            {
                // Redirect to the next page (e.g., the survey page)
                Response.Redirect("video.aspx");
            }
        }
    }
}