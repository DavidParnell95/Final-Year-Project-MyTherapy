const express = require('express');
const router = express.Router();

router.use(express.urlencoded({extended: false}))

router.get('/', function(req,res){
    res.render('index.ejs')
})

module.exports = router;