const express = require("express");
const expressLayouts = require('express-ejs-layouts');

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

//Use routes
app.use('/',indexRouter);
app.use('/entries',entryRouter);

app.listen(process.env.PORT || 8080);