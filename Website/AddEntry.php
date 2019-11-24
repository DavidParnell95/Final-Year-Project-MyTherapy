<!DOCTYPE html>
<html>
<head>
	<meta name="Add Entry">
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="MyTherapyStyle.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<div class = "col-sm-12">
		<ul>
			<li><a href= "Home.html"><i class="fa fa-fw fa-home"></i>Home</a></li>
			<li><a class="active" href="#FormPage">Add Entry</a></li>
			<li><a href="#ViewEntries">View Entries</a></li>
			<li><a href="Settings.html">Settings</a><li>
			<li><a href="#"><i class="fa fa-fw fa-user"></i>Log Out</a></li>
		</ul>
	<!-- End Nav Bar--> 	
	</div> 
	
	<div class="row">
		<div class="col-sm-4">
			<div class="sidebar">
			</div>
		</div>
		
		<div class="col-sm-8">
			<form class = "NewEntry" action="">
				<p>Date: <span id="datetime"></span></p>
				<script>
					var dt = new Date();
					document.getElementById("datetime").innerHTML = dt.toLocaleDateString();
				</script>
				
				<br>
				SUDs:
				<select name="suds">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
				</select>
				<br><br>
				Summary:<br>
				<textarea name = "Comment" rows="10" cols="30"></textarea>
				<br><br>
				<input type="submit" value="Submit">
			</form>
		</div>
	<!-- End Row -->
	</div>
</body>
</html>