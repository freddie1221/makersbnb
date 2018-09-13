# MakersBnB #

### Stack ###

Ruby Front/Back
Sinatra Web Framework
Active Record ORM
Postgresql Database

### Specifiation ###

This application allows signed-up users to:

- List a new space.
- List multiple spaces.
 - Name their space, provide a short description of the space, and a price per night.
- Offer a range of dates where their space is available.
- Hire any space for one night, and this should be approved by the user that owns that space.
 - Nights for which a space has already been booked should not be available for users to book that space.
 - Until a user has confirmed a booking request, that space can still be booked for that night.

## User Stories ##

### User Story 1 ###
* As a Host,
* So that I can list a space
* I can sign up to MakersBnB

### User Story 2 ###
* As a Host
* So that I can use the product for my multiple properties
* I can list multiple spaces

### User Story 3 ###
* As a Host
* So that I can provide relevant information to potential Guests
* I can provide headline details about my property/s

### User Story 4 ###
* As a Host.
* So that the Guest knows if there is a suitable date.
* Can show the range of dates my space/s are available.

### User Story 5 ###
* As a Guest
* So that I can book a room
* I can request to hire a property

### User Story 5.5 ###
* As a Host
* So that I know who is staying at my property
* I can confirm a booking request.

### User Story 6 ###
* As a Guest
* So that a space cannot be double booked
* Dates with a confirmed booking will not be available to others.

### User Story 7 ###
* As a Host
* So that I do not miss potential Guests
* Spaces are available to Guests until a request is confirmed


CRC Cards
---------

User

```
Responsibility    | Collaborator
--------------------------------
knows, name       |
     , email      |
                  |
```

Property

```
Responsibility     | Collaborator
---------------------------------
knows, location    | User (host)
     , price       |
     , owner       |
     , description |
```

These CRC cards display what will be needed for an MVP.
CRC cards for Bookings will be necessary for future features.

Booking

```
Responsibility        | Collaborator
------------------------------------
knows, property       | User (guest)
     , guest          |
     , date of stay   |
     , if confirmed   |
```

Tables
------

Account

```
id     |   name    |   email     |
----------------------------------
1      | John      | ..@...com   |
2      | Mary      | ..@...co.uk |
```

Property

```
id    | owner id  |   name    |   location   |   £/night
--------------------------------------------------------
1     |    1      | Clouds    |   ........   |   £200
2     |    1      | Wood      |   ........   |   £120
```

These two tables should be enough to satisfy the MVP.
When users begin booking rooms a Bookings table will be required



## To get this application working locally
* shell $ git clone git@github.com:freddie1221/makersbnb.git
* shell $ bundle install
* shell $ rake db:setup
* shell $ rake db:seed
* shell $ bundle exec rackup
