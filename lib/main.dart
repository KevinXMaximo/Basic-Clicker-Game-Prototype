import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget { // Widget needs to be stateful to change
  // the value of variables.
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int fruits = 0;
  int apples = 0;
  int oranges = 0;
  int apple_counter = 1;
  int orange_counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clicker Demo'),
        centerTitle: true,
        backgroundColor: Colors.orange[400],
      ),
      body: Row( // This row is created solely to align the buttons vertically
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column( // this column will be used to stack the buttons and text
              children: <Widget>[
                Text('\n'),
                Text(
                  'Total Fruits: ${fruits}',
                  style: TextStyle(fontSize: 30),
                ),
                Text('\n\n'),
                Text(
                    'Apples: ${apples}',
                  style: TextStyle(fontSize: 30),
                ),
                Text('\n'),
                MaterialButton(
                  height: 100.0,
                  minWidth: 200.0,
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    apples += 1;
                    fruits += 1;
                    setState(() {}); // set state uses the fact that this is a
                    // stateful widget to permanently change variable values
                  },
                  child: new Text('+1 apple'),
                  splashColor: Colors.redAccent,
                ),
                Text('\n\n'),
                Text(
                  'Apples: ${oranges}',
                  style: TextStyle(fontSize: 30),
                ),
                Text('\n'),
                MaterialButton(
                  height: 100.0,
                  minWidth: 200.0,
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    oranges += 1;
                    fruits += 1;
                    setState(() {});
                  },
                  child: new Text('+1 orange'),
                  splashColor: Colors.redAccent,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
