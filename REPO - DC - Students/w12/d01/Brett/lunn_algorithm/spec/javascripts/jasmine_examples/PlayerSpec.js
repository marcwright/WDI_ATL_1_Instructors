describe("valid", function() {

  it("1234567890123456 is not valid", function() {
    expect(valid(1234567890123456)).toBe(false);
  });

  it("4408041234567893 is valid", function() {
    expect(valid(4408041234567893)).toBe(true);
  });

  it("38520000023237 is valid", function() {
    expect(valid(38520000023237)).toBe(true);
  });

  it("4222222222222 is valid", function() {
    expect(valid(4222222222222)).toBe(true);
  });

});
