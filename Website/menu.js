// changes UI Links available depending on log in status 


const loggedOutLinks = document.querySelectorAll('.logged-out');
const loggedInLinks = document.querySelectorAll('.logged-in');
const accountDetails = document.querySelector('.account-details');//Get account details section of page

const adminItems = document.querySelectorAll('.admin');

const setupUI = (user) => {
    if(user)
    {
        //if the user is an admin
        if(user.admin)
        {
            //Show admin ui elements
            adminItems.forEach(item => item.style.display = 'block');
        }
        
        //account
        db.collection('users')
        .doc(user.uid).get().then(doc =>
        {
        
            if(user)
            {
                const html = `
            
                <div>
                    <div>User: ${doc.data().name}</div>
                    <div>${user.admin ? 'Admin' : ''}</div>
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
        adminItems.forEach(item => item.style.display = 'none');

    }
}