import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isChecked = false;

  void _handleCheckbox(value) {
    setState(() {
      isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ホーム"),
      ),
      body: Column(children: <Widget>[
        CheckboxListTile(
            activeColor: Colors.blue,
            title: const Text('期限切れタスク'),
            subtitle: const Text('期限切れです'),
            tileColor: Colors.pink[100],
            controlAffinity: ListTileControlAffinity.leading,
            value: isChecked,
            onChanged: _handleCheckbox),
        CheckboxListTile(
            activeColor: Colors.blue,
            title: const Text('本日のタスク'),
            subtitle: const Text('チェックボックスのサブタイトル'),
            controlAffinity: ListTileControlAffinity.leading,
            value: isChecked,
            onChanged: _handleCheckbox),
        ExpansionTile(
          title: const Text('完了済みのタスク'),
          leading: const Icon(Icons.info),
          children: [
            Column(
              children: <Widget>[
                CheckboxListTile(
                    activeColor: Colors.blue,
                    title: const Text('完了したタスク'),
                    subtitle: const Text('完了'),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isChecked,
                    onChanged: _handleCheckbox),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
