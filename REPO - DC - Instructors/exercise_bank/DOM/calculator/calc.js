var _displayNumber = "0";
var _storedNumber = "";
var _operation = "";

function addDigit(digit) {
	if (_displayNumber == "0" || _storedNumber != "") {
		_displayNumber = digit.toString();
	} else {
		_displayNumber += digit;
	}
	updateDisplay();
}

function setOperation(op) {
	_operation = op;
	_storedNumber = _displayNumber;
	updateDisplay();
}

function evalOperation() {
	var a = parseInt(_storedNumber);
	var b = parseInt(_displayNumber);
	
	switch(_operation) {
		case "+": _displayNumber = a + b; break;
		case "-": _displayNumber = a - b; break;
		case "*": _displayNumber = a * b; break;
		case "/": _displayNumber = a / b; break;
	}
	
	_operation = "";
	_storedNumber = "";
	updateDisplay();
}

function clear() {
	_presetNumber = "";
	_displayNumber = "0";
	updateDisplay();
}

function updateDisplay() {
	document.getElementById("display").innerHTML = _displayNumber;
}