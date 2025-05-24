<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Gamified_Survey__Graduation_Project.WebForm1" %>

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
            
        }

        .header {
            color: #000;
            text-align: center;
        }

        .container {
            max-width: 700px;
            margin: 20px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #ff80bf;
        }

        p {
            color: white;
            position:center;
            font-weight:bold;
        }

        .button {
            display: inline-block;
            background-color: #ff80bf;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .button:hover {
            background-color: #ff66a3;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
        }

        .form-group select, .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server"> 
        <div class="header">
            <h1>Fast Fashion Survey</h1>
            <p>
                Answer the questions below to participate in our gamified survey about fast fashion!</p>
        </div>

        <div class="container">
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:Panel ID="SurveyPanel" runat="server">
                        <div class="form-group">
                            <label for="txtName">Name:</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="ddlAge">Age:</label>
                            <asp:DropDownList ID="ddlAge" runat="server" CssClass="form-control" required="true">
                                <asp:ListItem Value="">Select Age Bracket</asp:ListItem>
                                <asp:ListItem Value="11-15">11-15</asp:ListItem>
                                <asp:ListItem Value="16-20">16-20</asp:ListItem>
                                <asp:ListItem Value="21-30">21-30</asp:ListItem>
                                <asp:ListItem Value="31-40">31-40</asp:ListItem>
                                <asp:ListItem Value="41-50">41-50</asp:ListItem>
                                <asp:ListItem Value="51-60">51-60</asp:ListItem>
                                <asp:ListItem Value="61+">61+</asp:ListItem>
                                <asp:ListItem Value="prefer_not_to_say">Prefer not to say</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label for="ddlEducation">Higher Education:</label>
                            <asp:DropDownList ID="ddlEducation" runat="server" CssClass="form-control" required="true">
                                <asp:ListItem Value="">Select Option</asp:ListItem>
                                <asp:ListItem Value="Elementary">Elementary School Student</asp:ListItem>
                                 <asp:ListItem Value="Middle">Middle School Student</asp:ListItem>
                                 <asp:ListItem Value="High">High School Student</asp:ListItem>
                                 <asp:ListItem Value="Undergraduate">Undergraduate Student (currently pursuing a Bachelor Degree)</asp:ListItem>
                                 <asp:ListItem Value="Bachelor">Bachelor Degree Holder</asp:ListItem>
                                 <asp:ListItem Value="Postgraduate_student">Pursuing Postgraduate Studies (Master's or PHD)</asp:ListItem>
                                 <asp:ListItem Value="Postgraudate_Degree">Postgraduate Degree Holder (Master's or PHD)</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label for="ddlGender">Gender:</label>
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" required="true">
                                <asp:ListItem Value="">Select Gender</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="prefer_not_to_say">Prefer not to say</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                  <asp:Button ID="btnSubmit" runat="server" Text="Next" CssClass="button" 
    OnClick="btnSubmit_Click"  />

 <script>
     document.addEventListener('DOMContentLoaded', function () {
         // Initialize sound effect
         const pointSound = new Audio('click.mp3');
         pointSound.volume = 1;

         // Get DOM elements
        

            btnSubmit.addEventListener('click', function () {
              

                
                    // Play sound effect (with error handling)
                    pointSound.currentTime = 0; // Rewind to start if already playing
                    pointSound.play().catch(e => console.log("Sound play prevented:", e));


            });
        });
 </script>         </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
    <div class="header">
    <p>Turn up the volume!!</p>
        </div>

</body>
   


</html>
