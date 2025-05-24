<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="video.aspx.cs" Inherits="Gamified_Survey__Graduation_Project.video" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fast Fashion Survey</title>
    <style>
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
        <h1>Fast Fashion Survey</h1>
    </div>

    <div class="container">
        <!-- Display selected avatar here -->
        <p id="avatar-placeholder">
           <%= AvatarImage %>
        </p>
        <p id="greetingMessage">
            <%= GreetingMessage %> 
        </p>
        <p>Below is a video to provide you with some context about fast fashion:</p>
        <video class="video-container" controls id="surveyVideo">
            <source src="video.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
        <div id="pointsNotification">+10 points for watching the video!</div>
        <a href="Survey.aspx" class="button" id="nextButton">Next</a>
         <p>Note: if you're using your phone, you will need to make your phone landscape/horizontal for the next part!</p>
    </div>

  
</body>
</html>