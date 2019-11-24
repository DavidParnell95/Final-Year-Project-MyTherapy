<!DOCTYPE html>
<html>
<head>
	<meta name="Sign In">
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="MyTherapyStyle.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<div class = "col-sm-12">
		<ul>
			<li><p>My Therapy</p></li>
		</ul>
	<!-- End Nav Bar--> 	
	</div> 
	
	<div class="row">
		<div class="col-sm-3">
			<div class="sidebar">
			</div>
		</div>
		
		<div class="col-sm-4">
			<div class="headImage">
				<img src="Images/therapy.jpg">
			</div>
			
			<p>
				Welcome to MyTherapy, the online therapy assistant. MyTherapy creates a 
				link between therapists and their clients
				and allows clients to keep their thereapists up to date in their 
				day to day lives.
			</p>
			
			<form class = "SignInForm" action="">
				Username: 
				<input type="text" name = "username" placeholder="Username" required></input><br>
				Password: 
				<input type="password" name = "pwrd" placeholder="Password" required></input>
				<br><br>
				<button type="submit">Login</button>
			</form>
		</div>
		
		<div class="col-sm-3">
		</div>
	</div>
</body>
</html>	