const { admin, db } = require('./admin');
const { decode } = require('firebase-functions/lib/providers/https');

module.exports = (req, res, next) => {
    let idToken;

    if(req.headers.authorization && 
        req.headers.authorization.startsWith('Bearer'))
        {
            idToken = req.headers.authorization.split('Bearer ')[1];
        }

        else{
            console.error('No Token Found');
            return res.status(403).json({error: 'Unauthorized'});
        }

        admin.auth().verifyIdToken(idToken).then(
            (decodeToken)=>{
                return db.collection('users').where(
                    'userID', '==', req.user.uid
                ).limit(1).get();
            }
        ).then((data) => {
            req.user.handle = data.docs[0].data().handle;
            return next();
        }).catch((err) => {
            console.error('Error while verifying' ,err);
            return res.status(403).json(err);
        });
};