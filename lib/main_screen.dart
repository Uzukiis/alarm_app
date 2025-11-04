import 'package:flutter/material.dart';
import 'add_alarm_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: OvalBorder(),
        tooltip: 'Increment',
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (context) => AddAlarmScreen()),
          );
          setState(() {});
        },
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
                  itemCount: AddAlarmScreen.alarms.length,
                  itemBuilder: (context, index) {
                    final alarm = AddAlarmScreen.alarms[index];
                    return Card(
                      child: SwitchListTile(
                        value: alarm.isActive,
                        onChanged: (bool value) {
                          setState(() {
                            alarm.isActive = value;
                          });
                        },
                        activeThumbColor: Colors.purple,
                        title: Text(
                          alarm.time,

                          style: const TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(
                          alarm.label.isEmpty
                              ? 'Alarm ${alarm.id}, repeats ${alarm.repeat.toString()}'
                              : '${alarm.label}, repeats ${alarm.repeat.toString()}',

                          style: const TextStyle(fontSize: 16),
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
