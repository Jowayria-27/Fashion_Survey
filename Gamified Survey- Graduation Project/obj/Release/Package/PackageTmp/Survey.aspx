<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Survey.aspx.cs" Inherits="Gamified_Survey__Graduation_Project.Survey" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fast Fashion Survey</title>

    <style>
        html, body {
    height: 100%;
    margin: 0;
    padding: 0;
}
        body {
            font-family: Arial, sans-serif;
            background-image: url('chic2.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            position: relative; /* Ensure body serves as positioning reference for absolute elements */
        }

        .overlay {
            background-color: rgba(255, 255, 255, 0.7);
            padding: 20px;
            margin-top:80px;
        }

        .header h1 {
            color: #ff80bf;
            text-align: center; /* Center the text */
            margin-top: 50px; /* Add some top margin for spacing */
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position:center;
            margin-top:60px;
        }

        h1 {
            color: #ff80bf;
        }

        p {
            color: #666;
            font-style:italic;
        }

.avatar-container {
    position: absolute;
    top: 25px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    flex-direction: column;
    align-items: center;
    width: auto;
}

/* Avatar image */
.avatar {
    width: 50px;
    height: 50px;
    border-radius: 50%;
}

/* Name below avatar */
.name {
    margin-top: 5px;
    color: lightpink;
    font-weight: bold;
    text-align: center;
}

/* Points - positioned left */
.points-container {
    position: absolute;
    top: 30px;
    left: 20px;
    display: flex;
    align-items: center;
}

.star-icon {
    width: 45px;
    height: 45px;
    margin-right: 5px;
    margin-top:5px;
}

.points {
    color: #000;
    font-weight: bold;
    top:20px;
}

/* Badges - positioned right */
.badges-container {
    position: absolute;
    top: 20px;
    right: 20px;
    display: flex;
    gap: 10px; /* Space between badges */
}

.badge-container, .badge2-container, .badge3-container {
    width: 60px;
    height: 60px;
}

.badge-container img, .badge2-container img, badge3-container img {
    width: 100%;
    height: 100%;
    border-radius: 50%;
}
        .button {
            display: inline-block;
            background-color: #ff80bf;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }

        .button:hover {
            background-color: #ff66a3;
        }



        /* Progress bar styles */
        .progress-bar {
            background-color: #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .progress {
            background-color: #ff80bf;
            height: 20px;
            border-radius: 5px;
            width: 0;
            transition: width 0.3s ease;
        }
        .points-gain {
    animation: pulse 0.3s;
    color: #2ecc71; /* Green color for positive feedback */
    font-weight: bold;
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.1); }
    100% { transform: scale(1); }
}

.navigation-buttons {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
    width: 100%;
    max-width: 800px; /* Match your container width */
    margin-left: auto;
    margin-right: auto;
}

.previous-button {
    margin-right: auto; /* Pushes to the left */
}

.next-button {
    margin-left: auto; /* Pushes to the right */
}


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Progress bar -->
        <div class="progress-bar">
            <div class="progress" id="progress" runat="server" style="width: 0;"></div>
        </div>

       <div class="points-container">
    <img src="star.png" alt="Star" class="star-icon" />
    <div class="points" id="userPoints" runat="server">0</div>
</div>

<!-- Avatar and name in center -->
<div class="avatar-container">
    <asp:Image ID="userAvatar" runat="server" CssClass="avatar" />
    <div class="name" id="username" runat="server"></div>
</div>


        <!-- Survey questions using ASP.NET panels -->
        <asp:Panel ID="quest1" runat="server" CssClass="overlay">
            <div class="container">
                <h2>Question 1: I am confident in knowing the definition of 'fast fashion'.</h2>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem Value="agree">Agree</asp:ListItem>
                    <asp:ListItem Value="strongly_agree">Strongly Agree</asp:ListItem>
                    <asp:ListItem Value="disagree">Disagree</asp:ListItem>
                    <asp:ListItem Value="strongly_disagree">Strongly Disagree</asp:ListItem>
                </asp:RadioButtonList>
                  <div class="navigation-buttons">
    <asp:Button ID="Button2" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
            </div>
        </asp:Panel>

    <!-- Second question (hidden initially) -->
 <asp:Panel ID="quest2" runat="server" CssClass="overlay" Visible="false">
        <div class="container">
            <h2>
                Question 2: Fast fashion brands (i.e. Bershka, Shein, Zara, Pull and bear) have influenced the contents of my wardrobe
            </h2>
             <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                    <asp:ListItem Value="agree">Agree</asp:ListItem>
                    <asp:ListItem Value="strongly_agree">Strongly Agree</asp:ListItem>
                    <asp:ListItem Value="disagree">Disagree</asp:ListItem>
                    <asp:ListItem Value="strongly_disagree">Strongly Disagree</asp:ListItem>
                </asp:RadioButtonList>
           <div class="navigation-buttons">
    <asp:Button ID="btnPrevious2" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="BtnNext2" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
      
   </div>
        </asp:Panel>

    <!-- Third question (hidden initially) -->
    <asp:Panel ID="quest3" runat="server" CssClass="overlay" Visible="false">
        <div class="container">
            <h2>Question 3: It is generally difficult to find information about a product's ethicality.</h2>
            <p> (whether this product is made in companies that support worker's fair pay/safety, and the environment)</p>
            <asp:RadioButtonList ID="RadioButtonList3" runat="server">
               <asp:ListItem Value="agree">Agree</asp:ListItem>
                    <asp:ListItem Value="strongly_agree">Strongly Agree</asp:ListItem>
                    <asp:ListItem Value="disagree">Disagree</asp:ListItem>
                    <asp:ListItem Value="strongly_disagree">Strongly Disagree</asp:ListItem>
                </asp:RadioButtonList>
               <div class="navigation-buttons">
    <asp:Button ID="Button3" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button17" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
      
   </div>
        </asp:Panel>

    <!-- Fourth question (hidden initially) -->
   <asp:Panel ID="quest4" runat="server" CssClass="overlay" Visible="false">
        <div class="container">
            <h2>Question 4: I feel pressured to be ethical/environmental.</h2>
             <asp:RadioButtonList ID="RadioButtonList4" runat="server">
               <asp:ListItem Value="agree">Agree</asp:ListItem>
                    <asp:ListItem Value="strongly_agree">Strongly Agree</asp:ListItem>
                    <asp:ListItem Value="disagree">Disagree</asp:ListItem>
                    <asp:ListItem Value="strongly_disagree">Strongly Disagree</asp:ListItem>
                </asp:RadioButtonList>
               <div class="navigation-buttons">
    <asp:Button ID="Button4" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button18" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
      
   </div>
        </asp:Panel>

    <!-- Fifth question (hidden initially) -->
   <asp:Panel ID="quest5" runat="server" CssClass="overlay" Visible="false">
        <div class="container">
            <h2>Question 5: Fast fashion clothing quality is generally inadequate.</h2>
            <p>(The quality of clothes is low in quality compared to small businesses/local brands). </p>
            <asp:RadioButtonList ID="RadioButtonList5" runat="server">
               <asp:ListItem Value="agree">Agree</asp:ListItem>
                    <asp:ListItem Value="strongly_agree">Strongly Agree</asp:ListItem>
                    <asp:ListItem Value="disagree">Disagree</asp:ListItem>
                    <asp:ListItem Value="strongly_disagree">Strongly Disagree</asp:ListItem>
                </asp:RadioButtonList>
              <div class="navigation-buttons">
    <asp:Button ID="Button5" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button19" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
            
      
   </div>
        </asp:Panel>

    <!-- Sixth question (hidden initially) -->
   <asp:Panel ID="quest6" runat="server" CssClass="overlay" Visible="false">
        <div class="container">
            <h2>
                Question 6: I would recommend fast fashion brands (i.e. Bershka, Shein,  Zara, Pull and bear) to others
            </h2>
             <asp:RadioButtonList ID="RadioButtonList6" runat="server">
               <asp:ListItem Value="agree">Agree</asp:ListItem>
                    <asp:ListItem Value="strongly_agree">Strongly Agree</asp:ListItem>
                    <asp:ListItem Value="disagree">Disagree</asp:ListItem>
                    <asp:ListItem Value="strongly_disagree">Strongly Disagree</asp:ListItem>
                </asp:RadioButtonList>
                    <div class="navigation-buttons">
    <asp:Button ID="Button6" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button20" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
      
   </div>
        </asp:Panel>

    <!-- Seventh question (hidden initially) -->
   <asp:Panel ID="quest7" runat="server" CssClass="overlay" Visible="false">
        <div class="container">
            <h2>Question 7: It's not a big deal if I purchase clothes I don't really need just because they're on sale.</h2>
            <asp:RadioButtonList ID="RadioButtonList7" runat="server">
               <asp:ListItem Value="agree">Agree</asp:ListItem>
                    <asp:ListItem Value="strongly_agree">Strongly Agree</asp:ListItem>
                    <asp:ListItem Value="disagree">Disagree</asp:ListItem>
                    <asp:ListItem Value="strongly_disagree">Strongly Disagree</asp:ListItem>
                </asp:RadioButtonList>
                  <div class="navigation-buttons">
    <asp:Button ID="Button7" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button21" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
            
      
   </div>
        </asp:Panel>


    <!-- Eighth question (hidden initially) -->
 <asp:Panel ID="quest8" runat="server" CssClass="overlay" Visible="false">
        <div class="container">
            <h2>Question 8: It is too expensive to buy ethically.</h2>
            <p>(Buying from small/local businesses that does not mass produce)</p>
               <asp:RadioButtonList ID="RadioButtonList8" runat="server">
               <asp:ListItem Value="agree">Agree</asp:ListItem>
                    <asp:ListItem Value="strongly_agree">Strongly Agree</asp:ListItem>
                    <asp:ListItem Value="disagree">Disagree</asp:ListItem>
                    <asp:ListItem Value="strongly_disagree">Strongly Disagree</asp:ListItem>
                </asp:RadioButtonList>
               <div class="navigation-buttons">
    <asp:Button ID="Button8" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button22" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
           
      
   </div>
        </asp:Panel>


   <asp:Panel ID="quest9" runat="server" CssClass="overlay" Visible="false">
    <div class="container">
        <!-- Updated congratulatory message with username -->
        <h2 id="H1" runat="server">
            Congratulations, <asp:Literal ID="Literal1" runat="server" />! You're halfway there!
        </h2>

        <!-- Adjusted badge size and centered it -->
        <div style="text-align: center;">
            <asp:Image ID="badgeImage" runat="server" ImageUrl="badge.png" Width="60px" Height="60px" AlternateText="Badge" />
        </div>

        <!-- Next and Previous Buttons -->
          <div class="navigation-buttons">
    <asp:Button ID="Button23" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button24" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
        
    </div>
</asp:Panel>


    <!-- 9th question (hidden initially) -->
   <asp:Panel ID="quest10" runat="server" CssClass="overlay" Visible="false">
        <div class="container">
            <div class="badges-container">
    <div class="badge-container">
        <img src="badge.png" alt="Badge 1" />
    </div>
                </div>
            <h2>
                Question 9: I am happy to pay for delivery fees on online orders
            </h2>
            <asp:RadioButtonList ID="RadioButtonList9" runat="server">
               <asp:ListItem Value="agree">Agree</asp:ListItem>
                    <asp:ListItem Value="strongly_agree">Strongly Agree</asp:ListItem>
                    <asp:ListItem Value="disagree">Disagree</asp:ListItem>
                    <asp:ListItem Value="strongly_disagree">Strongly Disagree</asp:ListItem>
                </asp:RadioButtonList>
                <div class="navigation-buttons">
    <asp:Button ID="Button9" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button25" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
      
   </div>
        </asp:Panel>

    <!-- 10th question (hidden initially) -->
  <asp:Panel ID="quest11" runat="server" CssClass="overlay" Visible="false">
        <div class="container">
            <div class="badges-container">
    <div class="badge-container">
        <img src="badge.png" alt="Badge 1" />
    </div>
                </div>
            <h2>
                Question 10: Realistically, I am willing to change my consumer habits to be ethical (paying more for environmentally-friendly products, shopping less)
            </h2>
             <asp:RadioButtonList ID="RadioButtonList10" runat="server">
               <asp:ListItem Value="agree">Agree</asp:ListItem>
                    <asp:ListItem Value="strongly_agree">Strongly Agree</asp:ListItem>
                    <asp:ListItem Value="disagree">Disagree</asp:ListItem>
                    <asp:ListItem Value="strongly_disagree">Strongly Disagree</asp:ListItem>
                </asp:RadioButtonList>
                  <div class="navigation-buttons">
    <asp:Button ID="Button10" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button26" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
      
   </div>
        </asp:Panel>

    <!-- 11th question (hidden initially) -->
   <asp:Panel ID="quest12" runat="server" CssClass="overlay" Visible="false">
        <div class="container">
            <div class="badges-container">
    <div class="badge-container">
        <img src="badge.png" alt="Badge 1" />
    </div>
                </div>
            <h2>
                Question 11: Realistically, I am willing to change my cleaning habits to be more ethical (amount of times clothing is washed through its life-cycle)
            </h2>
              <asp:RadioButtonList ID="RadioButtonList11" runat="server">
               <asp:ListItem Value="agree">Agree</asp:ListItem>
                    <asp:ListItem Value="strongly_agree">Strongly Agree</asp:ListItem>
                    <asp:ListItem Value="disagree">Disagree</asp:ListItem>
                    <asp:ListItem Value="strongly_disagree">Strongly Disagree</asp:ListItem>
                </asp:RadioButtonList>
                  <div class="navigation-buttons">
    <asp:Button ID="Button11" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button27" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
      
   </div>
        </asp:Panel>

    <!-- 12th question (hidden initially) -->
   <asp:Panel ID="quest13" runat="server" CssClass="overlay" Visible="false">
        <div class="container">
            <div class="badges-container">
    <div class="badge-container">
        <img src="badge.png" alt="Badge 1" />
    </div>
                </div>
            
                <h2>
                    Question 12: Companies using unsustainable production methods should be taxed by the government
                </h2>
            <p>(production methods that does not put into account the damage done on the environment)</p>
              <asp:RadioButtonList ID="RadioButtonList12" runat="server">
               <asp:ListItem Value="agree">Agree</asp:ListItem>
                    <asp:ListItem Value="strongly_agree">Strongly Agree</asp:ListItem>
                    <asp:ListItem Value="disagree">Disagree</asp:ListItem>
                    <asp:ListItem Value="strongly_disagree">Strongly Disagree</asp:ListItem>
                </asp:RadioButtonList>
                 <div class="navigation-buttons">
    <asp:Button ID="Button12" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button28" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
      
   </div>
        </asp:Panel>



    <asp:Panel ID="quest14" runat="server" CssClass="overlay" Visible="false">
       
    <div class="container">
          <div class="badges-container">
    <div class="badge-container">
        <img src="badge.png" alt="Badge 1" />
    </div>
    <div class="badge2-container">
        <img src="badge2.jpeg" alt="Badge 2" />
    </div>
</div>
        <!-- Badge container (top) -->
        

        <!-- Congratulatory message with dynamic username -->
        <h2 id="congratsMessage" runat="server">
            Congratulations, <asp:Literal ID="UsernamePlaceholder14" runat="server" />! You're almost done!
        </h2>

        <!-- Centered badge below message -->
        <div style="text-align: center;">
            <asp:Image ID="badgeImage14" runat="server" ImageUrl="badge2.jpeg" Width="60px" Height="60px" AlternateText="Badge" />
        </div>

        <div class="navigation-buttons">
    <asp:Button ID="Button29" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button30" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
    </div>
</asp:Panel>





    <!-- Additional questions -->
   <asp:Panel ID="quest15" runat="server" CssClass="overlay" Visible="false">
        <div class="container">
            <div class="badges-container">
    <div class="badge-container">
        <img src="badge.png" alt="Badge 1" />
    </div>
    <div class="badge2-container">
        <img src="badge2.jpeg" alt="Badge 2" />
    </div>
</div>
            <h2>Question 13: I am loyal to a 'fast fashion' brand (i.e. Bershka, Shein, Zara, Pull and bear)</h2>
                <asp:RadioButtonList ID="RadioButtonList13" runat="server">
               <asp:ListItem Value="Definitely">Definitely, I visit/shop there 15-20 times per year</asp:ListItem>
                    <asp:ListItem Value="yes">Yes, I visit/shop there 7-10 times per year</asp:ListItem>
                    <asp:ListItem Value="partially">Partially, I visit/shop there seasonally (3-6 times per year)</asp:ListItem>
                    <asp:ListItem Value="no">No, I visit/shop there when I like</asp:ListItem>
                     <asp:ListItem Value="Definitely_not">Definitely not, I do not visit/shop at fast fashion brands at all/enough</asp:ListItem>
                </asp:RadioButtonList>
                <div class="navigation-buttons">
    <asp:Button ID="Button13" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button31" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
      
   </div>
        </asp:Panel>

  <asp:Panel ID="quest16" runat="server" CssClass="overlay" Visible="false">
        <div class="container">
            <div class="badges-container">
    <div class="badge-container">
        <img src="badge.png" alt="Badge 1" />
    </div>
    <div class="badge2-container">
        <img src="badge2.jpeg" alt="Badge 2" />
    </div>
</div>
            <h2>Question 14: Which factor is most influential in buying an item of clothing?</h2>
             <asp:RadioButtonList ID="RadioButtonList14" runat="server">
               <asp:ListItem Value="Quality">Quality</asp:ListItem>
                 <asp:ListItem Value="Price">Price</asp:ListItem>
                 <asp:ListItem Value="Ethicality">Ethicality</asp:ListItem>
                 <asp:ListItem Value="Brand">Brand</asp:ListItem>
                    <asp:ListItem Value="Style/Brand">Style/Brand</asp:ListItem>
                    <asp:ListItem Value="Identity_Building">Identity_Building</asp:ListItem>
                </asp:RadioButtonList>
                <div class="navigation-buttons">
    <asp:Button ID="Button14" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button32" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
      
   </div>
        </asp:Panel>
<asp:Panel ID="quest17" runat="server" CssClass="overlay" Visible="false">
        <div class="container">
           <div class="badges-container">
    <div class="badge-container">
        <img src="badge.png" alt="Badge 1" />
    </div>
    <div class="badge2-container">
        <img src="badge2.jpeg" alt="Badge 2" />
    </div>
</div>
            <h2>Question 15: Do you buy clothes more often online or in-store?</h2>
                  <asp:RadioButtonList ID="RadioButtonList15" runat="server">
               <asp:ListItem Value="Online">Online</asp:ListItem>
                    <asp:ListItem Value="In_Store">In store</asp:ListItem>
                </asp:RadioButtonList>
                <div class="navigation-buttons">
    <asp:Button ID="Button15" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button33" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
      
   </div>
        </asp:Panel>

 
    <asp:Panel ID="quest18" runat="server" CssClass="overlay" Visible="false">
    <div class="container">
       <div class="badges-container">
    <div class="badge-container">
        <img src="badge.png" alt="Badge 1" />
    </div>
    <div class="badge2-container">
        <img src="badge2.jpeg" alt="Badge 2" />
    </div>
</div>
        <h2>Question 16: Ultimately, who should be more ethically/environmentally responsible?</h2>
        
        <asp:RadioButtonList ID="RadioButtonList16" runat="server" AutoPostBack="true" 
            OnSelectedIndexChanged="rblResponsibility_SelectedIndexChanged">
            <asp:ListItem Value="consumer" Text="The consumer"></asp:ListItem>
            <asp:ListItem Value="public_authorities" Text="Public authorities/companies"></asp:ListItem>
            <asp:ListItem Value="other" Text="Other"></asp:ListItem>
        </asp:RadioButtonList>
        
        <asp:Panel ID="pnlOtherReason" runat="server" Visible="false">
            <asp:TextBox ID="txtOtherReason" runat="server" TextMode="MultiLine" 
                Rows="4" Columns="50" placeholder="Enter other reason here..."></asp:TextBox>
        </asp:Panel>
        
         <div class="navigation-buttons">
    <asp:Button ID="Button16" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button34" runat="server" Text="Next" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
    </div>
</asp:Panel>

    <asp:Panel ID="quest19" runat="server" CssClass="overlay" Visible="false">
            <div class="container">
                <div class="badges-container">
    <div class="badge-container">
        <img src="badge.png" alt="Badge 1" />
    </div>
    <div class="badge2-container">
        <img src="badge2.jpeg" alt="Badge 2" />
    </div>
</div>
                <h2>Question 17: What do you believe is the most effective approach to reduce the environmental impact of fast fashion?</h2>
                 <p>Hint: Magic happens when you start writing!!</p>
                <br />
                <asp:TextBox ID="txtQuestion17" runat="server" TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox>
                  <div class="navigation-buttons">
    <asp:Button ID="Button35" runat="server" Text="Previous" CssClass="button previous-button" OnClick="PreviousButton_Click" />
    <asp:Button ID="Button36" runat="server" Text="Submit Survey" CssClass="button next-button" OnClick="NextButton_Click" />
</div>
            </div>
        </asp:Panel>

        <!-- Thank you panel -->
        <asp:Panel ID="quest20" runat="server" CssClass="overlay" Visible="false">
            <div class="container">
                   <div class="badges-container">
    <div class="badge-container">
        <img src="badge.png" alt="Badge 1" />
    </div>
    <div class="badge2-container">
        <img src="badge2.jpeg" alt="Badge 2" />
    </div>
        <div class="badge2-container">
        <img src="badge3.png" alt="Badge 3" />
    </div>
</div>
                <h2>Thank You for Completing the Survey!</h2>
                <p>Thank you, <asp:Label ID="lblThankYouName" runat="server"></asp:Label>, for participating!</p>
                <asp:Button ID="btnPostSurvey" runat="server" Text="Go to Post Survey Page" 
                   CssClass="button" OnClick="btnPostSurvey_Click" />
            </div>
        </asp:Panel>
    </form>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Initialize sound effect
            const pointSound = new Audio('https://assets.mixkit.co/sfx/preview/mixkit-achievement-bell-600.mp3');
            pointSound.volume = 0.3;

            // Get DOM elements
            const textBox = document.getElementById('<%= txtQuestion17.ClientID %>');
        const pointsDisplay = document.getElementById('<%= userPoints.ClientID %>');
        const basePoints = <%= points %>;

        textBox.addEventListener('input', function () {
            const previousPoints = parseInt(pointsDisplay.textContent) || basePoints;
            const answer = this.value.trim();
            let wordCount = 0;
            let calculatedPoints = basePoints;

            if (answer.length > 0) {
                // Count words (more robust method)
                wordCount = answer.split(/\s+/).filter(function (word) {
                    return word.length > 0;
                }).length;

                // Calculate points (10 base + 10 per word)
                calculatedPoints = basePoints + 10 + (wordCount * 10);
            }

            // Only trigger effects if points increased
            if (calculatedPoints > previousPoints) {
                // Play sound effect (with error handling)
                pointSound.currentTime = 0; // Rewind to start if already playing
                pointSound.play().catch(e => console.log("Sound play prevented:", e));

                // Add visual feedback
                pointsDisplay.classList.add('points-gain');
                setTimeout(() => pointsDisplay.classList.remove('points-gain'), 300);
            }

            // Update points display
            pointsDisplay.textContent = calculatedPoints;
        });
    });
    </script>

</body>

</html>






 