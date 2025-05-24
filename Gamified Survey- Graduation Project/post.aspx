<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="post.aspx.cs" Inherits="Gamified_Survey__Graduation_Project.post" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Survey User Experience</title>
   <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('chic.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            color: black;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.8); /* White background with opacity */
            padding: 20px;
            border-radius: 10px;
            margin: 20px;
        }

        .header {
            color: #000;
            text-align: center;
        }
        h1 {
            color: #ff80bf; /* Pink color */
            text-align: center; /* Center align the text */
        }

        h2 {
            color: #ff80bf;
        }

        p {
            color: #666;
        }

        fieldset {
            border: none;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="submit"] {
            background-color: #ff80bf; /* Pink color */
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            cursor: pointer;
            border: none;
        }

            input[type="submit"]:hover {
                background-color: #ff66a3;
            }

        .checkbox-options {
            margin-left: 20px;
        }
       </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Post Questionnaire <br /> Please rate each statement based on your experience, using the scale provided:</h2>
            
            <fieldset>
                <legend>1. I found the system easy to use.</legend>
                <div class="radio-options">
                    <asp:RadioButtonList ID="question1" runat="server" required="true">
                           <asp:ListItem Text="Strongly Agree" Value="Strongly Agree"></asp:ListItem>
                         <asp:ListItem Text="Agree" Value="Agree"></asp:ListItem>
                        <asp:ListItem Text="Neutral" Value="Neutral"></asp:ListItem> 
                        <asp:ListItem Text="Disagree" Value="Disagree"></asp:ListItem>
                         <asp:ListItem Text="Strongly Disagree" Value="Strongly Disagree"></asp:ListItem>
                       
                     
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="rfvQuestion1" runat="server" 
    ControlToValidate="question1"
    ErrorMessage="Please select an option"
    Display="Dynamic"
    ForeColor="Red">
</asp:RequiredFieldValidator>
                </div>
            </fieldset>

            <fieldset>
                <legend>2. The various functions in this system were well integrated.</legend>
                <div class="radio-options">
                    <asp:RadioButtonList ID="question2" runat="server" required="true">
                        <asp:ListItem Text="Strongly Agree" Value="Strongly Agree"></asp:ListItem>
                        <asp:ListItem Text="Agree" Value="Agree"></asp:ListItem>
                        <asp:ListItem Text="Neutral" Value="Neutral"></asp:ListItem>
                        <asp:ListItem Text="Disgree" Value="Disgree"></asp:ListItem>
                        <asp:ListItem Text="Strongly Disagree" Value="Strongly Disgree"></asp:ListItem>
                    </asp:RadioButtonList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
    ControlToValidate="question2"
    ErrorMessage="Please select an option"
    Display="Dynamic"
    ForeColor="Red">
</asp:RequiredFieldValidator>
                </div>
            </fieldset>

            <fieldset>
                <legend>3. I felt confident using the system.</legend>
                <div class="radio-options">
                    <asp:RadioButtonList ID="question3" runat="server" required="true">
                       <asp:ListItem Text="Strongly Agree" Value="Strongly Agree"></asp:ListItem>
                        <asp:ListItem Text="Agree" Value="Agree"></asp:ListItem>
                        <asp:ListItem Text="Neutral" Value="Neutral"></asp:ListItem>
                        <asp:ListItem Text="Disgree" Value="Disgree"></asp:ListItem>
                        <asp:ListItem Text="Strongly Disagree" Value="Strongly Disgree"></asp:ListItem>
                    </asp:RadioButtonList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
    ControlToValidate="question3"
    ErrorMessage="Please select an option"
    Display="Dynamic"
    ForeColor="Red">
</asp:RequiredFieldValidator>
                </div>
            </fieldset>

            <fieldset>
                <legend>4. Did you find the survey helpful in increasing your understanding of the topic?</legend>
                <div class="radio-options">
                    <asp:RadioButtonList ID="question4" runat="server" required="true">
                        <asp:ListItem Text="Extremely Helpful" Value="Extremely Helpful"></asp:ListItem>
                        <asp:ListItem Text="Very Helpful" Value="Very Helpful"></asp:ListItem>
                        <asp:ListItem Text="Moderately Helpful" Value="Moderately Helpful"></asp:ListItem>
                       <asp:ListItem Text="Slightly Helpful" Value="Slightly Helpful"></asp:ListItem>
                          <asp:ListItem Text="Not Helpful" Value="Not Helpful"></asp:ListItem>
                    </asp:RadioButtonList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
    ControlToValidate="question4"
    ErrorMessage="Please select an option"
    Display="Dynamic"
    ForeColor="Red">
</asp:RequiredFieldValidator>
                </div>
            </fieldset>

            <fieldset>
                <legend>5. I was encouraged to complete that survey because:</legend>
                <div class="radio-options">
                    <asp:RadioButtonList ID="question5" runat="server" required="true">
                        <asp:ListItem Text="The survey effectively made me think about fast fashion." Value="The survey effectively made me think about fast fashion."></asp:ListItem>
                        <asp:ListItem Text="It was easy for me to answer and finish the survey questions." Value="It was easy for me to answer and finish the survey questions."></asp:ListItem>
                        <asp:ListItem Text="People I know were interested in or sent me that survey." Value="People I know were interested in or sent me that survey."></asp:ListItem>
                        <asp:ListItem Text="The survey was interesting, and I enjoyed answering it." Value="The survey was interesting, and I enjoyed answering it."></asp:ListItem>
                    </asp:RadioButtonList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
    ControlToValidate="question5"
    ErrorMessage="Please select an option"
    Display="Dynamic"
    ForeColor="Red">
</asp:RequiredFieldValidator>
                </div>
            </fieldset>

            <fieldset>
                <legend>6. It was fun to answer the survey</legend>
                <div class="radio-options">
                    <asp:RadioButtonList ID="question6" runat="server" required="true">
                      <asp:ListItem Text="Strongly Agree" Value="Strongly Agree"></asp:ListItem>
                        <asp:ListItem Text="Agree" Value="Agree"></asp:ListItem>
                        <asp:ListItem Text="Neutral" Value="Neutral"></asp:ListItem>
                        <asp:ListItem Text="Disgree" Value="Disgree"></asp:ListItem>
                        <asp:ListItem Text="Strongly Disagree" Value="Strongly Disgree"></asp:ListItem>
                    </asp:RadioButtonList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
    ControlToValidate="question6"
    ErrorMessage="Please select an option"
    Display="Dynamic"
    ForeColor="Red">
</asp:RequiredFieldValidator>
                </div>
            </fieldset>

            <fieldset>
                <legend>7. I would recommend that survey to others</legend>
                <div class="radio-options">
                    <asp:RadioButtonList ID="question7" runat="server" required="true">
                      <asp:ListItem Text="Strongly Agree" Value="Strongly Agree"></asp:ListItem>
                        <asp:ListItem Text="Agree" Value="Agree"></asp:ListItem>
                        <asp:ListItem Text="Neutral" Value="Neutral"></asp:ListItem>
                        <asp:ListItem Text="Disgree" Value="Disgree"></asp:ListItem>
                        <asp:ListItem Text="Strongly Disagree" Value="Strongly Disgree"></asp:ListItem>
                    </asp:RadioButtonList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
    ControlToValidate="question7"
    ErrorMessage="Please select an option"
    Display="Dynamic"
    ForeColor="Red">
</asp:RequiredFieldValidator>
                </div>
            </fieldset>

            <fieldset>
                <legend>8. The time I spent answering this survey just slipped away.</legend>
                <div class="radio-options">
                    <asp:RadioButtonList ID="question8" runat="server" required="true">
                      <asp:ListItem Text="Strongly Agree" Value="Strongly Agree"></asp:ListItem>
                        <asp:ListItem Text="Agree" Value="Agree"></asp:ListItem>
                        <asp:ListItem Text="Neutral" Value="Neutral"></asp:ListItem>
                        <asp:ListItem Text="Disgree" Value="Disgree"></asp:ListItem>
                        <asp:ListItem Text="Strongly Disagree" Value="Strongly Disgree"></asp:ListItem>
                    </asp:RadioButtonList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
    ControlToValidate="question8"
    ErrorMessage="Please select an option"
    Display="Dynamic"
    ForeColor="Red">
</asp:RequiredFieldValidator>
                </div>
            </fieldset>

            <fieldset>
                <legend>9. I was absorbed in this experience</legend>
                <div class="radio-options">
                    <asp:RadioButtonList ID="question9" runat="server" required="true">
                       <asp:ListItem Text="Strongly Agree" Value="Strongly Agree"></asp:ListItem>
                        <asp:ListItem Text="Agree" Value="Agree"></asp:ListItem>
                        <asp:ListItem Text="Neutral" Value="Neutral"></asp:ListItem>
                        <asp:ListItem Text="Disgree" Value="Disgree"></asp:ListItem>
                        <asp:ListItem Text="Strongly Disagree" Value="Strongly Disgree"></asp:ListItem>
                    </asp:RadioButtonList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
    ControlToValidate="question9"
    ErrorMessage="Please select an option"
    Display="Dynamic"
    ForeColor="Red">
</asp:RequiredFieldValidator>
                </div>
            </fieldset>

            <fieldset>
                <legend>10. This survey was aesthetically appealing</legend>
                <div class="radio-options">
                    <asp:RadioButtonList ID="question10" runat="server" required="true">
                        <asp:ListItem Text="Strongly Agree" Value="Strongly Agree"></asp:ListItem>
                        <asp:ListItem Text="Agree" Value="Agree"></asp:ListItem>
                        <asp:ListItem Text="Neutral" Value="Neutral"></asp:ListItem>
                        <asp:ListItem Text="Disgree" Value="Disgree"></asp:ListItem>
                        <asp:ListItem Text="Strongly Disagree" Value="Strongly Disgree"></asp:ListItem>
                    </asp:RadioButtonList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
    ControlToValidate="question10"
    ErrorMessage="Please select an option"
    Display="Dynamic"
    ForeColor="Red">
</asp:RequiredFieldValidator>
                </div>
            </fieldset>

             <fieldset>
                <legend>11. If surveys that businesses/people send were as gamified, I would be more interested to answer them </legend>
                <div class="radio-options">
                      <asp:RadioButtonList ID="question11" runat="server" required="required">  
                        <asp:ListItem Text="I WOULD DEFINITELY BE MORE INTERESTED. In fact, I'd be searching for more gamified surveys like that" Value="Strongly Agree"></asp:ListItem>
                         <asp:ListItem Text="Well yeah, I was happier solving this one than the tradiitonal survey " Value="Agree"></asp:ListItem>
                         <asp:ListItem Text="Meh. Both are okay with me" Value="Neutral"></asp:ListItem>
                        <asp:ListItem Text="Not really. Both are okay with me but I'd prefer the traditional" Value="Disagree"></asp:ListItem>
                       <asp:ListItem Text="Defintely not. I am more used to traditional surveys such as Google Form. Not everything needs to be gamified" Value="Strongly Disagree"></asp:ListItem>
                      
                    </asp:RadioButtonList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
    ControlToValidate="question11"
    ErrorMessage="Please select an option"
    Display="Dynamic"
    ForeColor="Red">
</asp:RequiredFieldValidator>
                </div>
            </fieldset>

            <fieldset>
                <legend>12. Please share any additional comments or feedback about your experience with the survey in the text box below. Your input is valuable to us. How can we improve this survey?</legend>
                <asp:TextBox ID="question12" runat="server" TextMode="MultiLine" Rows="4" Columns="50" style="width:100%;"></asp:TextBox>
            </fieldset>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            
            <p>Thank you for your participation and valuable feedback! Your input will help us enhance our survey for future participants.</p>
        </div>
    </form>
</body>
</html>