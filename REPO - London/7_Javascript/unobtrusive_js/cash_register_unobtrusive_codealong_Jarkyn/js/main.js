/*
set a variable to track the current total
set a variable to store latest entry
get the new amount from input field
add latest amount to current total variable
format the latest amount
add formatted amount to list
format the total amount
update total ampunt in the view 
clear the input

namespacing
constructor function
private functions
bonus! add sound effect "chi-ching"
*/

var myApp = myApp || {} ;
var d = document;

myApp.CashRegister = function(){

	this.total = 0;
	this.latestEntry;
	this.totalElement = d.getElementById('total');
	this.inputElement = d.getElementById('newEntry');
	this.form = d.getElementById('entry');
	
	this.getNewEntry = function(){
		this.latestEntry = parseFloat(this.inputElement.value);
		// return newEntry;
	}

	this.addToTotal = function(){
		this.total += this.latestEntry;
	}

	this.updateEntries = function(entryValue){
		// var newItem = d.createElement('tr');
		var entry = '';
		entry = '<tr><td></td><td>';
		entry += this.currencyFormat(entryValue);
		entry += '</td></tr>';
		console.log(entry);
		d.getElementById('entries').innerHTML += entry;
	}

	this.updateTotal = function(){
		this.totalElement.innerText = this.currencyFormat(this.total);
	}

	this.currencyFormat = function(unformattedTotal){
		// console.log(unformattedTotal);
		// The toFixed() method formats a number using fixed-point notation.
		return '£' + unformattedTotal.toFixed(2);
	}

	this.clearInput = function(){
		this.inputElement.value = '';
	}

}

document.addEventListener('DOMContentLoaded', function(){
	var register = new myApp.CashRegister();
	console.log(register);

	register.form.addEventListener('submit', function(e){
		e.preventDefault();
		register.getNewEntry();
		register.addToTotal();
		register.updateEntries(register.latestEntry);
		register.updateTotal();
		register.clearInput();
	});
});

// *********** V1 without namespacing or constructor function **********

// var total = 0;
// var d = document;

// d.getElementById('entry').onsubmit = addToTotal;

// function addToTotal(){
// 	var newEntry = parseFloat( d.getElementById('newEntry').value );

// 	total += newEntry;
// 	updateTotal(); // call the function updateTotal()
// 	clearInput();
// 	addNewEntry(newEntry);
// 	return false;
// }
// function updateTotal(){
// 	// update the innerText of "#total" with the 
// 	// return value of the formatTotal function
// 	d.getElementById('total').innerText = formatTotal(total);
// }
// function formatTotal(unformattedTotal){
// 	return '$' + unformattedTotal.toFixed(2);
// 	// return formattedTotal;
// }
// function clearInput(){
// 	d.getElementById('newEntry').value = '';
// }
// function addNewEntry(entryValue){
// 	var entry = '';
// 	entry = '<tr><td></td><td>';
// 	entry += formatTotal(entryValue);
// 	entry += '</td></tr>';

// 	d.getElementById('entries').innerHTML += entry;
// }



















