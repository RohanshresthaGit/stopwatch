import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Stopwatch'),
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
  late Stopwatch stopwatch;
  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  String txt() {
    var elap = stopwatch.elapsed.inMilliseconds;

    var milisecond = ((elap % 1000) ~/ 10).toString().padLeft(2, '0');
    var second = ((elap ~/ 1000) % 60).toString().padLeft(2, '0');
    var minute = ((elap ~/ 1000) ~/ 60).toString().padLeft(2, '0');
    return '$minute : $second : $milisecond';
  }

  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Stopwatch'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                txt(),
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: SizedBox(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              if (stopwatch.isRunning) {
                                stopwatch.stop();
                                flag = !flag;
                                setState(() {});
                              } else {
                                stopwatch.start();
                                flag = !flag;
                                setState(() {});
                              }
                            },
                            child: Icon(flag ? Icons.play_arrow : Icons.stop)),
                        OutlinedButton(
                            onPressed: () {
                              stopwatch.reset();
                            },
                            child: Icon(Icons.restart_alt))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
