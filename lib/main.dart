import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:real_resume/widgets/on_hover_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo', // MaterialColor(0xFF880E4F, color)
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                color: const Color(0xFF0779E4), // 0779E4
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 150),
                      OnHoverButton(
                        builder: (isHovered) {
                          final color =
                              (isHovered) ? Colors.amber : Colors.white;
                          return OutlinedButton(
                            child: Text(
                              "General",
                              style: TextStyle(fontSize: 30, color: color),
                            ),
                            onPressed: () {},
                            // onHover: ,
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.all(12),
                              side: const BorderSide(
                                  width: 3.0, color: Color(0xff0B0C10)),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      OnHoverButton(
                        builder: (isHovered) {
                          final color =
                              (isHovered) ? Colors.amber : Colors.white;
                          return OutlinedButton(
                            child: Text(
                              "Inventory Tracker",
                              style: TextStyle(fontSize: 20, color: color),
                            ),
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.all(12),
                              side: const BorderSide(
                                  width: 3.0, color: Color(0xff0B0C10)),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      OnHoverButton(
                        builder: (isHovered) {
                          final color =
                              (isHovered) ? Colors.amber : Colors.white;
                          return OutlinedButton(
                            child: Text(
                              "Weather app",
                              style: TextStyle(fontSize: 20, color: color),
                            ),
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.all(12),
                              side: const BorderSide(
                                  width: 3.0, color: Color(0xff0B0C10)),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      OnHoverButton(
                        builder: (isHovered) {
                          final color =
                              (isHovered) ? Colors.amber : Colors.white;
                          return OutlinedButton(
                            child: Text(
                              "Contact Manager",
                              style: TextStyle(fontSize: 20, color: color),
                            ),
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.all(12),
                              side: const BorderSide(
                                  width: 3.0, color: Color(0xff0B0C10)),
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: SingleChildScrollView(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          child: const SelectableText(
                            "Hello, I'm \nMohammad Abdulwahhab",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: const Color(0xfff8F8F80), fontSize: 50),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          child: const SelectableText.rich(
                            TextSpan(
                              text: 'About me:\n',
                              style: TextStyle(
                                  color: Color(0xff323232), fontSize: 30),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 100, horizontal: 50),
                        child: const SelectableText.rich(
                          TextSpan(
                            text: 'Mohammad Abdulwahhab',
                            style: TextStyle(
                                color: Color(0xff0779E4), fontSize: 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// Color:
// blue: 0xff0779E4
// black: 0xff323232
// white: 0xff8F8F8
// grey: 0xffF8F8F80