import 'package:flutter/material.dart';
  String ringtoneSelected = '';
class SelectRingtoneScreen extends StatelessWidget {
  const SelectRingtoneScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Ringtone')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ListTile(
              title: Text('Default Ringtone'),
              onTap: () {
                ringtoneSelected = "assets/ringtones/DefaultRingtone.mp3";
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('NULL-Ringtone 2'),
              onTap: () {
                // Handle selection
              },
            ),
            ListTile(
              title: Text('NULLRingtone 3'),
              onTap: () {
                // Handle selection
              },
            ),
          ],
        ),
      ),
    );
  }
}
