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
            padding: const EdgeInsets.only(top: 20, left: 50),
            child: const SelectableText.rich(
              TextSpan(
                text: '| Software Developer and Computer Science major'
                    ' attending the Univeristy of Central Florida',
                style: TextStyle(color: Color(0xff323232), fontSize: 20),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15, left: 50),
            child: const Expanded(
              child: SelectableText.rich(
                TextSpan(
                  text: 'About me',
                  style: TextStyle(color: Color(0xff0779E4), fontSize: 24),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 50),
            child: const Expanded(
              child: SelectableText.rich(
                TextSpan(
                  text:
                      'Ambitious and motivated student with a passion for learning and a strong work ethic. Experienced in programming and web development. I seek to help create a better future for our world through computer science and engineering.',
                  style: TextStyle(color: Color(0xff323232), fontSize: 18),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15, left: 50),
            child: const Expanded(
              child: SelectableText.rich(
                TextSpan(
                  text: 'Experience',
                  style: TextStyle(color: Color(0xff0779E4), fontSize: 24),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 80),
            child: Container(
              padding: EdgeInsets.only(top: 20),
              child: Wrap(
                spacing: 40,
                children: [
                  Column(
                    children: [
                      Container(
                        // padding: const EdgeInsets.only(top: 10, left: 80),
                        child: SelectableText.rich(
                          TextSpan(
                            text: 'Limbitless solutions internship',
                            style: TextStyle(
                                color: Color(0xff51a1ec), fontSize: 20),
                          ),
                        ),
                      ),
                      SelectableText.rich(
                        TextSpan(
                          text:
                              'Used Flutter and Dart to develop software in a team work environment',
                          style:
                              TextStyle(color: Color(0xff323232), fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        // padding: const EdgeInsets.only(top: 10, left: 80),
                        child: SelectableText.rich(
                          TextSpan(
                            text:
                                'Limbitless solutions Computer Science internship',
                            style: TextStyle(
                                color: Color(0xff51a1ec), fontSize: 20),
                          ),
                        ),
                      ),
                      SelectableText.rich(
                        TextSpan(
                          text:
                              'Used Flutter and Dart to develop software in a team work environment',
                          style:
                              TextStyle(color: Color(0xff323232), fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// https://drive.google.com/file/d/1kwK1OduTeilUrfld4-Q0Mf7O4HlP_UIZ/view?usp=sharing