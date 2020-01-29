// changes UI Links available depending on log in status 


const loggedOutLinks = document.querySelectorAll('.logged-out');
const loggedInLinks = document.querySelectorAll('.logged-in');
const accountDetails = document.querySelector('.account-details');//Get account details section of page

const setupUI = (user) => {
    if(user)
    {
        //account
        db.collection('users')
        .doc(user.uid).get().then(doc =>
            {
        
                if(user)
                {
                    const html = `
            
                    <div>
                        <div>User: ${doc.data().name}</div>
                        <div>User Type:</div>
                        <div>Institution:${doc.data().institution}</div>
                        <div>Institution Address:${doc.data().instAddress}</div>
                    </div>
                    `;
                
                    accountDetails.innerHTML=html;//Add details to html#
                };
               
            });
        
        //toggle UI elemnts
        loggedInLinks.forEach(item => item.style.display = 'block');
        loggedOutLinks.forEach(item => item.style.display = 'none');
    }

    else
    {
        //clear account info
        accountDetails.innerHTML='';

        //toggle UI elemnts
        loggedInLinks.forEach(item => item.style.display = 'none');
        loggedOutLinks.forEach(item => item.style.display = 'block');
    }
}