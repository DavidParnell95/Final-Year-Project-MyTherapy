// changes UI Links available depending on log in status 


const loggedOutLinks = document.querySelectorAll('.logged-out');
const loggedInLinks = document.querySelectorAll('.logged-in');

const setupUI = (user) => {
    if(user)
    {
        //toggle UI elemnts
        loggedInLinks.forEach(item = item.style.display = 'block');
        loggedOutLinks.forEach(item => item.style.display = 'none');
    }

    else
    {
        //toggle UI elemnts
        loggedInLinks.forEach(item => item.style.display = 'none');
        loggedOutLinks.forEach(item => item.style.display = 'block');
    }
}