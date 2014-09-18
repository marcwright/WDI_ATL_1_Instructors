#Sku

* **::new**
  * should set the provided product code.
  * should set the provided product name.
  * should set the provided price.
  * should set the provided quantity.
* **\#purchase**
  * should decrease its available quantity by one.

#VendingMachine

* **\#get_sku**
  * should return a Sku object for a valid code.
  * should return *nil* for an invalid code.
* **\#insert_cash**
  * should add credit.
  * should add new credit to existing credit.
* **\#enter_code**
  * should set the code state.
* **\#refund**
  * should cancel all credit.
  * should return all previous credit as change.
  * should add new change to existing change.
  * should clear the code state.
  * should clear the status message state.
* **\#vend**
  * **When entered SKU code is invalid**
    * should have status message prompt for a valid code.
    * should clear the code state.
  * **When entered SKU code is out of stock**
    * should have status message prompt 'out of stock' status.
    * should clear the code state.
  * **When entered SKU is valid, but credit is insufficient**
    * should have status message prompt the user to insert additional cash.
    * should have status message include the required cash ammount.
  * **When entered SKU is valid, and credit is sufficient**
    * should decrement the purchased SKU's quantity.
    * should deduct the SKU's price from credit before dispensing change.
    * should add the purchased product into purchases.
    * should add new purchases into existing purchases.
