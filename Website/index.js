/***** Firebase operations file ***** 
 * Javascript file to hangle firebase operations
 * Contains the following:
 * 1. AuthState change - checks if user is signed in and alters home page
 * 2. Login - Log into MyTherapy using given credentials
 * 3. Logout - Log current user out 
 * 
 *****/


//Runs whenever the authorization state has changed  
firebase.auth().onAuthStateChanged(function(user) {

    if(user)
    {
        document.getElementById("user_div").style.display = "block";
        document.getElementById("login_div").style.display = "none";

        var user = firebase.auth().currentUser;

        //User signed in
        if (user != null) {
        var email_id = user.email;//Get current user

        //Change greeting message to greet logged in user
        document.getElementById("user_para").innerHTML = "Welcome User: " +email_id;
        }
    }

    // No user is signed in.
    else 
    {
        //Hide user orientated content and show log in form
        document.getElementById("user_dive").style.display="none";
        document.getElementById("login_div").style.display="block";
    }
});

function login()
{

    var userEmail = document.getElementById("email").value;//get user email from page
    var userPwrd = document.getElementById("passwrd").value;//get user password from page

    //Log in w/ email & password
    firebase.auth().createUserWithEmailAndPassword(userEmail, userPwrd).catch(function(error) {
        // Handle Errors here.
        var errorCode = error.code;
        var errorMessage = error.message;
        
        window.alert("Error: " +errorCode +" : "+ errorMessage)

    });
}

function logout()
{
    firebase.auth().signOut();
}