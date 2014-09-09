describe('#isPalindrome', function(){
  it('returns true for an odd palindrome', function(){
    expect(isPalindrome('Level')).toBeTruthy();
  });

  it('returns true for an even palindrome', function(){
    expect(isPalindrome('redder')).toBeTruthy();
  });

  it('returns false for a non-palindrome', function(){
    expect(isPalindrome('banana')).toBeFalsy();
  });
});