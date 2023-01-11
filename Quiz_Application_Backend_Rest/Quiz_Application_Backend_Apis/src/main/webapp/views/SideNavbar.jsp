<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
@media only screen and (max-width:600px)
@import url("https://fonts.googleapis.com/css2?family=Lato:wght@300;400&display=swap");
*,
::after,
::before {
  margin: 0;
  box-sizing: border-box;
}
body {
  font-family: "Lato", sans-serif;
  margin-left: 19.5%;
}

:root {
  --bg-color: #c299ff;
  --primary-color: #006ce0;
  --border-radius: 6px;
  --color: #2b82df;
  /* --box-shadow: #0b488a 5px 0px 50px 0px; */
}

.sidebar {
  height: 100vh;
  position: fixed;
  top: 0;
  left: 0;
  width: 300px;
  background: var(--bg-color);
  transition: left 0.5s ease;
  -webkit-transition: left 0.5s ease;
  -moz-transition: left 0.5s ease;
  -ms-transition: left 0.5s ease;
  -o-transition: left 0.5s ease;
}
.sidebar ul {
  list-style: none;
  margin-top: 5rem;
  height: 100%;
}

.sidebar ul li {
  margin-top: 1rem;
  padding: 0.3rem;
  width: 100%;
  display: flex;
  align-items: center;
  position: relative;
}


.sidebar li .icon {
  margin-right: 1rem;
  padding: 0.5rem;
}
.sidebar li a {
  text-decoration: none;
  font-size: 1.3rem;
  color: white;
  display: flex;
  align-items: center;
}
.sidebar li a:hover {
  margin-left: 2px;
}

.close-icon {
  color: white;
  position: absolute;
  top: 0;
  right: 0;
  font-size: 2.2rem;
  margin: 1rem;
  cursor: pointer;
}

.hamburger-menu {
  position: absolute;
  top: 0;
  right: 0;
  margin: 1rem;
  font-size: 3rem;
  color: #006ce0;
  cursor: pointer;
}

body .toggle.sidebar {
  left: -300px;
}
body.toggle.section {
  margin-left: 0;
  width: 100%;
}

</style>
<script>
const hamburgerMenu = document.getElementById("hamburger-icon");
const link = document.querySelectorAll(".link");
const closeBtn = document.getElementById("close");

for (let i = 0; i < link.length; i++) {
  link[i].addEventListener("click", function () {
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}

// Menu
hamburgerMenu.addEventListener("click", function () {
  const sidebar = document.getElementById("sidebars");
  sidebar.classList.toggle("toggle");
});

//   close icon
function closeNav() {
  const sidebar = document.getElementById("sidebars");
  sidebar.classList.toggle("toggle");
}

</script>
<body>
<div class="hamburger-menu">
  <ion-icon name="menu-outline" id="hamburger-icon"></ion-icon>
</div>
<div class="sidebar" id="sidebars">
  <div class="close-icon" id="close" onclick="closeNav() ">
    <ion-icon name="close-outline"></ion-icon>
  </div>

  <ul class="links">
    
    <li class="link">
      <a href="/admin/renderUserProfile">
        <ion-icon name="analytics-outline" class="icon"></ion-icon>profile
      </a>
    </li>
    <li class="link">
      <a href="/admin/renderAllCategory">
        <ion-icon name="eye-outline" class="icon"></ion-icon>categories
      </a>
    </li>
    <li class="link">
      <a href="/admin/renderAddCategoryForm">
        <ion-icon name="person-outline" class="icon"></ion-icon>Add Category
      </a>
    </li>
    <li class="link">
      <a href="/admin/allQuiz">
        <ion-icon name="mail-outline" class="icon"></ion-icon>Quizes
      </a>
    </li>
    <li class="link">
      <a href="/admin/renderAddQuizForm">
        <ion-icon name="key-outline" class="icon"></ion-icon>Add Quizes
      </a>
    </li>
    <li class="link">
      <a href="/home/renderChangePassword">
        <ion-icon name="key-outline" class="icon"></ion-icon>Change Password
      </a>
    </li>
   
  </ul>
</div>
         
</body>
</html>