define({
  // Formats a cents-integer into a dollars/cents string:
  // Example: 150 >> "$1.50"
  formatCents: function(cents) {
    return '$' + (cents/100).toFixed(2);
  },

  // Parses a float string into a cents-integer:
  // Example: "1.50" >> 150
  parseCents: function(str) {
    var cents = parseFloat(str);
    return isNaN(cents) ? 0 : cents * 100;
  }
});