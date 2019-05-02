<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<style>
.button3 {
  display: inline-block;
  padding: 15px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
position: absolute;
top: 15px;
right: 0;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button3:hover {background-color: #3e8e41}

.button3:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

body {font-family: Arial;}

* {box-sizing: border-box}



input[type=text], input[type=number], input[type=date] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f2f1f2;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}


button1 {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button1:hover {
  opacity:2;
}



 .signupbtn {
  width: 100%;
}


.container {
  padding: 16px;
}


ul {
  list-style-type: none;
  margin: 10;
  padding: 0;
  overflow: hidden;
  background-color: #333333;
}


li a {
  display: block;
  color: white;
  text-align: center;
  padding: 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111111;
}

.button1 {
  display: inline-block;
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 20px;
  padding: 20px;
  width: 150px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button1 span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button1 span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}
.btn-group .button1:hover {
  background-color: #3e8e41;
}
.button1:hover span {
  padding-right: 25px;
}

.button1:hover span:after {
  opacity: 1;
  right: 0;
}

a:hover { 
COLOR: yellow; 
TEXT-DECORATION: none; 
font-weight: none 
}

</style>
<body >
<button onclick="window.location.href='index.jsp'" class="button3">Back</button>

<br>
<br>
<br>
<br>
<br>
<br>
<form method="post" action="VotingServlet" style="border:1px solid #ccc">

  <div class="container">
    <h1> Voter's Verification</h1>
    <p>Please fill up the SIN number.</p>
    <hr>
    
    <label for="sin"><b>Social Insurance Number(SINs)</b></label>
    <input type="number" placeholder="Enter SIN " min = 100000000 max = 999999999 name="sin" required>

	
	<p style="font-size:25px;color:red;;text-align:center">${personCriteria}</p>
	<p style="font-size:25px;color:blue;;text-align:center">${SuccesssVote}</p>
    <input type="hidden" name="query" value="true"/>
    
    <div class="clearfix">
      <button type="submit" class="signupbtn button1">Validate</button>
    </div>
  </div>
 </form>



     
<%-- <c:choose>
   <c:when test="${..}">...</c:when> <!-- if condition -->
   <c:when test="${..}">...</c:when> <!-- else if condition -->
   <c:otherwise>...</c:otherwise>    <!-- else condition -->
</c:choose> --%>



<c:set var = "divHider"  value = "${hideDiv}"/>



<div  <c:if test = "${divHider.equals('hidden') || divHider.equals('') || divHider == null }">
         hidden
      </c:if> >
    
  <p style="font-size:30px;color:Blue;text-align:center"> Voting Parties </p>

  <ul>
  <li><a href="VotingServlet?party=Liberal Party"  >Liberal Party</a></li>
  <li><a href="VotingServlet?party=Conservative Party" >Conservative Party</a></li>
  <li><a href="VotingServlet?party=New Democratic Party" >New Democratic Party</a></li>
  <li><a href="VotingServlet?party=Bloc Quebecois"  >Bloc Quebecois</a></li>
  <li><a href="VotingServlet?party=Green Party"  >Green Party</a></li>
  
</ul>
</div>





</body>
</html>