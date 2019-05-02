<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
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
.button {
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

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}
.btn-group .button:hover {
  background-color: #3e8e41;
}
.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}

a:hover { 
COLOR: yellow; 
TEXT-DECORATION: none; 
font-weight: none 
}
</style>
<body  bgcolor = "#FFFF99">
<button onclick="window.location.href='index.jsp'" class="button3">Back</button>
<br>
<br>
<br>
<br>
<h1 style="vertical-align:middle;text-align: center;">Vote Statistics</h1>

<form method="post" action="VotingServlet">
   <input type="hidden" name="voterStats" value="true"/>
	<button type="submit" class="button" style="text-align: center; margin:auto;
  display:block;"><span style="text-align: center;" >Click Here To Get Statistics </span></button>
  
   
</form>




<p style="font-size:25px;color:red;;text-align:center">${successRandomVotes}</p>
<p style="font-size:30px;color:blue;;text-align:center">${noParties}</p>
<div style="width:800px; margin:0 auto;border-style: solid; background-color: yellow" id="piechart"></div>
<div style="width:800px; margin:0 auto;border-style: solid;" id="piechart1"></div>
<div style="width:800px; margin:0 auto;border-style: solid;" id="piechart2"></div>

<script type="text/javascript" src="BootStrap/loader.js"></script>

<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Vote Parties', 'Voters vote\'s per party'],
  ['Liberal Party', ${partyResultjsp[0]} ],
  ['Conservative Party', ${partyResultjsp[1]} ],
  ['New Democratic Party', ${partyResultjsp[2]} ],
  ['Bloc Quebecois', ${partyResultjsp[3]} ],
  ['Green Party', ${partyResultjsp[4]} ]
]);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'Parties Result', 'width':800, 'height':700};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));

  chart.draw(data, options);
  
}
</script>

<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Vote Age Group', 'Age Group voters per party'],
  ['18-30', ${ageGroupResultjsp[0]} ],
  ['30-45', ${ageGroupResultjsp[1]} ],
  ['45-60', ${ageGroupResultjsp[2]} ],
  ['60+', ${ageGroupResultjsp[3]} ]
]);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'Percentage Of Eligible Voters That Voted By the Age-Group', 'width':800, 'height':700};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart1'));
  chart.draw(data, options);
}
</script>

<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Voters vote', 'Voters vote per party'],
  ['Voters who voted', ${didVotejsp[0]} ],
  ['Voters didn\'t vote', ${didVotejsp[1]} ]
]);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'Percentage of Eligible Voters', 'width':800, 'height':700};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
  chart.draw(data, options);
}
</script>

</body>
</html>