// necessary import for using material features
import 'package:flutter/material.dart';
import 'index.dart'; // Requirement LO1a

/* Requirement LO3 : The program starts by prompting the user for an username,
once the user has inputted the username the boolean nameInputted is toggled,
which allows the rest of the program to be seen. Essentially there are a series
of three tutorials which must be cleared until the user can see the full app.
These tutorials are displayed using three widgets, and the home widget which
is constantly running checks whether or not the requirements have been met,
toggling boolean variables which stop the previous tutorial from being
displayed and start displaying the new one. */

/* Requirement LO5 : The concepts of inheritance and subtyping are similar, but
* inheritance refers to a class which contains all members of another class,
* it signifies an "is a" relationship, and the class that is inheriting is
* a subset or a more specific example of the parent class. A subtype is a data
* type that can do everything another datatype can. It can also be though of as
* a subset, similar to char and string, where everything you can do with a char
*  can also be done by a string. */

// runs main as a material type app
void main() => runApp(const MaterialApp(home: Home()));

// Home widget needs to be stateful to change value of variables within home
// (Meaning, it is stateful in order to update counters and booleans)
class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// this is the actual class that will run Home, running the whole program
class _HomeState extends State<Home> {

  // font size control
  double fontSize = 15;

  // initialize objects
  var mainFruit = Fruit();
  var mainApple = Apple();
  var mainOrange = Orange();
  var player = User();

  // booleans to check for tutorial and title screen completion
  bool tutorial1Completed = false;
  bool tutorial2Completed = false;
  bool tutorial3Completed = false;
  bool nameInputted = false;

  @override
  Widget build(BuildContext context) { // builds the app

    // updates total fruits by adding the different types of fruit together
    mainFruit.fruits = mainApple.apples + mainOrange.oranges;

    // checks if tutorial 1 has been completed
    // tutorial one wants the user to get more than 5 apples before continuing
    if ((mainApple.apples > 5) & (tutorial1Completed == false)) {
      // if user gets more than five apples the tutorial is completed
      tutorial1Completed = true;
    }

    // checks if tutorial 2 has been completed
    // tutorial one wants the user to get more than 5 oranges before continuing
    if ((mainOrange.oranges > 5) & (tutorial2Completed == false)) {
      // if user gets more than five oranges the tutorial is completed
      tutorial2Completed = true;
    }

    // checks if tutorial 3 has been completed
    // tutorial one wants the user to get an apple farmer
    if ((mainApple.appleFarmer == 1) & (tutorial3Completed == false)) {
      // if user buys an apple farmer the tutorial is completed
      tutorial3Completed = true;
    }

    // loop that increments apple if the user has bought a farmer
    // in-game, the idea is that the farmer is making fruit for the player
    if(mainApple.appleFarmer > 0) {
      // the loop triggers every two seconds, adding to apple
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          // apple is increased every loop based on the amount of farmers
          mainApple.apples += mainApple.appleFarmer;
        });
      });
    }

    // same loop as the previous but for oranges rather than apples
    if(mainOrange.orangeFarmer > 0) {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          mainOrange.oranges += mainOrange.orangeFarmer;
        });
      });
    }

    // all of the app's structure will be held within the Scaffold
    return Scaffold(
      // the appBar is an bar that appears at the top of the screen
      appBar: AppBar(
        // the appBar displays the tile of the project and the username
        title: Text('Clicker Demo     Player: ${player.username}'),
        centerTitle: true, // project title is centered on the bar
        backgroundColor: Colors.orange[400], // makes bar orange
      ),
      body: Row( // this row is created to align the buttons vertically
        // and to hold the three separate columns
        mainAxisAlignment: MainAxisAlignment.center, // center row
        crossAxisAlignment: CrossAxisAlignment.center, // center row
        children: <Widget>[ // starts the list of widgets contained in row
          // create some space between left side of screen and column
          const Text('  '),
          // makes title screen visible until a name has been inputted
          Visibility(
          child: Expanded( // Expanded lets items not overflow screen
            child: Column( // column where title widgets will be
                children: <Widget>[
                  const Text('\n\n\n\n\n\n\n'), // space it down
                  Text(
                    'Input a username into the text-box\n           '
                        'or press guest button', // prompt
                    style: TextStyle( // set size of font
                      fontSize: fontSize, // sets size of font
                    ),
                  ),
                  const Text('\n'), // space it down
                  TextField( // create a text-box
                    decoration: const InputDecoration( // allows for decoration
                      border: OutlineInputBorder(), // create text-box border
                      labelText: 'Username', // puts label "username" on top
                      hintText: 'Enter Username', // hints what user must do
                    ),
                      onSubmitted: (String value) { // when text is submitted
                      // overload operator
                       player = User.withUsername(value); // Requirement LO1b
                       // toggle boolean which will change visibility
                       nameInputted = true;
                        setState(() {});
                      },
                  ),
                  const Text('\n'),
                  // button for if user wants to enter as guest
                  MaterialButton( // creates button
                    height: 100.0,
                    minWidth: 200.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () { // when pressed run this code
                      // toggle boolean which will change visibility
                      nameInputted = true;
                      setState(() {}); // setState uses the fact that this is a
                      // stateful widget to permanently change variable values
                    },
                    child: const Text('Enter as guest'),
                    splashColor: Colors.redAccent, // create red press effect
                  ),
                ],
            ),
           ),
            visible: !nameInputted,
          ),
          // the columns are in Expanded widget due to its formatting feature
          // with an expanded widget the columns will not overflow the screen
          Visibility(
          child: Expanded(
            // this column will be used to stack the "Fruits" buttons and text
           child: Column(
             children: <Widget>[
               const Text('\n'),
                displayTutorial1(tutorial1Completed), // display tutorial 1
                Text(
                  'Total Fruits: ${mainFruit.fruits}', // shows total amount of fruits
                  style: TextStyle(
                    fontSize: fontSize, // sets size of font
                    decoration: TextDecoration.underline, // underlines text
                  ),
                ),
                const Text('\n'), // creates space between text and next text
                Text(
                  'Apples: ${mainApple.apples}', // total amount of apples
                  style: TextStyle(fontSize: fontSize), // sets size of font
                ),
                const Text('\n'), // creates space between text and button
                MaterialButton( // creates button
                  height: 100.0,
                  minWidth: 200.0,
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    // when pressed, the button will give the user one apple
                    mainApple.apples += 1;
                    setState(() {}); // setState uses the fact that this is a
                    // stateful widget to permanently change variable values
                  },
                  child: const Text('+1 apple'), // button says what it does
                  splashColor: Colors.redAccent, // create red press effect
                ),
                const Text('\n'), // space between button and text below
                // displays tutorial 2
                displayTutorial2(tutorial1Completed, tutorial2Completed),
                // the visibility widget ensures this part remains hidden
                // until the first tutorial has been completed, this way
                // the player is not overwhelmed with all features at once
                Visibility(
                  child: Text(
                    'Oranges: ${mainOrange.oranges}', // total # of oranges
                    style: TextStyle(fontSize: fontSize), // set font size
                  ),
                  // player will only see this text after completing tutorial 1
                  visible: tutorial1Completed,
                ),
                const Text('\n'), // create space between text and button
                // visibility widget hides this until tutorial 1 is done
                Visibility(
                  child: MaterialButton( // creates button
                    height: 100.0,
                    minWidth: 200.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      // when button is pressed, player gets one orange
                      mainOrange.oranges += 1;
                      setState(() {}); // set state uses the fact that this is
                      // stateful widget to permanently change variable values
                    },
                    child: const Text('+1 orange'), // what button displays
                    splashColor: Colors.redAccent, // cool splash press effect
                  ),
                  // button is only visible if tutorial 1 has been completed
                  visible: tutorial1Completed,
                ),
              ],
            ),
          ),
            visible: nameInputted, // visible if tutorial 2 is done

          ),
          // vertical divider separates both columns
          const Visibility( // divider hidden until tutorial 2 completed
            child: VerticalDivider(), // creates divider

          ),
          Visibility( // divider hidden until tutorial 2 completed
          child: Expanded( // expanded for formatting purposes
            child: Visibility( // invisible until tutorial 2 is done
              child: Column( // creates new "Store" column
                children: <Widget>[
                  const Text('\n'), // space between appBar and Store
                  // displays tutorial 3
                  displayTutorial3(tutorial2Completed, tutorial3Completed),
                  Text(
                    'Store', // title of this column
                    style: TextStyle(
                      fontSize: fontSize, // sets font size
                      decoration: TextDecoration.underline, // underline text
                    ),
                  ),
                  const Text('\n'), // space between text and other text below
                  Text(
                    // display total number of apple farmers
                    'Apple Farmers: ${mainApple.appleFarmer}',
                    style: TextStyle(fontSize: fontSize), // set font size
                  ),
                  const Text('\n'), // space between text and button
                  MaterialButton( // creates button
                    height: 100.0,
                    minWidth: 200.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      // when pressed, check if the player has enough apples
                      // to meet the price of the farmer
                      if (mainApple.apples >= mainApple.appleFarmerCost) {
                        // if player has enough apples, buy one farmer
                        mainApple.appleFarmer += 1;
                        // subtract cost of apples from player's total apples
                        mainApple.apples -= mainApple.appleFarmerCost;
                        // increment the price of apples based on formula
                        // this way, user needs more apples next time they buy
                        // change cost based on formula (overloaded op)
                        mainApple * mainApple;
                      }
                      setState(() {}); // setState uses the fact that this is a
                      // stateful widget to permanently change variable values
                    },
                    child: Text(
                      // display text within button, what it does and its cost
                    '+1 apple farmer\n\nCost: ${mainApple.appleFarmerCost} '
                        'apples'),
                    splashColor: Colors.redAccent, // cool splash effect
                  ),
                  const Text('\n\n'), // space between button and text
                  // makes text invisible until tutorial 3 is done
                  Visibility(
                    child: Text(
                      // display total number of orange farmers
                      'Orange Farmers: ${mainOrange.orangeFarmer}',
                      style: TextStyle(fontSize: fontSize), // sets font size
                    ),
                      // make visible if tutorial 3 has been completed
                    visible: tutorial3Completed
                  ),
                  const Text('\n'), // create space between text and button
                  Visibility( // make button invisible until tutorial 3 is done
                      child: MaterialButton( // create button
                        height: 100.0,
                        minWidth: 200.0,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          // check if user has enough oranges to meet the cost
                          if (mainOrange.oranges >= mainOrange.orangeFarmerCost)
                          {
                            // if user can pay the price, add an orange farmer
                            mainOrange.orangeFarmer += 1;
                            // subtract cost of the farmer
                            mainOrange.oranges -= mainOrange.orangeFarmerCost;
                            // change cost based on formula (overloaded op)
                            mainOrange * mainOrange;
                          }
                          setState(() {}); // setState uses the fact that
                          // this is a stateful widget to permanently
                          // change variable values
                        },
                        child: Text(
                          // display text within button, what it does and cost
                            '+1 apple farmer\n\nCost:'
                                ' ${mainOrange.orangeFarmerCost} '
                                'apples'),
                        splashColor: Colors.redAccent, // cool splash effect
                      ),
                      // button only visible if tutorial 3 has been completed
                    visible: tutorial3Completed
                  ),
                ],
              ),
              // the entire column is only visible after tutorial 2 is done
              visible: tutorial2Completed,
            ),
          ),
            // if name has been inputted then show
            visible: nameInputted,
          ),
          // create space between column and right side of the screen
          const Text('  '),
        ],
      ),
    );
  } // end build
} // end _homeState class

// widget that displays the first tutorial
Widget displayTutorial1(bool tutorial1Completed) {
  // font size adjuster
  double fontSize = 13;
  // while user has not completed tutorial 1, do this
  while (tutorial1Completed == false) {
    // column is created to stack multiple text widgets
    return Column(
      // the children will be the text that comprises the first tutorial
      children: <Widget>[
        // starts tutorial by welcoming user
        Text(
          "Hi, Welcome to The Clicker Demo!",
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
        // explains theme of the game (will probably change)
        Text(
          "Here you can use the fruit machine to make fruit.",
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
        // explains tutorial 1's mechanic, pressing button to make fruit
        Text(
          "Press the '+1 apple' button a few times to make apples.",
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
        const Text("\n") // create space between tutorial and fruit counter
      ],
    );
  }

  return const Text(" "); // return empty if tutorial has been completed
}

// widget that displays the second tutorial
Widget displayTutorial2(bool tutorial1Completed, bool tutorial2Completed) {
  // font size adjuster
  double fontSize = 13;
  // if tutorial 1 has been completed but tutorial 2 has not
  while ((tutorial1Completed == true) & (tutorial2Completed == false)) {
    // column that will hold text for second tutorial
    return Column(
      children: <Widget>[
        // now that player has learned to click for apples...
        Text(
          "Great! Now you have apples.",
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
        // introduce clicking new button for oranges
        Text(
          "Let's try making oranges.",
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
        // explain how "total fruits" counter works
        Text(
          "Making any fruit will add to your fruit counter.",
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
        // explain mechanic
        Text(
          "Press the '+1 orange' button to make oranges.",
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
        const Text("\n") // separate text from button
      ],
    );
  }

  return const Text(" "); // return empty if tutorial has been completed
}

// widget that displays the third tutorial
Widget displayTutorial3(bool tutorial2Completed, bool tutorial3Completed) {
  // font size adjuster
  double fontSize = 13;
  // if player has completed second tutorial but not the third
  while ((tutorial2Completed == true) & (tutorial3Completed == false)) {
    // column that will hold tutorial three text
    return Column(
      children: <Widget>[
        // introduce what tutorial 3 is about
        Text(
          "Now let's get some farmers.",
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
        // explain what farmers do
        Text(
          "Farmers automatically make fruit at a set rate per second.",
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
        // explain that there is a cost to buying farmers
        Text(
          "But buying a farmer has a cost.",
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
        // prompt user to buy an apple farmer
        Text(
          "Try buying an apple farmer for 6 apples.",
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
        const Text("\n") // separate text from button
      ],
    );
  }

  return const Text(" "); // return empty if tutorial has been completed
}