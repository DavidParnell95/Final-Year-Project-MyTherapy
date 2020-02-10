//Get reference to entry list
const entryList = document.querySelector('.entries');

// setup entries
const setupEntries = (data) => {

    if(data.length)
    {
        let html = '';
        data.forEach(doc => {
            const entry = doc.data();
            const li = `
            <li>
                <div class="collContainer">
                    <button type="button" class="collapsible">
                        Date: ${entry.date} 
                        SUDs: ${entry.suds}
                    </button>
                
                    <div class="content">
                        <p>${entry.entry}</p>
                    </div>
                </div>
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
