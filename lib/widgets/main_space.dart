import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class mainSpace extends StatefulWidget {
  mainSpace({Key? key}) : super(key: key);

  @override
  State<mainSpace> createState() => _mainSpaceState();
}

class _mainSpaceState extends State<mainSpace> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 50, top: 50),
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            child: const SelectableText(
              "Mohammad Abdulwahhab",
              textAlign: TextAlign.center,
              style: TextStyle(color: const Color(0xff0779E4), fontSize: 50),
            ),
          ),
          Container(
            // alignment: Alignment.left,
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            child: const SelectableText.rich(
              TextSpan(
                text: 'About me:\n',
                style: TextStyle(color: Color(0xff323232), fontSize: 30),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
            child: const SelectableText.rich(
              TextSpan(
                text: 'Mohammad Abdulwahhab',
                style: TextStyle(color: Color(0xff0779E4), fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
