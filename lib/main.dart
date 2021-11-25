import 'dart:async'; // Necessary import for using delay loops

// necessary import for using material features
import 'package:flutter/material.dart';

// runs main
void main() => runApp(MaterialApp(home: Home()));

// Home widget needs to be stateful to change value of variables within home
// (Meaning, it is stateful in order to update counters and booleans)
class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// this is the actual class that will run in Home, starting the whole program
class _HomeState extends State<Home> {

  // font size control
  double FONT_SIZE = 15;

  // counter for fruits
  int fruits = 0;
  int apples = 0;
  int oranges = 0;

  // apple farmer variables, # of and cost
  int appleFarmer = 0;
  int appleFarmerCost = 6;

  // orange farmer variables, # of and cost
  int orangeFarmer = 0;
  int orangeFarmerCost = 18;

  // booleans to check for tutorial completion
  bool tutorial1Completed = false;
  bool tutorial2Completed = false;
  bool tutorial3Completed = false;

  @override
  Widget build(BuildContext context) { // builds the app

    // updates total fruits by adding the different types of fruit together
    fruits = apples + oranges;

    // checks if tutorial 1 has been completed
    // tutorial one wants the user to get more than 5 apples before continuing
    if ((apples > 5) & (tutorial1Completed == false)) {
      // if user gets more than five apples the tutorial is completed
      tutorial1Completed = true;
    }
    ;

    // checks if tutorial 2 has been completed
    // tutorial one wants the user to get more than 5 oranges before continuing
    if ((oranges > 5) & (tutorial2Completed == false)) {
      // if user gets more than five oranges the tutorial is completed
      tutorial2Completed = true;
    }
    ;

    // checks if tutorial 3 has been completed
    // tutorial one wants the user to get an apple farmer
    if ((appleFarmer == 1) & (tutorial3Completed == false)) {
      // if user buys an apple farmer the tutorial is completed
      tutorial3Completed = true;
    }
    ;

    // loop that increments apple if the user has bought a farmer
    // in-game, the idea is that the farmer is making fruit for the player
    if(appleFarmer > 0) {
      // the loop triggers every two seconds, adding to apple
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          // apple is increased every loop based on the amount of farmers
          apples += appleFarmer;
        });
      });
    }

    // same loop as the previous but for oranges rather than apples
    if(orangeFarmer > 0) {
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          oranges += orangeFarmer;
        });
      });
    }

    // all of the app's structure will be held within the Scaffold
    return Scaffold(
      // the appBar is an bar that appears at the top of the screen
      appBar: AppBar(
        // the appBar displays the tile of the project
        title: Text('Clicker Demo'),
        centerTitle: true, // project title is centered on the bar
        backgroundColor: Colors.orange[400], // make bar orange
      ),
      body: Row(
        // this row is created to align the buttons vertically
        // and to hold the two separate columns, "Fruits" and "Store"
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // create some space between left side of screen and column
          Text('  '),
          // the columns are in an Expanded widget due to its formatting feature
          // with an expanded widget the columns will not overflow the screen
          Expanded(
            // this column will be used to stack the "Fruits" buttons and text
           child: Column(
              children: <Widget>[
                Text('\n'), // create some space between appBar and text
                displayTutorial1(tutorial1Completed), // display tutorial 1
                Text(
                  'Total Fruits: ${fruits}', // shows total amount of fruits
                  style: TextStyle(
                    fontSize: FONT_SIZE, // sets size of font
                    decoration: TextDecoration.underline, // underlines text
                  ),
                ),
                Text('\n'), // creates space between text and next text
                Text(
                  'Apples: ${apples}', // shows total amount of apples
                  style: TextStyle(fontSize: FONT_SIZE), // sets size of font
                ),
                Text('\n'), // creates space between text and button
                MaterialButton( // creates button
                  height: 100.0,
                  minWidth: 200.0,
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    // when pressed, the button will give the user one apple
                    apples += 1;
                    setState(() {}); // setState uses the fact that this is a
                    // stateful widget to permanently change variable values
                  },
                  child: new Text('+1 apple'), // button says what it does
                  splashColor: Colors.redAccent, // create cool red press effect
                ),
                Text('\n'), // space between button and text below
                // displays tutorial 2
                displayTutorial2(tutorial1Completed, tutorial2Completed),
                // the visibility widget ensures this part remains hidden
                // until the first tutorial has been completed, this way
                // the player is not overwhelmed with all features at once
                Visibility(
                  child: Text(
                    'Oranges: ${oranges}', // display total number of oranges
                    style: TextStyle(fontSize: FONT_SIZE), // set font size
                  ),
                  // player will only see this text after completing tutorial 1
                  visible: tutorial1Completed,
                ),
                Text('\n'), // create space between text and button
                // visibility widget hides this until tutorial 1 is done
                Visibility(
                  child: MaterialButton( // creates button
                    height: 100.0,
                    minWidth: 200.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      // when button is pressed, player gets one orange
                      oranges += 1;
                      setState(() {}); // set state uses the fact that this is a
                      // stateful widget to permanently change variable values
                    },
                    child: new Text('+1 orange'), // sets what button displays
                    splashColor: Colors.redAccent, // cool splash press effect
                  ),
                  // button is only visible if tutorial 1 has been completed
                  visible: tutorial1Completed,
                ),
              ],
            ),
          ),
          // vertical divider separates both columns
          Visibility( // divider hidden until tutorial 2 completed
            child: VerticalDivider(), // creates divider
            visible: tutorial2Completed, // visible if tutorial 2 is done
          ),
          Expanded( // expanded for formatting purposes
            child: Visibility( // invisible until tutorial 2 is done
              child: Column( // creates new "Store" column
                children: <Widget>[
                  Text('\n'), // space between appBar and Store
                  // displays tutorial 3
                  displayTutorial3(tutorial2Completed, tutorial3Completed),
                  Text(
                    'Store', // title of this column
                    style: TextStyle(
                      fontSize: FONT_SIZE, // sets font size
                      decoration: TextDecoration.underline, // underline text
                    ),
                  ),
                  Text('\n'), // space between text and other text below
                  Text(
                    // display total number of apple farmers
                    'Apple Farmers: ${appleFarmer}',
                    style: TextStyle(fontSize: FONT_SIZE), // set font size
                  ),
                  Text('\n'), // space between text and button
                  MaterialButton( // creates button
                    height: 100.0,
                    minWidth: 200.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      // when pressed, check if the player has enough apples
                      // to meet the price of the farmer
                      if (apples >= appleFarmerCost) {
                        // if player has enough apples, buy one farmer
                        appleFarmer += 1;
                        // subtract cost of apples from player's total apples
                        apples -= appleFarmerCost;
                        // increment the price of apples based on formula
                        // this way, user needs more apples next time they buy
                        appleFarmerCost = appleFarmerCost * (appleFarmer + 1);
                      }
                      setState(() {}); // setState uses the fact that this is a
                      // stateful widget to permanently change variable values
                    },
                    child: new Text(
                      // display text within button, what it does and its cost
                    '+1 orange farmer\n\nCost: ${orangeFarmerCost} oranges'),
                    splashColor: Colors.redAccent, // cool splash effect
                  ),
                  Text('\n\n'), // space between button and text
                  // makes text invisible until tutorial 3 is done
                  Visibility(
                    child: Text(
                      // display total number of orange farmers
                      'Orange Farmers: ${orangeFarmer}',
                      style: TextStyle(fontSize: FONT_SIZE), // sets font size
                    ),
                      // make visible if tutorial 3 has been completed
                    visible: tutorial3Completed
                  ),
                  Text('\n'), // create space between text and button
                  Visibility( // make button invisible until tutorial 3 is done
                      child: MaterialButton( // create button
                        height: 100.0,
                        minWidth: 200.0,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          // check if user has enough oranges to meet the cost
                          if (oranges >= orangeFarmerCost) {
                            // if user can pay the price, add an orange farmer
                            orangeFarmer += 1;
                            // subtract cost of the farmer
                            oranges -= orangeFarmerCost;
                            // change cost based on formula
                            orangeFarmerCost = orangeFarmerCost * (orangeFarmer + 1);
                          }
                          setState(() {}); // setState uses the fact that this is a
                          // stateful widget to permanently change variable values
                        },
                        child: new Text(
                          // display text within button, what it does and cost
                            '+1 apple farmer\n\nCost: ${orangeFarmerCost} apples'),
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
          // create space between column and right side of the screen
          Text('  '),
        ],
      ),
    );
  } // end build
} // end _homeState class

// widget that displays the first tutorial
Widget displayTutorial1(bool tutorial1Completed) {
  // font size adjuster
  double FONT_SIZE = 13;
  // while user has not completed tutorial 1, do this
  while (tutorial1Completed == false) {
    // column is created to stack multiple text widgets
    return Column(
      // the children will be the text that comprises the first tutorial
      children: <Widget>[
        // starts tutorial by welcoming user
        Text(
          "Hi, Welcome to The Clicker Demo!",
          style: TextStyle(fontSize: FONT_SIZE),
          textAlign: TextAlign.center,
        ),
        // explains theme of the game (will probably change)
        Text(
          "Here you can use the fruit machine to make fruit.",
          style: TextStyle(fontSize: FONT_SIZE),
          textAlign: TextAlign.center,
        ),
        // explains tutorial 1's mechanic, pressing button to make fruit
        Text(
          "Press the '+1 apple' button a few times to make apples.",
          style: TextStyle(fontSize: FONT_SIZE),
          textAlign: TextAlign.center,
        ),
        Text("\n") // create space between tutorial and fruit counter
      ],
    );
  }

  return Text(" "); // return empty if tutorial has been completed
}

// widget that displays the second tutorial
Widget displayTutorial2(bool tutorial1Completed, bool tutorial2Completed) {
  // font size adjuster
  double FONT_SIZE = 13;
  // if tutorial 1 has been completed but tutorial 2 has not
  while ((tutorial1Completed == true) & (tutorial2Completed == false)) {
    // column that will hold text for second tutorial
    return Column(
      children: <Widget>[
        // now that player has learned to click for apples...
        Text(
          "Great! Now you have apples.",
          style: TextStyle(fontSize: FONT_SIZE),
          textAlign: TextAlign.center,
        ),
        // introduce clicking new button for oranges
        Text(
          "Let's try making oranges.",
          style: TextStyle(fontSize: FONT_SIZE),
          textAlign: TextAlign.center,
        ),
        // explain how "total fruits" counter works
        Text(
          "Making any fruit will add to your fruit counter.",
          style: TextStyle(fontSize: FONT_SIZE),
          textAlign: TextAlign.center,
        ),
        // explain mechanic
        Text(
          "Press the '+1 orange' button to make oranges.",
          style: TextStyle(fontSize: FONT_SIZE),
          textAlign: TextAlign.center,
        ),
        Text("\n") // separate text from button
      ],
    );
  }

  return Text(" "); // return empty if tutorial has been completed
}

// widget that displays the third tutorial
Widget displayTutorial3(bool tutorial2Completed, bool tutorial3Completed) {
  // font size adjuster
  double FONT_SIZE = 13;
  // if player has completed second tutorial but not the third
  while ((tutorial2Completed == true) & (tutorial3Completed == false)) {
    // column that will hold tutorial three text
    return Column(
      children: <Widget>[
        // introduce what tutorial 3 is about
        Text(
          "Now let's get some farmers.",
          style: TextStyle(fontSize: FONT_SIZE),
          textAlign: TextAlign.center,
        ),
        // explain what farmers do
        Text(
          "Farmers automatically make fruit at a set rate per second.",
          style: TextStyle(fontSize: FONT_SIZE),
          textAlign: TextAlign.center,
        ),
        // explain that there is a cost to buying farmers
        Text(
          "But buying a farmer has a cost.",
          style: TextStyle(fontSize: FONT_SIZE),
          textAlign: TextAlign.center,
        ),
        // prompt user to buy an apple farmer
        Text(
          "Try buying an apple farmer for 6 apples.",
          style: TextStyle(fontSize: FONT_SIZE),
          textAlign: TextAlign.center,
        ),
        Text("\n") // separate text from button
      ],
    );
  }

  return Text(" "); // return empty if tutorial has been completed
}
