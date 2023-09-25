import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_parsing/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Student? student;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Name: ${student?.name??""}',
              style: TextStyle(fontSize: 22),
            ),
            Text(
              'Last Name: ${student?.lastName??""}',
              style: TextStyle(fontSize: 22),
            ),
            Text(
              'Pass: ${student?.isPass??""}',
              style: TextStyle(fontSize: 22),
            ),
            Text(
              'Rank: ${student?.rank??""}',
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String json="{\"name\":\"Vijay\",\"last_name\":\"Babu\",\"is_pass\":true,\"rank\":0}";
          Map<String,dynamic>? map = jsonDecode(json);

          student=Student.fromJson(map!);
          setState(() {
          });


          print(student?.name);
          print(student?.lastName);
          print(student?.isPass);
          print(student?.rank);

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
