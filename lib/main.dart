import 'package:flutter/material.dart';
import './screens/color_screen.dart';
import './screens/calc_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 1; //page index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HELLO WORLD',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      body:
          [
            ColorScreen(),
            CalcScreen(),
            Placeholder(),
          ][currentIndex], //list of widgets
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        indicatorColor: Colors.orange,
        destinations: [
          //prebuilt icon and text
          NavigationDestination(icon: Icon(Icons.color_lens), label: 'Color'),
          NavigationDestination(
            icon: Icon(Icons.calculate),
            label: 'Calculate',
          ),
          NavigationDestination(
            icon: Icon(Icons.file_open),
            label: 'Documents',
          ),
        ],
        onDestinationSelected: (index) {
          setState(() {
            //index selected destination
            currentIndex = index; //update the index when selected
          });
        },
      ),
    );
  }
}
