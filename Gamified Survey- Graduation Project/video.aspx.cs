using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gamified_Survey__Graduation_Project
{
    public partial class video : System.Web.UI.Page
    {
        public string AvatarImage { get; set; }
        public string GreetingMessage { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the avatar and username are stored in the session
            if (Session["SelectedAvatar"] != null)
            {
                AvatarImage = "<img src='" + Session["SelectedAvatar"].ToString() + "' alt='Selected Avatar' class='avatar' />";
            }
            else
            {
                AvatarImage = "<p>No avatar selected.</p>";
            }

            if (Session["Username"] != null)
            {
                GreetingMessage = "Hi, " + Session["Username"].ToString();
            }
            else
            {
                GreetingMessage = "Hello, Guest!";
            }
            if (IsPostBack && Request.Form["video"] == "true")
            {
                Session["Points"] = 50;

            }
        }
    }
}