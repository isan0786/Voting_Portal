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

.button1 {
  display: inline-block;
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 20px;
  padding: 20px;
  width: 300px;
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

a:hover { 
COLOR: yellow; 
TEXT-DECORATION: none; 
font-weight: none 
}

}
</style>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="BootStrap/bootstrap.min.css">
  <script src="BootStrap/jquery.min.js"></script>
  <script src="BootStrap/popper.min.js"></script>
  <script src="BootStrap/bootstrap.min.js"></script>
</head>
<body bgcolor = "yellow">
<button onclick="window.location.href='index.jsp'" class="button3">Back</button>
<br>
<br>
<br>
<br>
 <form method="post" action="VotingServlet">
   <input type="hidden" name="voterInformation" value="true"/>
	<button type="submit" class="button1" style="text-align: center; margin:auto;
  display:block;"><span style="text-align: center;" > For Results Click Here </span></button>
</form>


 <div style="background-color:black;color:white;padding:20px;">
  <center><h2>Voter's Information</h2></center>
   <p style="font-size:25px;color:red;;text-align:center">${noVoterInfo}</p>
<div class="container">
      
  <table class="table table-dark table-striped">
    <thead>
      <tr>
        <th>Sin</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Address</th>
        <th>Age</th>
        <th>Date Of Birth</th>
        <th>Vote</th>
      </tr>
    </thead>
    <tbody>
    
    <c:forEach var="voter" items= "${voterList}" ><p style="font-size: 30px;text-align: center;">  
      <tr>
        <td>${voter.sin}</td>
        <td>${voter.fname}</td>
        <td>${voter.lname}</td>
        <td>${voter.address}</td>
        <td>${voter.age}</td>
        <td>${voter.dob}</td>
        
        
        <c:set var = "check" scope = "session" value = "${voter.vote.party}"/>
      <c:choose>
         
         <c:when test = "${check == null}">
            <td>Not voted</td>
         </c:when>     
         <c:otherwise>
            <td>${voter.vote.party}</td>
         </c:otherwise>
      </c:choose>
      
      
        
        
      </tr>
      </c:forEach>
    </tbody>
  </table>
  
</div>
  
  </div> 
 
</body>
</html>