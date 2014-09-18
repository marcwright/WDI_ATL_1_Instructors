# Wat

## Concatenation

`[] + [] ` (== ""); + means either 'add two numbers', 'concatenate two strings', or 'make this number positive'. And JS will convert objects automatically. [] gets coerced to an empty string, and empty plus empty is empty. 

`[] + {} ` (== "[Object object]"); [] gets co-erced to an empty string, and {} is an object literal. This gets its toString method called, which returns "[Object object]", hence the result. 

`{} + [] ` (== 0); {} is interpreted as an empty code block, so is essentially a no-op. Which leaves us with "+ []", which JS interprets as a positive number. Number coercion goes via a string; [] -> "" -> 0. 

`{} + {} ` (== NaN); {} goes to an empty code block, the second goes to "[Object object]", which coerces to NaN as a number. 


## Arrays and joining

`Array(16)` 

`Array(16).join("wat")`

`Array(16).join("wat" + 1)`

`Array(16).join("wat" - 1) + " Batman!"


## NaN

- There's an operator called 'typeof'. 
- NaN stands for 'Not a number'. 
  - `typeof 5` (Number)
  - `typeof "foo"` (String)
  - `typeof {}` (Object)
  - `typeof null` (Object... wat?)
  - `typeof undefined` ("undefined")
  - `typeof NaN` (Number... wat?)
  - `NaN == NaN` (false)... `NaN === NaN` (still false)


## Transitivity

- What's `==` (equality)? 
- And some things in JS are falsey, right? 
  - `'' == '0'` (False; we'd expect that, as a non-empty string is not falsey.)
  - `'' == 0` (True; both empty strings and 0 is falsey.)
  - `0 == '0'` (True... wat?)

- `false == 'false'` (False; we'd expect that, as a non-empty string is not falsey.)
- `if ('0') { console.log("Truthy"); }` ("Truthy")
- `false == '0'` (True... wat?)

- `if (' \t\r\n ') { console.log("Truthy!"); }` ("Truthy")
- `' \t\r\n ' == false` (True... so much for non-empty strings always being true.)
- Use `===` instead. 

- Why the FUCK?
  - Equality: "If the two operands are not of the same type, JavaScript converts the operands then applies strict comparison. If either operand is a number or a boolean, the operands are converted to numbers if possible." 
- Lol: http://stackoverflow.com/a/7615236 (a graphic of what things are equal to each other.)

- `'false' == false` // False, as we'd expect. 
- `'false' == false + []` // True.

# In summary
- JavaScript: http://i.imgur.com/uFDRzSN.gif
- JavaScript: http://i.imgur.com/pT4Ia.gif
- JavaScript: http://i.imgur.com/id6A0sh.gif
