const {db} = require('../util/admin');

exports.getAllEntries = (req,res) => {
    db.collection('entries').orderBy('date', 'desc')
    .get().then((data) => {
        let entries = [];

        data.foreach((doc) => {
            entries.push({
                //TODO: ENTRY CONTENTS
            });
        });

        return res.json(entries);
    })
    .catch((err) =>{
        console.error(err);
        res.status(500).json({error: err.code});
    });
};

//New Entry
exports.createNewEntry = (req,res) => {
    if(req.body.body.trim() === '')
    {
        return res.status(400).json({body: "body must not be empty"});
    }

    const newEntry = {
        date: req.body.date,
        suds: req.body.suds,
        entry: req.body.entry,
        uid: req.user.uid
    };

    db.collection('entries').add(newEntry).then((doc) =>{
        const resEntry = newEntry;
        
        //TODO: decide on whether doc id to be used 
        res.json(resEntry)
    });
};

//Get single entry

