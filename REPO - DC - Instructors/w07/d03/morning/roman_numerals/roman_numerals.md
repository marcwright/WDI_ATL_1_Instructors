##Roman Numerals

Your task is to write a JavaScript function, `romanize`, which takes a single number as input and returns the appropriate roman numeral as a string.

```javascript
romanize(73) // => 'LXXIII'
romanize(99) // => 'LXXIII'
romanize(2014) // => 'MMXIV'
```


####Roman Value Mappings
```javascript
{
  1000: "M",
   900: "CM",
   500: "D",
   400: "CD",
   100: "C",
    90: "XC",
    50: "L",
    40: "XL",
    10: "X",
     9: "IX",
     5: "V",
     4: "IV",
     1: "I"
}
```
