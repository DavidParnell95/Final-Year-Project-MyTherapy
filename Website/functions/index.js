// File to hold cloud functions to be deployed to firebase 

const functions = require('firebase-functions');
const admin = require('firebase-admin');//Get admin SDK

admin.initializeApp();

//Add admin role to user
//onCall makes callable from front end 
exports.addAdminRole = functions.https.onCall((data, context) =>{

    //get user & add custom claim (admin)
    return admin.auth().getUserByEmail(data.email).then(user => {
        return admin.auth().setCustomUserClaims(user.uid, {
            admin: true//Set user as admin
        });
    }).then(() => {
        //return response to front end
        return{
            message: `${data.email} has been made an admin`
        }
    }).catch(err => {
        return err;
    });
});