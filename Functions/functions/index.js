const functions = require('firebase-functions');
const app = require('express')();
const FBmw = require('./util/fbMiddleware');

const {db} = require('./util/admin');


//Set Firebase region to the EU
exports.api = functions.region('europe-west1').https.onRequest(app);