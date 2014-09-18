- Write some code to allow a user to configure a building.
  - Create a new flat
  - Register a new tenant
  - Add a tenant to a flat.
- Don't worry about saving it to a file for now, that's too complex. 
- Don't forget to check things; you shouldn't allow 100 people to move in to a 2 bedroom flat...

- Sometimes flats aren't available to rent because they're being renovated. 
  - They shouldn't have any occupants, but they're not vacant, and shouldn't 
    let people move in.
  - Update the management program so it can mark flats as undergoing renovation.
  - And update the other areas of your program so people can't move in. 

- Write some utility methods that help the landlord manage the entire building.
  - Evict everyone in the building in one go. 
  - List the names of all tenants. 
  - Display the number of occupied & vacant flats. 
  - Display the total rental income of the building. 

- Allow the landlord to manage multiple buildings. 
  - You'll need something to store your multiple buildings...
    - Maybe an array? Maybe a hash? 
  - And you'll need to let the user decide which building to work with. 
    - And probably store that as 'current building' somewhere. 
