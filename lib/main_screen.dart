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

                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                        subtitle: Text(
                          alarm.label.isEmpty
                              ? 'Alarm, repeats ${alarm.repeat.toString()}'
                              : '${alarm.label}, repeats ${alarm.repeat.toString()}',

                          style: const TextStyle(fontSize: 16),
                        ),
                        secondary: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(12),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Delete Alarm'),
                                content: const Text(
                                  'Are you sure you want to delete this alarm?',
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        AddAlarmScreen.alarms.removeAt(index);
                                      });
                                      Navigator.pop(context, 'OK');
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Icon(
                            Icons.delete_outlined,
                            size: 32,
                            color: Colors.purple,
                          ),
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
