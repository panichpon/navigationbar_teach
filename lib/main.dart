import 'package:flutter/material.dart';

import 'package:navigationbar_teach/menu/home_page.dart';
import 'package:navigationbar_teach/menu/discovery_page.dart';
import 'package:navigationbar_teach/menu/library_page.dart';
import 'package:navigationbar_teach/menu/feed_page.dart';
import 'package:navigationbar_teach/menu/activity_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final tabs = [
    const HomePage(),
    const DiscoveryPage(),
    const LibraryPage(),
    const FeedPage(),
    const ActivityPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        iconSize: 35,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.greenAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_pin),
              label: 'Discover',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Library',
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Feed',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Activity',
              backgroundColor: Colors.deepPurpleAccent),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
