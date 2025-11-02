import 'package:flutter/material.dart';
//import 'dart:async';
//import 'package:alarm/alarm.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

@override
    Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: OvalBorder(),
          tooltip: 'Increment',
          onPressed: (){},
          child: const Icon(Icons.add, color: Colors.white, size: 28),
          ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Alarm', style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    Card(
                      
                      child: SwitchListTile(
                        title: const Text('Alarm 1'),
                        value: true,
                        onChanged: (bool? value) { },
                      ),
                    ),
                  ],
                ),
              )
              /*ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index){
                  return Card(
                   child: SwitchListTile(value: true, onChanged:(bool? value) { },),
                  );
              })*/
              ]
              ),
        ),
      ),
        );
}}