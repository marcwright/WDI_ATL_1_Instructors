// GO TO:
// https://collegerealitycheck.com/en/colleges/195003/

// Get a handle on the selections model:
var sel = require('common/selections-m');


// Add/remove a school selection:
sel.setSelection(209825, 'University of Portland', 2);
sel.clearSelection(209825);


// Clear all selections:
sel.clearSelection();