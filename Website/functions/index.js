// File to hold cloud functions to be deployed to firebase 

const functions = require('firebase-functions');
const admin = require('firebase-admin');//Get admin SDK

admin.initializeApp();

//Add admin role to user
//onCall makes callable from front end 
exports.addAdminRole = functions.https.onCall((data, context) =>{
    
    //Check request is made by a super user
    //If requester isn't an admin, error returned
    if( context.auth.token.admin !== true){
        return { error: 'PERMISSION DENIED'}
    }

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

//Add patient Role to user 
exports.addSuperRole = functions.https.onCall((data, context) =>{

    //check if account was made by a super user
    if( context.auth.token.admin !== true)
    {
        return { error: 'PERMISSION DENIED'}
    }

    //Get user and add custom claim
    return admin.auth().getUserByEmail(data.email).then(user => {
        return admin.auth().setCustomUserClaims(user.uid, {
            super: true//Set user as Super admin
        });
    }).then(() => {
        //return response to front end
        return{
            message: `${data.email} has been made a super user`
        }
    }).catch(err => {
        return err;
    });
});