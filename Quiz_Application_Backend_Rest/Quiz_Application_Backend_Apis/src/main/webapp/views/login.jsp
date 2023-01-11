<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<script>
let background = document.querySelector('#background');

function addMoon(x, y, elWidth, elHeight, randomDelay){
	let imageEl = document.createElement('div');
  imageEl.className = 'image';
  let svgEl = document.createElementNS("http://www.w3.org/2000/svg",'svg');
  svgEl.setAttribute('width', 24);
  svgEl.setAttribute('height', 24);
  svgEl.setAttribute('fill', 'none');
  svgEl.setAttribute('stroke', 'currentColor');
  svgEl.setAttribute('stroke-width', 2);
  svgEl.setAttribute('stroke-linecap', 'round');
  svgEl.setAttribute('stroke-linejoin', 'round');
  svgEl.setAttribute('viewBox', '0 0 24 24');
  let pathEl = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  pathEl.setAttribute('d','M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z');
  svgEl.appendChild(pathEl);
  imageEl.appendChild(svgEl);
  imageEl.style.top = (y*elHeight)+'px';
  imageEl.style.left = (x*elWidth)+'px';
  background.appendChild(imageEl);
  svgEl.style.animationDelay = randomDelay+"s";
}

function addStar(x, y, elWidth, elHeight, randomDelay){
	let imageEl = document.createElement('div');
  imageEl.className = 'image';
  let svgEl = document.createElementNS("http://www.w3.org/2000/svg",'svg');
  svgEl.setAttribute('width', 24);
  svgEl.setAttribute('height', 24);
  svgEl.setAttribute('fill', 'none');
  svgEl.setAttribute('stroke', 'currentColor');
  svgEl.setAttribute('stroke-width', 2);
  svgEl.setAttribute('stroke-linecap', 'round');
  svgEl.setAttribute('stroke-linejoin', 'round');
  svgEl.setAttribute('viewBox', '0 0 24 24');
  let pathEl = document.createElementNS('http://www.w3.org/2000/svg', 'polygon');
  pathEl.setAttribute('points','12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2');
  svgEl.appendChild(pathEl);
  imageEl.appendChild(svgEl);
  imageEl.style.top = (y*elHeight)+'px';
  imageEl.style.left = (x*elWidth)+'px';
  background.appendChild(imageEl);
  svgEl.style.animationDelay = randomDelay+"s";
}

function addPlus(x, y, elWidth, elHeight, randomDelay){
	let imageEl = document.createElement('div');
  imageEl.className = 'image';
  let svgEl = document.createElementNS("http://www.w3.org/2000/svg",'svg');
  svgEl.setAttribute('width', 24);
  svgEl.setAttribute('height', 24);
  svgEl.setAttribute('fill', 'none');
  svgEl.setAttribute('stroke', 'currentColor');
  svgEl.setAttribute('stroke-width', 2);
  svgEl.setAttribute('stroke-linecap', 'round');
  svgEl.setAttribute('stroke-linejoin', 'round');
  svgEl.setAttribute('viewBox', '0 0 24 24');
  let circleEl = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
  circleEl.setAttribute('cx', 12);
  circleEl.setAttribute('cy', 12);
  circleEl.setAttribute('r', 10);
  let line1El = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  line1El.setAttribute('x1', 12);
  line1El.setAttribute('y1', 8);
  line1El.setAttribute('x2', 12);
  line1El.setAttribute('y2', 16);
  let line2El = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  line2El.setAttribute('x1', 8);
  line2El.setAttribute('y1', 12);
  line2El.setAttribute('x2', 16);
  line2El.setAttribute('y2', 12);
  svgEl.appendChild(circleEl);
  svgEl.appendChild(line1El);
  svgEl.appendChild(line2El);
  imageEl.appendChild(svgEl);
  imageEl.style.top = (y*elHeight)+'px';
  imageEl.style.left = (x*elWidth)+'px';
  background.appendChild(imageEl);
  svgEl.style.animationDelay = randomDelay+"s";
}

function addArrow(x, y, elWidth, elHeight, randomDelay){
	let imageEl = document.createElement('div');
  imageEl.className = 'image';
  let svgEl = document.createElementNS("http://www.w3.org/2000/svg",'svg');
  svgEl.setAttribute('width', 24);
  svgEl.setAttribute('height', 24);
  svgEl.setAttribute('fill', 'none');
  svgEl.setAttribute('stroke', 'currentColor');
  svgEl.setAttribute('stroke-width', 2);
  svgEl.setAttribute('stroke-linecap', 'round');
  svgEl.setAttribute('stroke-linejoin', 'round');
  svgEl.setAttribute('viewBox', '0 0 24 24');
  let pathEl = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  pathEl.setAttribute('d','M9 18l6-6-6-6');
  svgEl.appendChild(pathEl);
  imageEl.appendChild(svgEl);
  imageEl.style.top = (y*elHeight)+'px';
  imageEl.style.left = (x*elWidth)+'px';
  background.appendChild(imageEl);
  svgEl.style.animationDelay = randomDelay+"s";
}

function generateBg(){
	background.innerHTML = '';
	let screenWidth = window.innerWidth;
  let screenHeight = window.innerHeight;
  let elWidth = (24+100);
  let elHeight = (24+100);
  let colCount = screenWidth/elWidth;
  let rowCount = screenHeight/elHeight;
	for(let y=0; y<rowCount; y++){
  	for(let x=0; x<colCount; x++){
    	let randomType = Math.floor(Math.random()*4)+1;
      let randomDelay = Math.random()*5;
      switch(randomType){
      	case 1:
        	addArrow(x, y, elWidth, elHeight, randomDelay);
          break;
        case 2:
        	addPlus(x, y, elWidth, elHeight, randomDelay);
          break;
        case 3:
        	addStar(x, y, elWidth, elHeight, randomDelay);
          break;
        case 4:
        	addMoon(x, y, elWidth, elHeight, randomDelay);
          break;
      }
    }
  }
}

window.addEventListener('resize',()=>{
	generateBg();
});
generateBg();
</script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Dosis:wght@400;500;700&family=PT+Serif:wght@400;700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
}

body {
	background: #ebecf0;
	font-family: 'Dosis', sans-serif;
}

#background {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	min-height: 100vh;
	overflow: hidden;
	z-index: -1;
}

#background .image {
	position: absolute;
	top: 0;
	left: 0;
	color: #b4b7ba;
	transform: rotate(-30deg);
	z-index: -1;
}

#background .image svg {
	animation: imageAnim 10s linear infinite;
}

@
keyframes imageAnim { 0%{
	transform: scale(1) rotate(0deg);
}

50
%
{
transform
:
scale(
1.4
)
rotate(
180deg
);
}
100
%
{
transform
:
scale(
1
)
rotate(
360deg
);
}
}
#form-wrapper {
	max-width: 400px;
	margin: 0 auto;
	padding-bottom: 100px;
}

#person {
	float: right;
	margin-top: -124px;
	margin-right: 0px;
}

#arm, #hand {
	animation: arm 5s ease-in infinite;
}

@
keyframes arm { 0%{
	transform: rotate(0deg) translateX(0px) translateY(0px);
}

10
%
{
transform
:
rotate(
25deg
)
translateX(
16px
)
translateY(
-30px
);
}
20
%
{
transform
:
rotate(
0deg
)
translateX(
0px
)
translateY(
0px
);
}
100
%
{
transform
:
rotate(
0deg
)
translateX(
0px
)
translateY(
0px
);
}
}
form {
	background: #fff;
	padding: 35px 25px;
	border-radius: 20px;
	margin-top: 180px;
	box-shadow: 0 0 25px rgba(0, 0, 0, 0.05);
}

form .title {
	display: block;
	position: relative;
	font-family: 'PT Serif', serif;
	font-weight: 700;
	font-size: 36px;
	color: #000;
	margin-bottom: 35px;
	animation: title 5s ease infinite;
}

@
keyframes title { 0%{
	left: 225px;
}

50
%
{
left
:
0px;
animation-timing-function
:
ease-in;
}
100
%
{
left
:
225px;
}
}
form label {
	display: block;
	font-weight: 500;
	font-size: 24px;
	margin-bottom: 16px;
}

form input {
	display: block;
	border: 0;
	border-bottom: 1px solid #c8c8c8;
	padding-bottom: 8px;
	width: 100%;
	margin-bottom: 15px;
	color: #747474;
}

form input:focus {
	outline: 0;
	border-color: #747474;
}

form input[type=submit] {
	background: #223743;
	color: #fff;
	border: 0;
	height: 48px;
	line-height: 48px;
	border-radius: 20px;
	margin-top: 28px;
	font-size: 20px;
	font-weight: 700;
	font-family: 'Dosis', sans-serif;
	letter-spacing: 2px;
	transition: all .2s;
}

form input[type=submit]:hover {
	cursor: pointer;
	transform: scale(1.1);
}

form .forget {
	display: block;
	text-align: right;
}

form .forget a {
	display: inline-block;
	color: #747474;
	text-decoration: none;
	font-weight: 500;
	transition: all .2s;
	transform: scale(1);
}

form .forget a:hover {
	color: #000;
	transform: scale(1.05);
}

form .new {
	display: block;
	font-weight: 500;
	text-align: center;
	margin-top: 20px;
	color: #747474;
}

form .new a {
	display: inline-block;
	color: #747474;
	text-decoration: none;
	font-weight: 700;
	transition: all .2s;
	transform: scale(1);
}

form .new a:hover {
	color: #000;
	transform: scale(1.05);
}
</style>
<div id="background"></div>

<body>

	<div id="form-wrapper">


		<div id="person">
			<svg width="182" height="212" viewBox="0 0 82 116" fill="none"
				xmlns="http://www.w3.org/2000/svg">
      <path id="arm"
					d="M79.415 98.5L71.415 97C72.5 91.5 72.5 72.5 72.5 69C72.5 63.1476 64.915 59.6673 64.915 59.1673L66.415 50.1673C68.415 50.6673 81.5 56 81 69C80.6081 79.1905 80 93.5 79.415 98.5Z"
					stroke="black" />
      <path
					d="M65.915 50.1673C46.315 39.3673 25.7484 46.334 17.915 51.1673L18.915 66.6673H63.915C63.915 67.1673 64.315 64.5673 65.915 50.1673Z"
					fill="black" stroke="black" />
      <path id="hand"
					d="M72.5624 97.5936L72.1862 99.5579C70.6572 100.453 67.7393 102.575 68.2993 103.904C68.8594 105.233 70.2323 104.444 70.8488 103.884L70.3857 106.302C70.3209 106.64 70.1245 106.939 69.8395 107.132V107.132C69.1616 107.592 69.0665 108.566 69.7016 109.083C70.9152 110.072 72.7859 111.248 75.0281 111.302C78.0686 111.375 78.9288 108.655 78.9149 106.955L78.4553 98.7221"
					stroke="black" />
      <path
					d="M17.7585 40.9589L19.0032 39.3935C20.7729 39.3101 24.3425 38.7839 24.4632 37.3468C24.5838 35.9096 23.0014 35.9716 22.1951 36.1823L23.7275 34.255C23.9418 33.9855 24.2543 33.8121 24.5964 33.7731V33.7731C25.4104 33.6802 25.9465 32.8617 25.624 32.1086C25.0079 30.6695 23.8964 28.7598 21.9353 27.6716C19.2759 26.1959 17.2516 28.2062 16.4753 29.7183L13.0621 37.2249"
					stroke="black" />
      <path
					d="M10.915 59.1673C12.115 59.1673 15.7483 53.834 17.415 51.1673L18.915 65.1673C17.415 67.1673 6.91504 71.1673 2.41499 64.1673C-2.81224 56.0362 7.74833 42.5007 12.915 37.1673L18.915 40.1673C12.415 46.6673 9.415 59.1673 10.915 59.1673Z"
					stroke="black" />
      <path
					d="M43.9151 34.1673C42.7151 35.7673 46.4151 41.834 48.4151 44.6673L33.415 45.6673C36.215 42.8673 34.5817 38.1673 33.415 36.1673L43.9151 34.1673Z"
					fill="#E2E2E2" stroke="black" />
      <path
					d="M50.915 19.1673C51.8645 25.4973 46.8246 32.0359 42.5324 36.0587C40.6287 37.8429 37.9409 38.5329 35.4773 37.6735C30.5455 35.9531 24.2583 32.0406 22.415 24.6673C20.5081 17.0396 24.3672 10.1694 27.8726 6.16366C29.3928 4.42647 31.6826 3.61275 33.9817 3.81977C44.53 4.76955 49.5596 10.1313 50.915 19.1673Z"
					fill="white" stroke="black" />
      <path d="M26 19.5C27 19 29.3 18.1 30.5 18.5" stroke="black" />
      <path d="M39 18.0997C40 17.5997 42.3 16.6997 43.5 17.0997"
					stroke="black" />
      <ellipse cx="29.3097" cy="21.6854" rx="1" ry="1.5"
					transform="rotate(-12.9039 29.3097 21.6854)" fill="black" />
      <ellipse cx="42.3097" cy="20.6854" rx="1" ry="1.5"
					transform="rotate(-3.81344 42.3097 20.6854)" fill="black" />
      <line x1="36.1966" y1="25.035" x2="35.5132" y2="22.1139"
					stroke="black" />
      <path
					d="M34 1.5C46.4 0.3 50 10.5 50 16L44.917 9.22258C44.3265 8.43526 43.4665 7.89326 42.5014 7.70025L37.4075 6.68146C36.8104 6.56205 36.1939 6.58052 35.6051 6.73549L28.7066 8.55088C27.6194 8.83697 26.7028 9.56733 26.1812 10.5631L21.5 19.5C19.5 14.5 21.6 2.7 34 1.5Z"
					fill="black" stroke="black" />
      <path d="M35 31.5C36.6667 31.6667 38.6 32 41 30" stroke="black" />
    </svg>
		</div>

		<form action="/home/doLogin" method="post">
			<%
			String error = request.getParameter("error");

			if (error != null) {
			%>

			<div class="alert alert-danger %>" role="alert">invalid
				username or password</div>

			<%
			}
			%>
			<%
			String logout = request.getParameter("logout");
			if (logout != null) {
			%>
			<div class="alert alert-success %>" role="alert">successfully
				Logged out</div>
			<%
			}
			%>
			<span class="title">Log-in</span> <label for="email">Username</label>
			<input type="text" name="username" placeholder="Your username">
			<label for="password">Password</label> <input type="password"
				name="password" placeholder="Password"> <span class="forget"><a
				href="#">Forget password?</a></span> <input type="submit" value="Login">
			<span class="new">Didn't have an account? <a href="#">Sign-up</a></span>
		</form>
	</div>

</body>
</html>