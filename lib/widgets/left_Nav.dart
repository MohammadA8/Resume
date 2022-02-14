import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:real_resume/widgets/on_hover_button.dart';
import 'package:real_resume/widgets/main_space.dart';
import 'package:flutter/material.dart';

class leftNav extends StatefulWidget {
  const leftNav({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<leftNav> createState() => _leftNavState();
}

class _leftNavState extends State<leftNav> {
  _leftNavState() : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0779E4), // 0779E4
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 150),
          OnHoverButton(
            builder: (isHovered) {
              final color = (isHovered) ? Colors.amber : Colors.white;
              return OutlinedButton(
                child: Text(
                  "General",
                  style: TextStyle(fontSize: 30, color: color),
                ),
                onPressed: () {},
                // onHover: ,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  side: const BorderSide(width: 2.0, color: Color(0xffF8F8F8)),
                ),
              );
            },
          ),
          const SizedBox(height: 40),
          OnHoverButton(
            builder: (isHovered) {
              final color = (isHovered) ? Colors.amber : Colors.white;
              return OutlinedButton(
                child: Text(
                  "Inventory Tracker",
                  style: TextStyle(fontSize: 20, color: color),
                ),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  side: const BorderSide(width: 2.0, color: Color(0xffF8F8F8)),
                ),
              );
            },
          ),
          const SizedBox(height: 40),
          OnHoverButton(
            builder: (isHovered) {
              final color = (isHovered) ? Colors.amber : Colors.white;
              return OutlinedButton(
                child: Text(
                  "Weather app",
                  style: TextStyle(fontSize: 20, color: color),
                ),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  side: const BorderSide(width: 2.0, color: Color(0xffF8F8F8)),
                ),
              );
            },
          ),
          const SizedBox(height: 40),
          OnHoverButton(
            builder: (isHovered) {
              final color = (isHovered) ? Colors.amber : Colors.white;
              return OutlinedButton(
                child: Text(
                  "Contact Manager",
                  style: TextStyle(fontSize: 20, color: color),
                ),
                onPressed: () {
                  ;
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  side: const BorderSide(width: 2.0, color: Color(0xffF8F8F8)),
                ),
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
