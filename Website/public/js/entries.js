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
            <li class="coll-container">
                    <div class="collapsible-header">
                        Date: ${entry.date} <nbsp>
                        <p style="float: right">SUDs: ${entry.suds}</p>
                    </div>
                
                    <div class="collapsible-body">
                        <p>${entry.entry}</p>
                    </div>
            </li>
            `;
            html += li;
        });

        //Put in DOM 
        if(entryList)
        {
            entryList.innerHTML = html
        }
    }

    else
    {
        if(entryList)
        {
            entryList.innerHTML = '<h5 class="center-align">Log in to view entries</h5>';
        }
    }

};

// setup materialize components
document.addEventListener('DOMContentLoaded', function() {
  
    var items = document.querySelectorAll('.collapsible');
    M.Collapsible.init(items);
  
});