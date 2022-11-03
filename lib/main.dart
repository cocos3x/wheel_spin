import 'package:flutter/material.dart';
import 'package:wheel_spin/wheelspin.dart';

void main() {
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
  WheelSpinController wheelSpinController = WheelSpinController();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            children: [
              WheelSpin(
                controller: wheelSpinController,
                pathImage: 'assets/wheel.png',
                withWheel: 300,
                pieces: 6,
                // speed: 500,//defuaft is 500
                isShowTextTest: true,
                // offset: 1 / (10 * 6), //random 1/10 pieces defuaft is zero
              ),
              TextButton(
                  onPressed: () {
                    wheelSpinController.startWheel();
                  },
                  child: Text("Start")),
              TextButton(
                  onPressed: () {
                    wheelSpinController.stopWheel(2);
                  },
                  child: Text("Stop"))
            ],
          ),
        ));
  }
}
