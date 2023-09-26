import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_parsing/SampleJson.dart';
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
  SampleJson? sampleJson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                "${sampleJson?.firstName ?? ""} ${sampleJson?.lastName ?? ""}".trim()),
            Text(
                "${sampleJson?.gender ?? ""} (${sampleJson?.age??0})"),
            Column(
              children: sampleJson?.phoneNumbers?.map((e) {
                return Text("${e.type} = ${e.number}");
              }).toList()??[],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // String json="{\"name\":\"Vijay\",\"last_name\":\"Babu\",\"is_pass\":true,\"rank\":0}";
          // Map<String,dynamic>? map = jsonDecode(json);
          // student=Student.fromJson(map!);
          // setState(() {
          // });
          //
          //
          // print(student?.name);
          // print(student?.lastName);
          // print(student?.isPass);
          // print(student?.rank);

          var loadString =
              await rootBundle.loadString("assets/dwsample1-json.json");
          var loadString2 =
              await rootBundle.loadString("assets/dwsample3-json.json");
          print(loadString);
          print(loadString2);
          var map = jsonDecode(loadString2);
          SampleJson.fromJson(map);
          sampleJson = SampleJson.fromRawJson(loadString2);
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
