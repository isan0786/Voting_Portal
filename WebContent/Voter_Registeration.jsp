<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<body>
<button onclick="window.location.href='index.jsp'" class="button3">Back</button>
<br>
<br>
<br>
<p style="font-size:25px;color:red;;text-align:center">${successRegister}</p>
<br>
<br>
<form method="post" action="VotingServlet" style="border:1px solid #ccc">

  <div class="container">
    <h1> Voter's Registeration</h1>
    <p>Please fill up the Registeration form.</p>
    <hr>

    <label for="fname"><b>First Name</b></label>
    <input type="text" placeholder="Enter First Name" name="firstName" required>
    
    <label for="lname"><b>Last Name</b></label>
    <input type="text" placeholder="Enter Last Name" name="lastName" required>

    <label for="address"><b>Address</b></label>
    <input type="text" placeholder="Enter Address" name="address" required>
    
    <label for="sin"><b>Social Insurance Number(SIN)</b></label>
    <input type="number" placeholder="Enter SIN " min = 100000000 max = 999999999 name="sin" required>

	<label for="age"><b>Age</b></label>
    <input type="number" placeholder="Enter Age " min = 18 max = 100 name="age" required>
    
    <label for="age"><b>Date Of Birth</b></label>
    <input type="date" placeholder="Enter date of birth "name="dob" min="1919-04-30" max="2001-01-30" required>
    <input type="hidden" name="voterRegisteration" value="true"/>
    
    <div class="clearfix">
      <button type="submit"  class="signupbtn button1">Submit</button>
    </div>
  </div>
</form>

</body>
</html>
