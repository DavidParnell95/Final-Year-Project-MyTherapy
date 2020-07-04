const { admin ,db} = require("../util/admin");
const config = require("../utils/config");

const firebase = require("firebase");
firebase.initializeApp(config);

//Register User
exports.signup = (req,res) => {
    const newUser = { 
        email: req.body.email,
        password: req.body.password,
        confirmPassword: req.body.confirmPassword,
        handle: req.body.handle,
    };

    let token, userID;
    db.doc(`/users/${newUser.handle}`).get()
    .then((doc) => {
        if(doc.exists)
        {
            return res.status(400).json({handle : "username already exists"})
        }

        else{
            return firebase.auth()
            .createUserWithEmailAndPassword(newUser.email, newUser.password);
        }
    }).then((data) => {
        userId = data.user.uid;
        return data.user.getIdToken();
    })
    .then((idToken) => {
        token = idToken;
        const userCredentials = { 
            handle: newUser.handle,
            email: newUser.handle,
            createdAt: new Date().toISOString(),
            userId
        };

        return db.doc(`/users/${newUser.handle}`).set(userCredentials);
    })
    .then(() =>{
        return res.status(201).json({token});
    })
    .catch((err) =>{
        console.error(err);

        if(err.code === "auth/email-already-in-user")
        {
            return res.status(400).json({ email: "Email already in user"});
        }

        else{
            return res.status(500).json({general: "something went wrong, try again"});
        }
    });
};

//Log in User 
exports.login = (req,res) => {
    const user = {
         email: req.body.email,
         password: req.body.password,
    };

    firebase.auth().signInWithEmailAndPassword(user.email, user.password)
    .then((data) => {
        return data.user.getIdToken();
    })
    .then((token) => {
        return res.json({ token});
    })
    .catch((err) => {
        console.error(err);
        return res.status(403).json({general: "Incorrect Email or Password"});
    });
};