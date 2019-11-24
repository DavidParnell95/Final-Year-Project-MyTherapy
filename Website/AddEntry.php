<!DOCTYPE html>
<html>
<head>
	<meta name="Add Entry">
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="MyTherapyStyle.css">
</head>

<body>
	<div class = "NavigationBar">
		<ul>
			<li><a class="active" href="#FormPage">Add Entry</a></li>
			<li><a href="#ViewEntries">View Entries</a></li>
		</ul>
	<!-- End Nav Bar--> 	
	</div> 
	
	<div class="row">
		<div class="col-sm-4">
		</div>
		
		<div class="col-sm-4">
			<form class = "NewEntry" action="">
				Date: 
				<input type="text" name = "Name">
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
		
		<div class="col-sm-4">
		</div>
	<!-- End Row -->
	</div>
	
	<!-- The core Firebase JS SDK is always required and must be listed first -->
	<script src="https://www.gstatic.com/firebasejs/7.2.3/firebase-app.js"></script>

	<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
	<script src="https://www.gstatic.com/firebasejs/7.2.3/firebase-analytics.js"></script>

	<script>
	// Your web app's Firebase configuration
	var firebaseConfig = {
		apiKey: "AIzaSyA0gpT-psrA1oaXFmp6V4snnjWsg4xIx8w",
		authDomain: "mytherapy-8776f.firebaseapp.com",
		databaseURL: "https://mytherapy-8776f.firebaseio.com",
		projectId: "mytherapy-8776f",
		storageBucket: "mytherapy-8776f.appspot.com",
		messagingSenderId: "976009179852",
		appId: "1:976009179852:web:dec8630a2c7782e2f5c869",
		measurementId: "G-RT4VGFYJZH"
	};
	// Initialize Firebase
	firebase.initializeApp(firebaseConfig);
	firebase.analytics();
	</script>
</body>
</html>