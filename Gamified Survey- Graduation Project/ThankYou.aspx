<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="Gamified_Survey__Graduation_Project.ThankYou" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Have an amazing day</title>
<style>
    html{
        height:100%
    }
        body {
            font-family: Arial, sans-serif;
            background-image: url('chic2.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
        }

        .overlay {
            background-color: rgba(255, 255, 255, 0.7);
            padding: 20px;
        }

        .header {
            color: #000;
            text-align: center;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #ff80bf;
        }

        h4{
            color:brown;
        }


        p {
            color: #666;
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

        .avatar {
            display: inline-block;
            margin: 20px auto;
            width: 150px;
            height: 150px;
            border-radius: 50%;
        }

        .video-container {
     max-width: 800px;
    height: auto;
}    #pointsNotification {
            display: none;
            color: green;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="header">
    </div>

    <div class="container">
        <!-- Display selected avatar here -->
        <p id="avatar-placeholder">
           <%= AvatarImage %>
        </p>
        <h2 id="greetingMessage">
            <%= GreetingMessage %> 
        </h2>

        <h2>You have earned <asp:Label ID="Points" runat="server"></asp:Label>  POINTS!</h2>
        <br />
        <br />
        <h4>HAVE A WONDERFUL DAY. <br/> <br />Your support in sharing this survey with other would truly be appreciated!</h4>
        <<asp:HyperLink ID="HyperLink1" runat="server"> https://gamified-survey.runasp.net </asp:HyperLink>
        </div>
</body>
</html>