import 'package:flutter/material.dart';

class RepeatScreen extends StatefulWidget {
  const RepeatScreen({super.key});

  static List<String> repeatValues = ["Once"];

  @override
  State<RepeatScreen> createState() => _RepeatScreenState();
}

class _RepeatScreenState extends State<RepeatScreen> {
  bool once = true;

  bool mon = false;

  bool tue = false;

  bool wed = false;

  bool thu = false;

  bool fri = false;

  bool sat = false;

  bool sun = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Repeat')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SwitchListTile(
              value: once,
              title: Text('Once'),
              onChanged: (bool value) {
                setState(() {
                  once = value;
                  value
                      ? RepeatScreen.repeatValues.add('Once')
                      : RepeatScreen.repeatValues.remove('Once');
                });
              },
            ),
            SwitchListTile(
              value: mon,
              title: Text('Monday'),
              onChanged: (bool value) {
                setState(() {
                  mon = value;
                  value
                      ? RepeatScreen.repeatValues.add('Mon')
                      : RepeatScreen.repeatValues.remove('Mon');
                });
              },
            ),
            SwitchListTile(
              value: tue,
              title: Text('Tuesday'),
              onChanged: (bool value) {
                setState(() {
                  tue = value;
                  value
                      ? RepeatScreen.repeatValues.add('Tue')
                      : RepeatScreen.repeatValues.remove('Tue');
                });
              },
            ),
            SwitchListTile(
              value: wed,
              title: Text('Wednesday'),
              onChanged: (bool value) {
                setState(() {
                  wed = value;
                  value
                      ? RepeatScreen.repeatValues.add('Wed')
                      : RepeatScreen.repeatValues.remove('Wed');
                });
              },
            ),
            SwitchListTile(
              value: thu,
              title: Text('Thursday'),
              onChanged: (bool value) {
                setState(() {
                  thu = value;
                  value
                      ? RepeatScreen.repeatValues.add('Thu')
                      : RepeatScreen.repeatValues.remove('Thu');
                });
              },
            ),
            SwitchListTile(
              value: fri,
              title: Text('Friday'),
              onChanged: (bool value) {
                setState(() {
                  fri = value;
                  value
                      ? RepeatScreen.repeatValues.add('Fri')
                      : RepeatScreen.repeatValues.remove('Fri');
                });
              },
            ),
            SwitchListTile(
              value: sat,
              title: Text('Saturday'),
              onChanged: (bool value) {
                setState(() {
                  sat = value;
                  value
                      ? RepeatScreen.repeatValues.add('Sat')
                      : RepeatScreen.repeatValues.remove('Sat');
                });
              },
            ),
            SwitchListTile(
              value: sun,
              title: Text('Sunday'),
              onChanged: (bool value) {
                setState(() {
                  sun = value;
                  value
                      ? RepeatScreen.repeatValues.add('Sun')
                      : RepeatScreen.repeatValues.remove('Sun');
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
