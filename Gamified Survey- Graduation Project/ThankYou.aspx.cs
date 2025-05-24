using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gamified_Survey__Graduation_Project
{
    public partial class ThankYou : System.Web.UI.Page
    {
        public string AvatarImage { get; set; }
        public string GreetingMessage { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
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
                GreetingMessage = "Goodbye, " + Session["Username"].ToString();
            }
            else
            {
                GreetingMessage = "Hello, Guest!";
            }
            if (Session["Points"] != null)
            {
                Points.Text = Session["Points"].ToString();
            }
            else
            {
                Points.Text = "0";
            }
        }
    }
}