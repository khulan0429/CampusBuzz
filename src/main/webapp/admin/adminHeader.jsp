<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-....." crossorigin="anonymous" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

        body1 {
            font-family: 'Montserrat', sans-serif;
            
            background-size: cover;
            color: white;
            text-align: center;
        }

        h1 {
            color: white;
            text-align: center;
            font-size: 100px;
            margin-top: 50px;
            text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.5);
            animation: fadeIn 2s ease-in-out;
        }

        /* Keyframes for the fadeIn animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Style for the logo */
        .logo {
        padding-top : 50px;
            width: 200px;
            height: auto;
            animation: logoAnimation 3s infinite;
        }

        /* Keyframes for the logo animation */
        @keyframes logoAnimation {
            0% {
                transform: scale(1);
                opacity: 1;
            }
            50% {
                transform: scale(1.1);
                opacity: 0.8;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        /* Header CSS */
        .topnav {
            overflow: hidden;
            background-color: #87CEEB; /* Updated header background color to sky blue */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Added shadow for 3D effect */
            position: relative;
            z-index: 1;
        }

        .topnav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 12px 16px; /* Adjusted padding for better spacing */
            text-decoration: none;
            font-size: 18px; /* Adjusted font size for better readability */
            transition: all 0.3s ease; /* Smooth transition for hover effects */
            position: relative;
            z-index: 2;
        }

        .topnav a:hover {
            background-color: #6CA6CD; /* Lightened hover background color */
            color: white;
            transform: scale(1.1); /* Added scale transform for hover effect */
        }

        .topnav a.active {
            background-color: #1E90FF; /* Darker sky blue for active link */
            color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 3D effect for active link */
        }

        .topnav .search-container {
            float: right;
            position: relative;
            z-index: 1;
        }

        .topnav input[type=text] {
            padding: 8px;
            margin-top: 8px;
            font-size: 16px; /* Adjusted font size */
            border: none;
            background-color: #F0F8FF; /* Light sky blue input background color */
            border-radius: 20px; /* Rounded corners for input */
            transition: all 0.3s ease; /* Smooth transition for focus */
        }

        .topnav input[type=text]:focus {
            background-color: #E6F2FF; /* Slightly darker on focus */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 3D effect on focus */
        }

        .topnav .search-container button {
            float: right;
            padding: 8px 12px;
            margin-top: 8px;
            margin-right: 16px;
            background: #B0E0E6; /* Lighter sky blue background */
            font-size: 16px; /* Adjusted font size */
            border: none;
            cursor: pointer;
            border-radius: 20px; /* Rounded corners for button */
            transition: all 0.3s ease; /* Smooth transition for hover */
        }

        .topnav .search-container button:hover {
            background: #ADD8E6; /* Slightly darker on hover */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 3D effect on hover */
        }

        @media screen and (max-width: 600px) {
            .topnav .search-container {
                float: none;
            }
            
            .topnav a, .topnav input[type=text], .topnav .search-container button {
                float: none;
                display: block;
                text-align: left;
                width: 100%;
                margin: 0;
                padding: 10px; /* Adjusted padding */
            }
            
            .topnav input[type=text] {
                border: 1px solid #ccc;
                background-color: #F0F8FF; /* Updated input background color */
            }
        }
    </style>
    <!--Header-->
    <br>
    <div class="topnav sticky">
   <%String email=session.getAttribute("email").toString();  %>
            <center><h2>INHAtc CAMPUSBUZZ ADMIN WEB </h2></center>
            <a href="addNewPost.jsp">Add New Post <i class="fas fa-plus-square"></i></a>
            <a href="allPostsEditPosts.jsp">All Posts & Edit posts <i class="fab fa-post"></i></a>
            <a href="allUsersEditUsers.jsp">all users <i class="fas fa-users"></i></a>
         
            <a href="../logout.jsp">Logout <i class="fas fa-share-square"></i></a>
          </div>
           <br>
           <!--table-->
