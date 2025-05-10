import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  Color bgColor = Colors.grey;

  void _showMyDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Click me!'),
          content: SingleChildScrollView( //this is a scrollable widget
            child: ListBody(
              children: <Widget>[
                Text('This is a demo dialog.'),
                Text('Do you want to proceed?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // close the dialog
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                // perform your action here
                Navigator.of(context).pop(); // close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: bgColor),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16.0,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  bgColor = Colors.pinkAccent;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                fixedSize: Size(100, 40),
              ),
              child: Text(
                'Pink',
                style: TextStyle(
                  color: Colors.white,
                  // fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  bgColor = Colors.purple;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                fixedSize: Size(100, 40),
              ),
              child: Text(
                'Purple',
                style: TextStyle(
                  color: Colors.white,
                  // fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  bgColor = Colors.redAccent;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                fixedSize: Size(100, 40),
              ),
              child: Text(
                'Red',
                style: TextStyle(
                  color: Colors.white,
                  // fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(onPressed: () => _showMyDialog(context), child: Text('Click me!')),
          ],
        ),
      ),
    );
  }
}
