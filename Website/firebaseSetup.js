var firebaseConfig = {
    apiKey: "AIzaSyA0gpT-psrA1oaXFmp6V4snnjWsg4xIx8w",
    authDomain: "mytherapy-8776f.firebaseapp.com",
    databaseURL: "https://mytherapy-8776f.firebaseio.com",
    projectId: "mytherapy-8776f",
    //storageBucket: "mytherapy-8776f.appspot.com",
    //messagingSenderId: "976009179852",
    appId: "1:976009179852:web:dec8630a2c7782e2f5c869",
    //measurementId: "G-RT4VGFYJZH"
};
  
// Initialize Firebase
firebase.initializeApp(firebaseConfig);
firebase.analytics();

//Make auth and firebase references
const auth = firebase.auth();
const db = firebase.firestore();

//Update firestore settings
db.settings({
    timestampsInSnapshots: true
})