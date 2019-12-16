//Get reference to entry list
const entryList = document.querySelector('.entries');

// setup guides
const setupEntries = (data) => {

    if(data.length)
    {
        let html = '';
        data.forEach(doc => {
            const entry = doc.data();
            const li = `
            <li>
                <div class="collapsible-header"> ${entry.date} </div>
                <div class="collapsible-body white"> ${entry.suds} </div>
                <div class="collapsible-body white">${entry.entry}</div>
            </li>
            `;
            html += li;
        });

        //Put in DOM 
        entryList.innerHTML = html
    }

    else
    {
        entryList.innerHTML = '<h5 class="center-align">Log in to view entries</h5>';
    }

};