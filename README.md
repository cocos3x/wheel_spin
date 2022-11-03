flutter\_spinning\_wheel [#](#flutter_spinning_wheel)
=====================================================

[![Build Status](https://travis-ci.com/davidanaya/flutter-spinning-wheel.svg?branch=master)](https://travis-ci.com/davidanaya/flutter-spinning-wheel) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![Pub](https://img.shields.io/pub/v/flutter_spinning_wheel.svg)](https://pub.dartlang.org/packages/flutter_spinning_wheel)

A customizable widget to use as a spinning wheel in Flutter.

Getting Started [#](#getting-started)
-------------------------------------

*   [Installation](#installation)
*   [Basic Usage](#basic-usage)
*   [Use Cases](#use-cases)

### Installation 

Add

    
    flutter_spinning_wheel : ^lastest_version
    
    



to your pubspec.yaml, and run

    flutter packages get
    



in your project's root directory.

### Basic Usage

Create a new project with command

    flutter create myapp
    



Edit lib/main.dart like this:

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



You can replace the image with one of your preference.



### Use Cases

#### Game

    import 'dart:async';
    import 'dart:math';
    
    import 'package:flutter/material.dart';
    import 'package:flutter/services.dart';
    import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
    
    void main() {
      SystemChrome.setEnabledSystemUIOverlays([]);
      runApp(MyApp());
    }
    
    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        );
      }
    }
    
    class MyHomePage extends StatelessWidget {
      final StreamController _dividerController = StreamController<int>();
    
      dispose() {
        _dividerController.close();
      }
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(backgroundColor: Color(0xffDDC3FF), elevation: 0.0),
          backgroundColor: Color(0xffDDC3FF),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinningWheel(
                  Image.asset('assets/images/roulette-8-300.png'),
                  width: 310,
                  height: 310,
                  initialSpinAngle: _generateRandomAngle(),
                  spinResistance: 0.6,
                  canInteractWhileSpinning: false,
                  dividers: 8,
                  onUpdate: _dividerController.add,
                  onEnd: _dividerController.add,
                  secondaryImage:
                      Image.asset('assets/images/roulette-center-300.png'),
                  secondaryImageHeight: 110,
                  secondaryImageWidth: 110,
                ),
                SizedBox(height: 30),
                StreamBuilder(
                  stream: _dividerController.stream,
                  builder: (context, snapshot) =>
                      snapshot.hasData ? RouletteScore(snapshot.data) : Container(),
                )
              ],
            ),
          ),
        );
      }
    
      double _generateRandomAngle() => Random().nextDouble() * pi * 2;
    }
    
   
    



