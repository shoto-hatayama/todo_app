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
        primarySwatch: Colors.lightBlue,
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
          child: Icon(Icons.add),
          onPressed: () {
            showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AlertDialog(
                        insetPadding: EdgeInsets.zero,
                        content: Column(children: <Widget>[
                          // タスク入力フォーム
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: TextField(
                                autofocus: true,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                controller: null,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'することは？',
                                )),
                          ),
                          Row(children: <Widget>[
                            // カレンダー表示
                            IconButton(
                                icon: Icon(Icons.date_range),
                                onPressed: () {
                                  // 処理
                                }),
                            // 詳細入力フォーム表示
                            IconButton(
                                icon: Icon(Icons.announcement),
                                onPressed: () {
                                  // 処理
                                }),
                            // 保存ボタン
                            // 次のTextButtonを右寄せにするためのExpanded
                            Expanded(child: SizedBox()),
                            TextButton(
                                onPressed: () {
                                  // 処理
                                },
                                child: Text("追加"))
                          ])
                        ]),
                      ),
                    ],
                  );
                });
          },
        ));
  }
}
