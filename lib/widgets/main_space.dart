import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 50, top: 50),
                // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                child: const SelectableText(
                  "Mohammad Abdulwahhab",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: const Color(0xff0779E4), fontSize: 50),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 300, top: 50),
                child: OutlinedButton(
                  child: const Text(
                    "Resume",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () async {
                    const url =
                        "https://drive.google.com/file/d/1kwK1OduTeilUrfld4-Q0Mf7O4HlP_UIZ/view?usp=sharing";
                    if (await canLaunch(url))
                      await launch(url);
                    else {
                      // can't launch url, there is some error
                      throw "Could not launch $url";
                    }
                  },
                  // onHover: ,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Color(0xff0779E4),
                    side:
                        const BorderSide(width: 3.0, color: Color(0xff0B0C10)),
                  ),
                ),
              )
            ],
          ),
          Container(
            // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            child: const SelectableText.rich(
              TextSpan(
                text: '| Software Developer and Computer Science major'
                    ' attending the Univeristy of Central Florida',
                style: TextStyle(color: Color(0xff323232), fontSize: 20),
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

// https://drive.google.com/file/d/1kwK1OduTeilUrfld4-Q0Mf7O4HlP_UIZ/view?usp=sharing