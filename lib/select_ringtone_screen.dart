import 'package:flutter/material.dart';

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
              title: Text('Ringtone 1'),
              onTap: () {
                // Handle selection
              },
            ),
            ListTile(
              title: Text('Ringtone 2'),
              onTap: () {
                // Handle selection
              },
            ),
            ListTile(
              title: Text('Ringtone 3'),
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
