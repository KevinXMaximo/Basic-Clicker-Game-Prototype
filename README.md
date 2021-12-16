# COP_3003_Integration_Project

This project is a mobile app developed using Flutter, it consists of a clicker/idle styled game demo meant to serve as a demonstration of the programming concepts I have learned.

The reason why I chose this project is due to an interest in mobile and game development. I like the idea of making a project I can run anywhere as long as I have my phone with me, and I would also like to do a project which I can easily share with friends and family. 

The project is a demo meant to immitate a clicker game, also known as an idle game. The main idea is that the player can click buttons in order to increment a counter, and with the points obtained through clicking the button the player can buy upgrades from a store which can allow for more efficient clicking and/or passive gain of points.

A good example of a clicker game is http://orteil.dashnet.org/cookieclicker/

A good video to understand idle games is https://www.youtube.com/watch?v=g-LziX2HynI

A good video to understand clicker games is https://www.youtube.com/watch?v=j_nI6G3ZDiE

This project was made by me. My name is Kevin Maximo, and I am a student at Florida Gulf Coast University.

This project was made during the fall semester of the 2021 school term.

This project was made for fun, it was my first attempt at making a mobile app and of using flutter. I hope to eventually learn more about the platform in order to make more advanced apps using flutter.

This project was made for a Programming II Class (COP 3003) admnistered by Prof. Scott Vanselow.

## Requirements

LO1 - index.dart file contains multiple classes

LO1a - index.dart serves as a header file containing classes which is imported to main

LO1b - index.dart contains the definition of the overloaded constructor, while main.dart contains the overloading

LO1c - index.dart contains classes that use initialization lists

LO2 - index.dart contains classes which utilize inheritance

LO2a - index.dart contains the comment which reasons this

LO3 - main.dart includes the comment that explains this

LO4 - index.dart contains the comment which reasons this

LO5 - main.dart containt the comment which reasons this


## Demonstration

![appWorking](https://user-images.githubusercontent.com/62119614/146286543-f27c72a5-69c0-4c3f-bc69-690214d96a44.gif)

## Diagrams

![final_class_diagram](https://user-images.githubusercontent.com/62119614/146274090-c0ca398a-26fa-413d-aee7-eee7416f842e.PNG)

## Getting Started

In order to run this project, you must first download android studio.

Android Studio Download Tutorial: https://developer.android.com/studio/install

Then, you must install flutter.

Flutter on Android Studio Guide: https://www.c-sharpcorner.com/article/flutter-with-android-studio-step-by-step-installation-guide/

Then, pull the project from github and use an android emulator to run the program.<br />

## Built With

* Android Studio  
* Flutter
* https://docs.flutter.dev/

## Contributing

This project can be contributed upon by adding more features which could mimic a real clicker game, such as an idle aspect where the player can earn fruits while the app is closed.

## Author

* Kevin Xavier Maximo

## Acknowledgments

* https://docs.flutter.dev/
* My uncle, Diogo Maximo, who helped me with some questions I had regarding flutter and dart: https://github.com/diogomaximo

## History

**First Prototype**

![Prototype1ActualReal](https://user-images.githubusercontent.com/62119614/140718015-a6da43ed-90c6-4cd1-94d4-98a3a3abb556.PNG)
  
The first prototype consists of two buttons, one with a counter for oranges and one with a counter for apples. These buttons can be pressed to increment their respective counters, while at the same time incrementing the overall "fruits" counter. This concept will eventually evolve into upgrades which will allow for more fruits to be obtained per click bought at the expense of total fruits, as well as an automic fruit farm which will earn the player a set number of fruits based on real time passage.

**Second Prototype**

The second prototype adds tutorials, farmers and timers. The tutorials are meant to guide the player through the mechanics of a clicker game, explaining the basics.

Tutorial 1:

![tutorial1Actual](https://user-images.githubusercontent.com/62119614/143375001-6d24b689-811d-48e5-8e81-7e5500464a18.PNG)

The app begins by only showing the total fruit counter, the apple counter and the "+1 apple" button, along with tutorial 1. The first tutorial explains to the player that they can make fruit by pressing the button, and prompts them to do so. This is meant to demonstrate the most basic aspect of a clicker game: you can click to increment a counter. Once the user has clicked the button 6 times, the game assumes they understand what the tutorial has to teach and moves on.

Tutorial 2:

![tutorial2Actual](https://user-images.githubusercontent.com/62119614/143375081-09db8266-73f8-476d-a8ed-32f62f715110.PNG)

Now that the user has clicked the apple button 6 times, they will unlock the orange button. Tutorial 2 will also be displayed, and it will explain that this is another type of fruit, which much like apples can be incremented through button clicks. Once the user has obtained 6 oranges they are ready to move on.

Tutorial 3:

![tutorial3ActualActual](https://user-images.githubusercontent.com/62119614/143375171-7e4f4d56-5af3-4d4e-8e6b-343ce1d24391.PNG)
  
At this point, the player likely understands how fruit buttons work, so the store is introduced. In the store, players can buy farmers, which tutorial 3 explains can passively harvest fruit for you. Farmers have a cost, which in the case of this first apple farmer is 6 apples. Every time a farmer is bought, their price increases exponentially, that way the player has to work harder to be able to buy another farmer. Each apple farmer increases apples once every 2 seconds.

Endgame: 

![incrementingApples](https://user-images.githubusercontent.com/62119614/143375572-81195d00-f2e1-4763-9298-dae5dc954985.gif)

The endgame will mostly consist of buying more farmers in order to increase the amount of fruits you own passively per second.

## Key Programming Concepts Utilized

* Inheritance
* Widgets
* Operator Overloading
