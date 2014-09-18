#Angular Filters (basics)

Using filters in view templates

Filters can be applied to expressions in view templates using the following syntax:

    {{ expression | filter }}
E.g. the markup {{ 12 | currency }} formats the number 12 as a currency using the currency filter. The resulting value is $12.00.

Filters can be applied to the result of another filter. This is called "chaining" and uses the following syntax:

    {{ expression | filter1 | filter2 | ... }}
Filters may have arguments. The syntax for this is

    {{ expression | filter:argument1:argument2:... }}
E.g. the markup {{ 1234 | number:2 }} formats the number 1234 with 2 decimal points using the number filter. The resulting value is 1,234.00.

So you have seen the Currency and Number filters. What other filters exist you ask?

<table>
<tr><td colspan=2><h1>Filter list</h1></td></tr>
<tr><td><b>Name</b></td><td><b>Description</b></td></tr>
<tr><td>filter</td><td>Selects a subset of items from array and returns it as a new array.
</td></tr>
<tr><td>currency</td><td>Formats a number as a currency (ie $1,234.56). When no currency symbol is provided, default symbol for current locale is used.</td></tr>
<tr><td>number</td><td>Formats a number as text.</td></tr>
<tr><td>date</td><td>Formats date to a string based on the requested format.</td></tr>
<tr><td>json</td><td>Allows you to convert a JavaScript object into JSON string.</td></tr>
<tr><td>lowercase</td><td>Converts string to lowercase.</td></tr>
<tr><td>uppercase</td><td>Converts string to uppercase.</td></tr>
<tr><td>limitTo	</td><td>Creates a new array or string containing only a specified number of elements. The elements are taken from either the beginning or the end of the source array or string, as specified by the value and sign (positive or negative) of limit.</td></tr>
<tr><td>orderBy	</td><td>Orders a specified array by the expression predicate. It is ordered alphabetically for strings and numerically for numbers. Note: if you notice numbers are not being sorted correctly, make sure they are actually being saved as numbers and not strings.</td></tr>
</table>

Source

[Angular API Reference](https://docs.angularjs.org/api/ng)


	






