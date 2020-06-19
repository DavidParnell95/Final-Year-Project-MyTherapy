const express = require('express');
const bodyParser = require('body-parser');

const router = express.Router();

router.use(express.urlencoded({extended: false}))

router.get('/', function(req,res){
    res.render('index.ejs')
}),

router.get('/entries', function(req,res)
{
    res.render('entries.ejs')
})

/***** END ENTRIES ROUTES *****/
module.exports = router;