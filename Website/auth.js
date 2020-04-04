/***** Script to handle authentication
 * Login 
 * Logout
 * Sign Up
 * Authentication state changes
 * Get data from database 
 */

// Add admin cloud function
const adminForm = document.querySelector('.admin-actions');

if(adminForm)
{
    adminForm.addEventListener('submit', (e) => {
        e.preventDefault();
        
        const adminEmail = document.querySelector('#admin-email').value;
        const addAdminRole = functions.httpsCallable('addAdminRole');
    
        //Invokes fucntion
        addAdminRole({
            email: adminEmail
        }).then(result =>{
            console.log(result)
        });
    });
}

//Listen for auth state changes
auth.onAuthStateChanged(user =>{
    console.log(user);//Log current user 

    //Check if theres a user logged in
    if(user)
    {
        console.log('User logged in', user);
        //Check if user attempting to log in is an admin 
        user.getIdTokenResult().then(IdTokenResult => {
            user.admin = IdTokenResult.claims.admin;
            setupUI(user);

        })

        //Get reference to DB and get data
        //onSnapshot reloads whenever db changes 
        db.collection('entries').onSnapshot(snapshot=>
        {
            console.log(snapshot.docs);
            //Set up entries to display
            setupEntries(snapshot.docs);

            //change menu items accordingly 
            setupUI(user);
        });
    }

    else
    {
        console.log('user logged out');
        
        //change menu items accordingly 
        setupUI();
        
        //remove entries list
        setupEntries([]);
    }
})

//Create new Entry
const createForm = document.querySelector('#create-form');
if(createForm)
{
    user = auth.user;
    console.log(user);
    createForm.addEventListener('submit', (e) =>{
        e.preventDefault();
    
        console.log(createForm.suds.value); 
        //Get current date
        var date = new Date();
    
        var dd = String(date.getDate()).padStart(2, '0');//get days
        var mm = String(date.getMonth() + 1).padStart(2, '0'); //get month, January is 0!
        var yyyy = date.getFullYear();//get year

        date = dd + '/' + mm + '/' + yyyy;//store in date
    
        //Create new record in collection
        db.collection('entries').add({
            date: date,//date = date calculated above ^ 
            suds: createForm.suds.value,//suds = value from drop down
            entry: createForm.summary.value,
        }).then(() => {
            
            //close modal & reset form
            const modal = document.querySelector('#modal-create');
            M.Modal.getInstance(modal).close();
            createForm.reset();
        }).catch(err => {//If error, run this instead of adding to DB 
            console.log(err.message);
        })
    })
}

//Get data from application form
const signupForm = document.querySelector('#signup-form');

//Checks if reference in page exists
if(signupForm)
{
    signupForm.addEventListener('submit',(e) => {
        //Prevent page from reloading when button pressed
        e.preventDefault();

        //Get user info from form
        const email = signupForm['signup-email'].value;//emailconst instAdd = signupForm['signup-InstAdd'].value;//institution address
        const passwrd = signupForm['signup-password'].value;//password

        //console.log(name,email,inst,instAdd);

        //Sign up the user
        //Async therefore must wait for it to complete
        auth.createUserWithEmailAndPassword(email,passwrd).then(cred =>{
            console.log(cred);
            
            //Create entry in users collection
            //takes credential and access the user from that 
            return db.collection('users').doc(cred.user.uid).set({
                name: signupForm['signup-name'].value,
                institution: signupForm['signup-inst'].value,
                instAddress: signupForm['signup-addr'].value
            });

            
        }).then(() => {
            //close modal & reset form
            const modal = document.querySelector('#modal-apply');
            M.Modal.getInstance(modal).close();
            signupForm.reset();
        });
    });
}

// Create Patient Account
const newPatientForm = document.querySelector('#NewPatient');

if(newPatientForm)
{

    newPatientForm.addEventListener('submit',(e) => {

        e.preventDefault();
        //Get user info from form
        const email = newPatientForm['patient-email'].value;//emailconst instAdd = signupForm['signup-InstAdd'].value;//institution address
        const passwrd = newPatientForm['patient-password'].value;//password

        console.log(email);

        //Sign up the user
        //Async therefore must wait for it to complete
        auth.createUserWithEmailAndPassword(email,passwrd).then(cred =>{
            console.log(cred);
        }).then(() => {
            newPatientForm.reset();
        });
    });
}

//logout
//Get log in button from page
const logout = document.querySelector('#logout');

logout.addEventListener('click', (e) =>{
    e.preventDefault();//Prevent page from reloading when pressed

    //Async, waits for sign out to complete
    auth.signOut()
});

//log in
//Get log in form data
const loginForm = document.querySelector('#login-form');

if(loginForm)
{
    loginForm.addEventListener('submit', (e) =>{
        e.preventDefault();

        //Get user info
        const email = loginForm['login-email'].value;
        const password = loginForm['login-password'].value;

        //log in the user
        auth.signInWithEmailAndPassword(email, password).then((cred) =>{
        
            //close model and reset form
            const modal = document.querySelector('#modal-login');
            M.Modal.getInstance(modal).close;//close modal
            loginForm.close();
        })
    })
}