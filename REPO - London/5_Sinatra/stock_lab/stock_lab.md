# Stock lab (c. 2hr 30hr)

Students can work individually or in groups on this assignment.

- Create a webpage.
- Add a header and footer.
- Add a field for symbol with a submit button.
- Then print out the stock symbol and the current price.
- Use the yahoofinance gem.
- You can include the normalize.css/reset.css files for your styling.

- share this code snippet with the students, but *don't* go into depth about its inner workings - this is a Sinatra routing practice lesson, not a YahooFinance gem lesson :-)

```
    require 'yahoofinance'

    def self.get_standard_quotes(symbol)
      YahooFinance::get_standard_quotes(symbol)[symbol] rescue nil
    end

```

Example stock codes:

- AAPL
- GOOG
- AMZN
- MSFT
- GE
- CAKE
- ZZ
- FIZZ
- FUN
