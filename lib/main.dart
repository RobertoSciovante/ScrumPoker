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
      _counter = (_counter+1) % Fibonacci.length;
      print('_MyHomePageState._incrementCounter - _counter = ' + _counter.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      // appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
           CardWidget(Fibonacci[_counter].toString()),
          // Text(_counter.toString(),style: TextStyle(fontSize: 48),),
          // Row(children: Fibonacci.map((i) => Text(i.toString())),),

          // Row(
          //   mainAxisSize: MainAxisSize.max,
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: Fibonacci.map((i) => buildIcon(context, i)).toList(growable: false),
          // )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  // Widget buildIcon(BuildContext context, int value) {
  //   // return
  //   return FloatingActionButton(
  //
  //     onPressed: _incrementCounter,
  //     // tooltip: 'Increment',
  //     child: Text(value.toString());
  //   );
  // }
}
