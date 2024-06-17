<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Signup</title>
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Montserrat', sans-serif;
}

body {
    background-color: white; /* Sky blue */
    background: white; /* Gradient from sky blue to light cyan */
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    height: 100vh;
}

.container {
    background-color: #fff;
    border-radius: 30px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
    position: relative;
    overflow: hidden;
    width: 768px;
    max-width: 100%;
    min-height: 480px;
}

.container p {
    font-size: 14px;
    line-height: 20px;
    letter-spacing: 0.3px;
    margin: 20px 0;
}

.container span {
    font-size: 12px;
}

.container a {
    color: #333;
    font-size: 13px;
    text-decoration: none;
    margin: 15px 0 10px;
}

.container button {
    background-color: #1E90FF; /* Dodger blue */
    color: #fff;
    font-size: 12px;
    padding: 10px 45px;
    border: 1px solid transparent;
    border-radius: 8px;
    font-weight: 600;
    letter-spacing: 0.5px;
    text-transform: uppercase;
    margin-top: 10px;
    cursor: pointer;
}

.container button.hidden {
    background-color: transparent;
    border-color: #fff;
}

.container form {
    background-color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    padding: 0 40px;
    height: 100%;
}

.container input {
    background-color: #eee;
    border: none;
    margin: 8px 0;
    padding: 10px 15px;
    font-size: 13px;
    border-radius: 8px;
    width: 100%;
    outline: none;
}

.form-container {
    position: absolute;
    top: 0;
    height: 100%;
    transition: all 0.6s ease-in-out;
}

.sign-in {
    left: 0;
    width: 50%;
    z-index: 2;
}

.container.active .sign-in {
    transform: translateX(100%);
}

.sign-up {
    left: 0;
    width: 50%;
    opacity: 0;
    z-index: 1;
}

.container.active .sign-up {
    transform: translateX(100%);
    opacity: 1;
    z-index: 5;
    animation: move 0.6s;
}

@keyframes move {
    0%, 49.99% {
        opacity: 0;
        z-index: 1;
    }
    50%, 100% {
        opacity: 1;
        z-index: 5;
    }
}

.social-icons {
    margin: 20px 0;
}

.social-icons a {
    border: 1px solid #ccc;
    border-radius: 20%;
    display: inline-flex;
    justify-content: center;
    align-items: center;
    margin: 0 3px;
    width: 40px;
    height: 40px;
}

.toggle-container {
    position: absolute;
    top: 0;
    left: 50%;
    width: 50%;
    height: 100%;
    overflow: hidden;
    transition: all 0.6s ease-in-out;
    border-radius: 150px 0 0 100px;
    z-index: 1000;
}

.container.active .toggle-container {
    transform: translateX(-100%);
    border-radius: 0 150px 100px 0;
}

.toggle {
    background-color: #1E90FF; /* Dodger blue */
    height: 100%;
    background: linear-gradient(to right, #1E90FF, #00BFFF); /* Gradient from dodger blue to deep sky blue */
    color: #fff;
    position: relative;
    left: -100%;
    height: 100%;
    width: 200%;
    transform: translateX(0);
    transition: all 0.6s ease-in-out;
}

.container.active .toggle {
    transform: translateX(50%);
}

.toggle-panel {
    position: absolute;
    width: 50%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    padding: 0 30px;
    text-align: center;
    top: 0;
    transform: translateX(0);
    transition: all 0.6s ease-in-out;
}

.toggle-left {
    transform: translateX(-200%);
}

.container.active .toggle-left {
    transform: translateX(0);
}

.toggle-right {
    right: 0;
    transform: translateX(0);
}

.container.active .toggle-right {
    transform: translateX(200%);
}
</style>
<body>
<div class="container">
    <div class="form-container sign-up">
        <form action="signupAction.jsp" method="post">
            <h2>Create Account</h2>
            <input type="text" name="ID" placeholder="Enter ID" required>
            <input type="text" name="name" placeholder="Enter Name" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="email" name="email" placeholder="Enter Email" required>
            <input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
            <input type="submit" value="Sign Up">
        </form>
    </div>
    <div class="form-container sign-in">
        <form action="loginAction.jsp" method="post">
            <h2>Sign In</h2>
            <input type="text" name="ID" placeholder="Enter ID" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="submit" value="Login">
        </form>
    </div>
    <div class="toggle-container">
        <div class="toggle">
            <div class="toggle-panel toggle-left">
                <h2>Welcome Back!</h2>
                <p>To keep connected with us please login with your personal info</p>
                <button class="hidden" onclick="toggleForm()">Sign In</button>
            </div>
            <div class="toggle-panel toggle-right">
                <h2>Hello, Friend!</h2>
                <p>Enter your personal details and start journey with us</p>
                <button class="hidden" onclick="toggleForm()">Sign Up</button>
            </div>
        </div>
    </div>
</div>

<div class="whysign">
    <%
    String msg = request.getParameter("msg");
    if ("valid".equals(msg)) {
    %>
    <div id="success-message" style="display: none;">
        <h1 style="color: green;">Registration Successful!</h1>
       
    </div>
    
    <% } else if ("invalid".equals(msg)) { %>
    <h1>Registration Failed! Please try again!</h1>
    <% } %>
    <
</div>

<script>
function toggleForm() {
    document.querySelector('.container').classList.toggle('active');
}
</script>
</body>
</html>
