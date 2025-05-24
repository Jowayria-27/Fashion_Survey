<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Avatar.aspx.cs" Inherits="Gamified_Survey__Graduation_Project.Avatar" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pick Your Avatar - Fast Fashion</title>
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

        .avatar-container {
            text-align: center;
        }

        .header {
            color: #000;
            text-align: center;
        }

        .avatar {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin: 10px;
            cursor: pointer;
            transition: transform 0.3s ease, filter 0.3s ease; /* Added filter transition */
            border: 3px solid #ff80bf; /* Pink border */
        }

        .avatar.selected {
            filter: grayscale(100%); /* Make selected avatar grayscale */
            pointer-events: none; /* Disable click on selected avatar */
        }

        .avatar:hover {
            transform: scale(1.1);
        }

        h1 {
            color: #ff80bf;
        }

        p {
            color: white;
            font-weight:bold;
        }

        .button {
            display: inline-block;
            background-color: #ff80bf; /* Pink color */
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #ff66a3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="avatar-container">
            <h1>Fast Fashion Survey</h1>
            <p>Pick Your Favorite avatar below:</p>
            
            <asp:ImageButton ID="imgAvatar1" runat="server" ImageUrl="1.jpg" CssClass="avatar" OnClick="SelectAvatar" CommandArgument="1.jpg" />
            <asp:ImageButton ID="imgAvatar2" runat="server" ImageUrl="2.jpg" CssClass="avatar" OnClick="SelectAvatar" CommandArgument="2.jpg" />
            <asp:ImageButton ID="imgAvatar3" runat="server" ImageUrl="3.jpg" CssClass="avatar" OnClick="SelectAvatar" CommandArgument="3.jpg" />
            <asp:ImageButton ID="imgAvatar4" runat="server" ImageUrl="4.jpg" CssClass="avatar" OnClick="SelectAvatar" CommandArgument="4.jpg" />
            <asp:ImageButton ID="imgAvatar5" runat="server" ImageUrl="5.jpg" CssClass="avatar" OnClick="SelectAvatar" CommandArgument="5.jpg" />
            <asp:ImageButton ID="imgAvatar6" runat="server" ImageUrl="a.jpg" CssClass="avatar" OnClick="SelectAvatar" CommandArgument="a.jpg" />
            <asp:ImageButton ID="imgAvatar7" runat="server" ImageUrl="b.jpg" CssClass="avatar" OnClick="SelectAvatar" CommandArgument="b.jpg" />
            <asp:ImageButton ID="imgAvatar8" runat="server" ImageUrl="c.jpg" CssClass="avatar" OnClick="SelectAvatar" CommandArgument="c.jpg" />
            <asp:ImageButton ID="imgAvatar9" runat="server" ImageUrl="d.jpg" CssClass="avatar" OnClick="SelectAvatar" CommandArgument="d.jpg" />
            <asp:ImageButton ID="imgAvatar10" runat="server" ImageUrl="e.jpg" CssClass="avatar" OnClick="SelectAvatar" CommandArgument="e.jpg" />
            <asp:ImageButton ID="imgAvatar11" runat="server" ImageUrl="6.jpg" CssClass="avatar" OnClick="SelectAvatar" CommandArgument="6.jpg" />
            <asp:ImageButton ID="imgAvatar12" runat="server" ImageUrl="7.jpg" CssClass="avatar" OnClick="SelectAvatar" CommandArgument="7.jpg" />
            <asp:ImageButton ID="imgAvatar13" runat="server" ImageUrl="8.jpg" CssClass="avatar" OnClick="SelectAvatar" CommandArgument="8.jpg" />
            <asp:ImageButton ID="imgAvatar14" runat="server" ImageUrl="f.jpg" CssClass="avatar" OnClick="SelectAvatar" CommandArgument="f.jpg" />
            <asp:ImageButton ID="imgAvatar15" runat="server" ImageUrl="g.jpg" CssClass="avatar" OnClick="SelectAvatar" CommandArgument="g.jpg" />
            <asp:ImageButton ID="imgAvatar16" runat="server" ImageUrl="h.jpg" CssClass="avatar" OnClick="SelectAvatar" CommandArgument="h.jpg" />
            
            <p id="selected-avatar-text"></p>
            <asp:Button ID="nextButton" runat="server" Text="Next" CssClass="button" OnClick="ProceedToSurvey" Enabled="false" />
        </div>
    </form>
  
</body>
</html>