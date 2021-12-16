import 'main.dart';
export 'main.dart';

/* Requirement LO4 : This program was created with an object oriented approach,
that is because it makes use of classes and objects to reuse code and create
objects such as "apples" and "oranges" which represent things being dealt with
in the program. If this program were procedural, it would have been written top
to bottom, rewriting whatever code was necessary every time it was to be used
and working sequentially like assembly language. If this were functional it
would do most of the things being done by objects with functions instead. If
I needed to apply the exponential formula to the price of farmers, which here
I do with the overloaded operator "*," I would instead do that with a function.
Same with all other methods implemented through objects, which would instead
be done through functions. */

class User { // Requirement LO1 and LO1a

  String username;

  User() // Requirement LO1c
      : username = "Guest";

  User.withUsername(String iUsername) // Requirement LO1b
      : username = iUsername;

}

class Fruit { // Requirement LO1 and LO1a

  int total;
  int fruits;

  Fruit() // Requirement LO1c
      : total = 0, fruits = 0;

}

/* Requirement LO2a : The way inheritance works is that a class can inherit
* from another class, thus receiving all attributes from the parent class.
* Inheritance usually signifies an "is a" relationship, such as below where the
* "Apple" class inherits from the "Fruit" class because an apple is a fruit.
* Visibility has to do with private and public members of a class. If a method
* is not going to be accessed outside of a class, for example, it should be set
* to private. In order to access private members you should use getters and
* setters, that way they can only be affected indirectly. */

class Apple extends Fruit { // Requirement LO1 , LO1a and LO2

  // fields
  int apples;

  // apple farmer variables, # of and cost
  int appleFarmer;
  int appleFarmerCost;

  operator *(Apple apple) => apple.appleFarmerCost =
      apple.appleFarmerCost * (apple.appleFarmer + 1);

  Apple() // Requirement LO1c
      : apples = 0 , appleFarmer = 0 , appleFarmerCost = 6;
}

class Orange extends Fruit { // Requirement LO1 , LO1a and LO2

  // fields
  int oranges;

  // apple farmer variables, # of and cost
  int orangeFarmer;
  int orangeFarmerCost;

  operator *(Orange orange) => orange.orangeFarmerCost =
      orange.orangeFarmerCost * (orange.orangeFarmer + 1);

  Orange() // Requirement LO1c
      : oranges = 0 , orangeFarmer = 0 , orangeFarmerCost = 6;
}

