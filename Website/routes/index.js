const express = require('express');
const cookieParser = require("cookie-parser");
const bodyParser = require('body-parser');
const csurf = require("csurf");

//Number of days cookie should be valid for
var expireDays = 50;

const admin = require('firebase-admin');
const serviceAccount = require("../serviceAccountKey.json");

/***** AUTHENTICATION ROUTES *****/
//Firebase init
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://mytherapy-8776f.firebaseio.com",
});

const router = express.Router();

const csurfMW = csurf({cookie : true})

router.use(express.urlencoded({extended: false}))
router.use(bodyParser.json());
router.use(cookieParser());
router.use(csurfMW);


//Takes all requests and sets cookies
router.all("*", (req,res,next) =>{
    res.cookie("XSRF-TOKEN", req.csrfToken());
    next();//Passes to next
});

router.get('/', function(req,res){
    res.render('index.ejs')
})

//Login
router.post("/sessionLogin", (req,res) => {
    const idToken = req.body.idToken.toString();//Pass id token as string
    
    // expires in: secs * mins * days then convert to miliseconds by *1000 
    const expiresIn = 60 * 60 *24 * days * 1000;

    admin.auth().createSessionCookie(idToken, {expiresIn}).then(
        (sessionCookie) => {
            //HTTP only so only back end can access it 
            const options = {maxAge: expiresIn, httpOnly: true};

            res.cookie("session", sessionCookie, options);
            res.end(JSON.stringify({status: "success"}));
        },
        //In case of error
        (error)=>{
            res.status(401).send("UNAUTHORIZED REQUEST");
        }
    );
});

//Logout
router.get("/logout", (req, res) => {
    res.clearCookie("session");//Clear cookie
    res.redirect("/");//return to home page
    console.log("logging out");
})

/***** END AUTHENTICATION ROUTES *****/


/***** ENTRIES ROUTES *****/
router.get("/entries", function (req,res){
    //Try to get session from cookie
    const sessionCookie = req.cookies.session || "";

    admin.auth().verifySessionCookie(
        sessionCookie, 
        true//check if revokes
    ).then(() => {
        res.render("entries.ejs");
    })

    //If redirect to home page
    .catch((error) =>{
        res.redirect("/");
    });
});

/***** END ENTRIES ROUTES *****/
module.exports = router;