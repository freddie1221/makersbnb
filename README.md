# MakersBnB #

### Stack ###

* Ruby Front/Back
* Sinatra Web Framework
* Active Record ORM
* Sqlite3 Database

### Specifiation ###
#### MVP ####

- Users can register on the website
- Users can log in having previously registered
- Users can list properties for rental
- Users can see properties listed
  - Listed properties show a description of the property and price per night

#### Further Features ####

- Offer a range of dates where their space is available.
- Request any space for one night, and this should be approved by the user that owns that space.
 - Nights for which a space has already been booked should not be available for users to book that space.
 - Until a user has confirmed a booking request, that space can still be booked for that night.

## User Stories ##

#### MVP ####
##### User Story 1 #####
* As a Host,
* So that I can list a space
* I can sign up to MakersBnB

##### User Story 2 #####
* As a Host
* So that I can use the product for my multiple properties
* I can list multiple spaces

##### User Story 3 #####
* As a Host
* So that I can provide relevant information to potential Guests
* I can provide headline details about my property/s

##### User Story 4 #####
* As a Guest
* So that I can book a room
* I can request to hire a property

#### Further Features ####

##### User Story 5 #####
* As a Host.
* So that the Guest knows if there is a suitable date.
* Can show the range of dates my space/s are available.

##### User Story 5.5 #####
* As a Host
* So that I know who is staying at my property
* I can confirm a booking request.

##### User Story 6 #####
* As a Guest
* So that a space cannot be double booked
* Dates with a confirmed booking will not be available to others.

##### User Story 7 #####
* As a Host
* So that I do not miss potential Guests
* Spaces are available to Guests until a request is confirmed


## CRC Cards ##

#### MVP ####

Account

```
Responsibility    | Collaborator
--------------------------------
knows, name       |
     , email      |
     , id         |
has a password    |
```

Property

```
Responsibility     | Collaborator
---------------------------------
knows, name        | User (host)
     , price       |
     , owner       |
     , description |
```

There is a one to many relationship between an account and listed properties, one user can list multiple properties.
As such it is necessary to have a table for properties seperate from accounts, each property listed will be associated with a user account.
Making this association in Active Record introduces a secondary feature, 
whereby in deleting an account from the 'accounts' database any data in the 'properties' table tied to that account will also be removed.

#### Further Features ####

A feature allowing users to make booking requests on listed properties introduces a many to many relationship.
One property can have many accounts request a booking and one account can make many booking requests.
Each individual booking will be made for a particular listing, day and account. The owner of the listing can then confirm or deny the request

Booking

```
Responsibility        | Collaborator
------------------------------------
knows, property       | User (guest)
     , guest          |
     , date of stay   |
     , if confirmed   |
```

## Tables ##

#### MVP ####

Account

```
id     |   name    |   email     |  password
--------------------------------------------
1      | John      | ..@...com   |  ******
2      | Mary      | ..@...co.uk |  ******
```

Property

```
id    | owner id  |    name     |  description  |  £/night
----------------------------------------------------------
1     |    1      |  ........   |   .........   |  £200
2     |    1      |  ........   |   .........   |  £120
```

These two tables are all that's needed to satisfy the MVP requirements. The 'account' is populated as users register on the site,
passwords are stored as hashes using Bcrypt to ensure security. Email and password are used to log into the site.
The 'property' table is populated when a user lists a property, the current users id is tied to the listing.
Property name, description, and price are displayed on the property listing page.

#### Further Features ####

Bookings

```
id|  property id  |  requester id  |  date of stay  |  confirmed
--|-------------------------------------------------------------
1 |        8      |        1       |    12/03/18    |    true
2 |        6      |        1       |    23/11/18    |    false
3 |        6      |        4       |    02/01/19    |    false
4 |        3      |        9       |    29/02/20    |    true
```

Any booking request made will be stored in the bookings table. 
Bookings will have an associated property id, requester id, date of stay and confirmation status. 

