import 'package:flutter/material.dart';

import 'view/home.dart';
import 'view/calendar.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  static const bodyWidget = [
    HomeWidget(),
    CalendarWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyWidget[_selectedIndex],
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            activeIcon: Icon(Icons.task_alt),
            label: 'task',
            backgroundColor: Color.fromARGB(175, 72, 76, 77)),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            activeIcon: Icon(Icons.calendar_month),
            label: 'calendar',
            backgroundColor: Colors.lightBlue)
      ], onTap: _onItemTapped, currentIndex: _selectedIndex),
      floatingActionButton: FloatingActionButton(
          onPressed: null, //後程具体的な処理を実装
          tooltip: 'Increment',
          child: const Icon(Icons.add),
          backgroundColor: Colors
              .greenAccent), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
