# Calculate least amount of change from a cash transaction

You are writing code to run on a self-service checkout.

When a transaction is made in cash, you have to calculate the change to be given in the fewest coins possible.

The coins available are £2, £1, 50p, 20p, 10p, 5p, 2p and 1p.

For example:
- A customer pays for £15.36 worth of goods with a twenty-pound note. They should receive change of 2x£2, 1x50p, 1x10p, and 2x2p.
- A customer pays for £4.51 worth of goods with a five-pound note. They should receive change of 2x20p, 1x5p, and 2x2p.


Additionally, extend your working code to allow the checkout to keep track of a "float" of coins available to it. When it runs out of one coin it will continue to issue change based on the other coins available.

For example, if the checkout has run out of 50p and 5p coins, our previous examples will return:
- 2x£2, 3x20p, and 2x2p.
- 2x20p, 4x2p, and 1x1p.


Lastly, the checkout should enable a notification when it can no longer make change.

