<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Navbar Component</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@500&display=swap" />
    <link rel="stylesheet" href="navbar.css" />
</head>
<body>
    <div class="navbar">
        <a href="lol.jsp">
            <img src="assets/555.png" alt="Logo" class="logo-bizda" />
            <span class="logo">CampusBuzz</span>
        </a>
    
        <div class="nav-links">
            <div class="dropdown">
                <a href="#">Campus life</a>
                <div class="dropdown-content">
                    <a href="location_of_study_rooms.jsp">Location of Study Rooms</a>
                    <a href="housing_options.jsp">Housing Options</a>
                    <a href="campus_facilities.jsp">Campus Facilities</a>
                    <a href="dining_services.jsp">Dining Services</a>
                    <a href="cultural_events.jsp">Cultural Events</a>
                </div>
            </div>
            <div class="dropdown">
                <a href="#">Education</a>
                <div class="dropdown-content">
                    <a href="scholarships.jsp">Scholarships</a>
                    <a href="korean_language_course.jsp">Korean Language Course</a>
                    <a href="school_clubs.jsp">School Clubs</a>
                </div>
            </div>
            <div class="dropdown">
                <a href="#">Career Quest</a>
                <div class="dropdown-content">
                    <a href="part_time_jobs.jsp">Part-time Jobs</a>
                    <a href="internships.jsp">Internships</a>
                    <a href="permission_from_immigration.jsp">Permission from Immigration</a>
                    <a href="resume_workshops.jsp">Resume Workshops</a>
                </div>
            </div>
            <div class="dropdown">
                <a href="#">Alumni Adventures</a>
                <div class="dropdown-content">
                    <a href="main.jsp">Seniors' Stories</a>
                </div>
            </div>
            <div class="dropdown">
                <a href="#">Health</a>
                <div class="dropdown-content">
                    <a href="hospitals_near_uni.jsp">Hospitals Near Uni</a>
                    <a href="about_health_insurance.jsp">About Health Insurance</a>
                </div>
            </div>
            <a href="free_time.jsp">Free time</a>
            <a href="faq.jsp">FAQ</a>
        </div>
        <% if (session.getAttribute("email") != null) { %>
            <a href="logout.jsp" class="login-btn">Log Out</a>
        <% } else { %>
            <a href="login.jsp" class="login-btn">Log In</a>
        <% } %>
    </div>
</body>
</html>
