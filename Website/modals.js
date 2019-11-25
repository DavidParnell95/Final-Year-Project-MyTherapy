/**** Modal Initialization *****
 * This script initializes modal components for my therapy
 * 
 */

document.addEventListener('DOMContentLoaded', function() {

    //Loads everything with their class set to "modal"
    var modals = document.querySelectorAll('.modal');
    M.Modal.init(modals);//Initalize modals found
  
    //Loads all collapsable items
    var items = document.querySelectorAll('.collapsible');
    M.Collapsible.init(items);//initializes collapsables
  
});

