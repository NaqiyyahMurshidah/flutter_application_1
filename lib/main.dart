import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dialog_screen.dart'; //auto import
import 'package:flutter_application_1/screens/profile_screen.dart';
import 'package:flutter_application_1/theme_provider.dart';
import './screens/color_screen.dart';
import './screens/calc_screen.dart'; //manual import
import 'package:provider/provider.dart'; //provider is to make all screen accessible from any screen

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        context.watch<ThemeProvider>().darkMode; //watch waiting for update
    return MaterialApp(
      //get the dark mode
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 3; //page index

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.watch<ThemeProvider>().darkMode;
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.read<ThemeProvider>().toggleTheme(); //read toggle function
          },
          icon: isDarkMode ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
        ),
        title: Center(
          child: Text(
            'HELLO WORLD',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.orange,
            ),
          ),
        ),
      ),
      body:
          [
            ColorScreen(),
            CalcScreen(),
            DialogScreen(),
            ProfileScreen(),
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
          NavigationDestination(icon: Icon(Icons.chat_bubble), label: 'Dialog'),
          NavigationDestination(icon: Icon(Icons.people), label: 'Profile'),
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
