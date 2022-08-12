import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: '今日のタスク'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isChecked = false;
  int  _selectedIndex = 0;

  void _handleCheckbox(value) {
    setState(() {
      isChecked = value;
    });
  }
  void _onItemTapped(int value){
    setState((){
      _selectedIndex = value;
  });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:

        Column(
          children:
            <Widget>
          [
            CheckboxListTile(
          activeColor: Colors.blue,
          title: const Text('期限切れタスク'),
          subtitle: const Text('期限切れです'),
          tileColor: Colors.pink[100],
          controlAffinity: ListTileControlAffinity.leading,
          value: isChecked,
          onChanged: _handleCheckbox
        ),
        CheckboxListTile(
          activeColor: Colors.blue,
          title: const Text('本日のタスク'),
          subtitle: const Text('チェックボックスのサブタイトル'),
          controlAffinity: ListTileControlAffinity.leading,
          value: isChecked,
          onChanged: _handleCheckbox
        ),
        ExpansionTile(
          title: const Text('完了済みのタスク'),
          leading: const Icon(Icons.info),
          children: [
            Column(
              children: <Widget> [
                CheckboxListTile(
                activeColor: Colors.blue,
                title: const Text('完了したタスク'),
                subtitle: const Text('完了'),
                controlAffinity: ListTileControlAffinity.leading,
                value: isChecked,
                onChanged: _handleCheckbox
        ),
              ],
            ),
          ],
        ),
        ]
        ),

        // ],
        // ),
      // ),
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
      ],
      onTap: _onItemTapped,
      currentIndex: _selectedIndex
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
