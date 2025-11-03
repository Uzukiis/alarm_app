import 'package:flutter/material.dart';
//import 'dart:async';
//import 'package:alarm/alarm.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<int> alarms = [];
  void _addAlarm() {
    setState(() {
      alarms.add(alarms.length + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: OvalBorder(),
        tooltip: 'Increment',
        onPressed: _addAlarm,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Alarms', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 30),

              Expanded(
                child: ListView.builder(
                  itemCount: alarms.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: SwitchListTile(
                        value: true,
                        onChanged: (bool value) {},
                        activeThumbColor: Colors.deepPurple,
                        title: Text(
                          'Alarm ${alarms[index]}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        subtitle: const Text(
                          '07:00 AM',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  },
                
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
