<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>


A {text-decoration: none;}

.btn {
  background-color: DodgerBlue;
  border-radius: 25px;
  border: none;
  color: white;
  padding: 19px 70px;
  font-size: 16px;
  cursor: pointer;
  flex-grow: 8;
 display: flex;
 text-align: center;
  width:800px; margin:0 auto;
}

/* Darker background on mouse-over */
.btn:hover {

  background-color: RoyalBlue;
}

.w3-myfont {
  
}
</style>
</head>
<body bgcolor = "yellow">
<h1 style = "font-family: Comic Sans MS, cursive, sans-serif; text-align: center;font-size: 60px;" > Elections </h1>

<br>
<br>
<div  >



<button onclick="window.location.href='Voter_Registeration.jsp'"  class="btn"  ><b><centre> Voter Registeration</centre><b></button>



<button onclick="window.location.href='Voters_Information.jsp'"  class="btn"><b> View Voters<b></button>
 
<button onclick="window.location.href='Voters_Verification.jsp'" class="btn"><b> Voter's Validation<b></button> 

<button  onclick="window.location.href='Voters_Statistics.jsp'" class="btn"><b> Show Statistics<b></button>
 
<form method="post" action="VotingServlet" >
<button type="submit" class="btn"><b> Generate Dummy records<b></button>
   <input type="hidden" name="GenerateRecords" value="true"/>
</form>


<form method="post" action="VotingServlet" >
<button type="submit" class="btn"><b> Assign Dummy Votes<b></button>
   <input type="hidden" name="voterGenerateStats" value="true"/>
</form>



					
</div>
<p style="font-size:25px;color:red;;text-align:center">${successDummies}</p>
</body>
</html>
