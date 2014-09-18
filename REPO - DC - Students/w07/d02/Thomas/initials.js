function initials(name) {
  _.each(name.split(" "), function(string) {
    var matches = str.match(/\b(\w)/g);
    var acronym = matches.join('');
  })
  return acronym;
}
