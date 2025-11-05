import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'alarm_class.dart';
//import 'package:intl/intl.dart';
import 'repeat_screen.dart';
import 'select_ringtone_screen.dart';
import 'package:flutter/services.dart';

class AddAlarmScreen extends StatefulWidget {
  static final List<Alarm> alarms = [];

  const AddAlarmScreen({super.key});
  @override
  State<AddAlarmScreen> createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {
  Duration tempDuration = Duration.zero;
  TextEditingController labelController = TextEditingController();

  void _addAlarm() {
    RepeatScreen.repeatValues.isEmpty
        ? ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text('Please select at least one repeat option')),
          )
        : setState(() {
            AddAlarmScreen.alarms.add(
              Alarm(
                id: AddAlarmScreen.alarms.length + 1,
                time:
                    "${tempDuration.inHours.toString().padLeft(2, "0")}:${tempDuration.inMinutes.remainder(60).toString().padLeft(2, "0")}",
                ringtone: ringtoneSelected,
                repeat:
                    RepeatScreen.repeatValues.toString() ==
                        "[Mon, Tue, Wed, Thu, Fri, Sat, Sun]"
                    ? [
                        "Everyday",
                      ].toString().replaceAll('[', '').replaceAll(']', '')
                    : RepeatScreen.repeatValues
                          .toString()
                          .replaceAll('[', '')
                          .replaceAll(']', ''),
                isActive: true,
                label: labelController.text,
              ),
            );
            reset();
            Navigator.pop(context);
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Alarm')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hm,
              onTimerDurationChanged: (Duration newDuration) {
                setState(() {
                  tempDuration = newDuration;
                });
              },
            ),
            const SizedBox(height: 20),
            InkWell(
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: Center(
                  child: Text(
                    "Select a ringtone",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => SelectRingtoneScreen(),
                  ),
                );
              },
            ),
            InkWell(
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: Center(
                  child: Text(
                    "Repeat",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(builder: (context) => RepeatScreen()),
                );
                setState(() {});
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Label"),
              inputFormatters: [LengthLimitingTextInputFormatter(22)],
              onChanged: (value) {
                setState(() {
                  labelController.text = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _addAlarm();
              },
              child: Text("Set alarm", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
