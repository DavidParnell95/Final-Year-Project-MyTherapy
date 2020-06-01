const port = 8080;
const express = require("express");
const expressLayouts = require('express-ejs-layouts');

const admin = require('firebase-admin');
const serviceAccount = require("./serviceAccountKey.json");

//Firebase init
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://mytherapy-8776f.firebaseio.com",
});

var app = express();
var bodyParser = require('body-parser');

const indexRouter = require('./routes/index');
const entryRouter = require('./routes/entries');

app.set('view engine', 'ejs');
app.set('views', __dirname + '/views');
app.set('layout', 'layouts/layout');

app.use(expressLayouts);
app.use(express.static('public'));
app.use(bodyParser.urlencoded({limit: '10mb', extended: false}));
//app.use(bodyParser.json());

//Use routes
app.use('/',indexRouter);

app.listen(process.env.PORT || port);