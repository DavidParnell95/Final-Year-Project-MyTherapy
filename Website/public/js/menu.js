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
                    <div>
                        <div class="field">User: </div>
                        <div>${doc.data().name}</div>
                    </div>
                    
                    <div>
                        <div class="UTYPE">${user.admin ? 'Admin' : ''}</div>
                    </div>
                    <div>
                        <div class="field">Institution:   </div>
                        <div>${doc.data().institution ? doc.data().institution != null:''}</div>
                    </div>
                    <div>
                        <div class="field">Institution Address:   </div>
                        <div>${doc.data().instAddress ? doc.data().instAddress != null: ''}</div>
                    </div>
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