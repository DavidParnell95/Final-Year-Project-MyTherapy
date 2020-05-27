/*** Router for entries pages: ***
    View
    Add
    Edit
************************************/
const express = require('express')
const router = express.Router()

router.get('/', function(req,res){
    res.render('entries.ejs');
})

module.exports = router;