import 'package:flutter/material.dart';
import 'package:scrum_poker/it/scrum/poker/AppConfig.dart';
import 'package:scrum_poker/it/scrum/poker/widget/CardWidget.dart';

import 'it/scrum/poker/AppScaffold.dart';
import 'it/scrum/poker/fibonacci.dart';

void main() {
  AppConfig.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter = _counter % Fibonacci.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      // appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
           CardWidget(Fibonacci[_counter].toString()),
          // Row(children: Fibonacci.map((i) => Text(i.toString())),),

          Row(
            // direction: Axis.horizontal,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: Fibonacci.map((i) => buildIcon(context, i)).toList(growable: false),
          )
        ],
      ),
    );
  }

  Widget buildIcon(BuildContext context, int value) {
    return  Text(value.toString());
    // return ElevatedButton(
    //
    //   onPressed: _incrementCounter,
    //   child: Text(value.toString()),
    // );
  }
}
