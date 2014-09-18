describe( "Bank", function() {
  var bank;
  beforeEach( function() {
    bank = new Bank();
  });

  describe( "new bank", function() {
    it( "should have a checking account", function() {
      expect( bank.checking instanceof Account ).toBeTruthy();
    });

    it( "should have a savings account", function() {
      expect( bank.savings instanceof Account ).toBeTruthy();
    });
  });

  describe( "when insufficient funds are available in the requested account", function() {
    beforeEach(function() {
      bank.checking.deposit( 100 );
      bank.savings.deposit( 100 );
    });

    it( "should withdraw all money from the requested account and the remainder in the other account", function() {
      bank.withdraw( "checking", 150 );

      expect( bank.checking.balance ).toEqual( 0 );
      expect( bank.savings.balance ).toEqual( 50 );
    });

    it( "should withdraw all money from both accounts, if available", function() {
      bank.withdraw( "checking", 200 );

      expect( bank.checking.balance ).toEqual( 0 );
      expect( bank.savings.balance ).toEqual( 0 );
    });

    it( "should not withdraw any money, if there are insufficient funds across both accounts", function() {
      bank.withdraw( "checking", 300 );

      expect( bank.checking.balance ).toEqual( 100 );
      expect( bank.savings.balance ).toEqual( 100 );
    });
  });
});