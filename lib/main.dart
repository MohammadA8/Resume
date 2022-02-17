import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:real_resume/widgets/my_flutter_app_icons.dart';
import 'package:real_resume/widgets/on_hover_button.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void _evictImage(String url) {
    final NetworkImage provider = NetworkImage(url);
    provider.evict().then<void>((bool success) {
      if (success) debugPrint('removed image!');
    });
    setState(() {});
  }

  final ScrollController _controller = ScrollController();

  void _scrollTo(String s) {
    double position = 0;
    if (s == "General") {
      position = _controller.position.minScrollExtent;
    } else if (s == "Inventory") {
      position = _controller.position.maxScrollExtent * .36;
    } else if (s == "Weather") {
      position = _controller.position.maxScrollExtent * .68;
    } else {
      position = _controller.position.maxScrollExtent;
    }

    _controller.animateTo(position,
        duration: const Duration(milliseconds: 750),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
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
                          onPressed: () {
                            _scrollTo("General");
                          },
                          // onHover: ,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(12),
                            fixedSize: Size(200, 50),
                            side: const BorderSide(
                                width: 2.0, color: Color(0xffF8F8F8)),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 60),
                    OnHoverButton(
                      builder: (isHovered) {
                        final color = (isHovered) ? Colors.amber : Colors.white;
                        return OutlinedButton(
                          child: Text(
                            "Inventory Tracker",
                            style: TextStyle(fontSize: 20, color: color),
                          ),
                          onPressed: () {
                            _scrollTo("Inventory");
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(12),
                            fixedSize: Size(200, 50),
                            side: const BorderSide(
                                width: 2.0, color: Color(0xffF8F8F8)),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 60),
                    OnHoverButton(
                      builder: (isHovered) {
                        final color = (isHovered) ? Colors.amber : Colors.white;
                        return OutlinedButton(
                          child: Text(
                            "Weather app",
                            style: TextStyle(fontSize: 20, color: color),
                          ),
                          onPressed: () {
                            _scrollTo("Weather");
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(12),
                            fixedSize: Size(200, 50),
                            side: const BorderSide(
                                width: 2.0, color: Color(0xffF8F8F8)),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 60),
                    OnHoverButton(
                      builder: (isHovered) {
                        final color = (isHovered) ? Colors.amber : Colors.white;
                        return OutlinedButton(
                          child: Text(
                            "Conatct Manager",
                            style: TextStyle(fontSize: 20, color: color),
                          ),
                          onPressed: () {
                            _scrollTo("Manager");
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(12),
                            fixedSize: Size(200, 50),
                            side: const BorderSide(
                                width: 2.0, color: Color(0xffF8F8F8)),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                controller: _controller,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ValueListenableBuilder(
                    //   valueListenable: whereToScroll,
                    //   builder: (BuildContext context, String newVal, Widget? child) {
                    //     double scrollTo = 0;
                    //     if (newVal == "General") scrollTo = 0;
                    //     controller.jumpTo(scrollTo);
                    //     return const Text('');
                    //   },
                    // ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 50, top: 50),
                          // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                          child: const SelectableText(
                            "Mohammad Abdulwahhab",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: const Color(0xff0779E4), fontSize: 50),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 300, top: 50),
                          child: OutlinedButton(
                            child: const Text(
                              "Resume",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
                              side: const BorderSide(
                                  width: 3.0, color: Color(0xff0B0C10)),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                      padding: const EdgeInsets.only(top: 20, left: 50),
                      child: const SelectableText.rich(
                        TextSpan(
                          text:
                              '| Software Developer and Computer Science major'
                              ' attending the Univeristy of Central Florida',
                          style:
                              TextStyle(color: Color(0xff323232), fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(top: 15, left: 50),
                      child: const Expanded(
                        child: SelectableText.rich(
                          TextSpan(
                            text: 'About me',
                            style: TextStyle(
                                color: Color(0xff0779E4), fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 50, right: 50),
                      child: const Expanded(
                        child: SelectableText.rich(
                          TextSpan(
                            text:
                                'Ambitious and motivated student with a passion for learning and a strong work ethic. Experienced in programming and web development. I seek to help create a better future for our world through computer science and engineering.',
                            style: TextStyle(
                                color: Color(0xff323232), fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(top: 15, left: 50),
                      child: const Expanded(
                        child: SelectableText.rich(
                          TextSpan(
                            text: 'Work Experience',
                            style: TextStyle(
                                color: Color(0xff0779E4), fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // spacing: 40,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 15, left: 50),
                          child: SelectableText.rich(
                            TextSpan(
                              text: 'Limbitless solutions internship',
                              style: TextStyle(
                                  color: Color(0xff323232), fontSize: 20),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15, left: 70),
                          child: SelectableText.rich(
                            TextSpan(
                              text:
                                  'Used Flutter and Dart to develop software in a team work environment',
                              style: TextStyle(
                                  color: Color(0xff323232), fontSize: 15),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15, left: 50),
                          child: SelectableText.rich(
                            TextSpan(
                              text: 'Computer Science Teaching Assistant',
                              style: TextStyle(
                                  color: Color(0xff323232), fontSize: 20),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15, left: 70),
                          child: SelectableText.rich(
                            TextSpan(
                              text:
                                  'Help student learn important data structures and algrothims',
                              style: TextStyle(
                                  color: Color(0xff323232), fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15, left: 50),
                      child: SelectableText.rich(
                        TextSpan(
                          text: 'Scribe at ScribeAmerica',
                          style:
                              TextStyle(color: Color(0xff323232), fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15, left: 70),
                      child: SelectableText.rich(
                        TextSpan(
                          text:
                              'Assisted the physician in seeing the patients and recorded important details regarding the visit',
                          style:
                              TextStyle(color: Color(0xff323232), fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(top: 15, left: 50),
                      child: const Expanded(
                        child: SelectableText.rich(
                          TextSpan(
                            text: 'Leadership and Volunteer Experience',
                            style: TextStyle(
                                color: Color(0xff0779E4), fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15, left: 50),
                      child: SelectableText.rich(
                        TextSpan(
                          text: 'IT director at MSA',
                          style:
                              TextStyle(color: Color(0xff323232), fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15, left: 70),
                      child: SelectableText.rich(
                        TextSpan(
                          text:
                              'Helped run the Muslim Student Association by providing solutions to technical problems',
                          style:
                              TextStyle(color: Color(0xff323232), fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15, left: 50),
                      child: SelectableText.rich(
                        TextSpan(
                          text: 'Communications director at Project Downtown',
                          style:
                              TextStyle(color: Color(0xff323232), fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15, left: 70),
                      child: SelectableText.rich(
                        TextSpan(
                          text:
                              'Mainted the website and lead weekly meal packing services to feed the unhoused population of downtown Orlando',
                          style:
                              TextStyle(color: Color(0xff323232), fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 140),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 50),
                        // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                        child: const SelectableText(
                          "Inventory Tracker",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xff0779E4), fontSize: 35),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 40),
                        child: Flexible(
                          child: OutlinedButton(
                            child: Wrap(
                              children: const [
                                Text(
                                  "Github",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  MyFlutterApp.github,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            onPressed: () async {
                              const url =
                                  "https://github.com/MohammadA8/Inventory-app";
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
                              backgroundColor: Color(0xff6e5494),
                              side: const BorderSide(
                                  width: 3.0, color: Color(0xff0B0C10)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 35, left: 50),
                      child: const Expanded(
                        child: SelectableText.rich(
                          TextSpan(
                            text: 'Purpose of app',
                            style: TextStyle(
                                color: Color(0xff0779E4), fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 15, left: 50, right: 50),
                      child: SelectableText.rich(
                        TextSpan(
                          text:
                              'This is an application used to store inventory item information and and it provides other features regarding inventory',
                          style:
                              TextStyle(color: Color(0xff323232), fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(top: 15, left: 830),
                      child: const Expanded(
                        child: SelectableText.rich(
                          TextSpan(
                            text: 'Demo',
                            style: TextStyle(
                                color: Color(0xff0779E4), fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 15),
                                margin: const EdgeInsets.only(right: 390),
                                child: SelectableText.rich(
                                  TextSpan(
                                    text: 'Technology',
                                    style: TextStyle(
                                        color: Color(0xff323232), fontSize: 20),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 15),
                                margin: const EdgeInsets.only(right: 365),
                                child: SelectableText.rich(
                                  TextSpan(
                                    text: 'Java and Gradle',
                                    style: TextStyle(
                                        color: Color(0xff323232), fontSize: 15),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 15),
                                margin: const EdgeInsets.only(right: 410),
                                child: SelectableText.rich(
                                  TextSpan(
                                    text: 'Overview',
                                    style: TextStyle(
                                        color: Color(0xff323232), fontSize: 20),
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 70),
                                child: SelectableText.rich(
                                  TextSpan(
                                    text:
                                        "You can add and item's identificatino number, name, and price. You can sort the items by each of those catagories. At the end of the your sessionyou can save the inventory record as a text. Later on when you open the application, you can choose toload the old inventory record",
                                    style: TextStyle(
                                        color: Color(0xff323232), fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(right: 30),
                            padding: const EdgeInsets.only(top: 15, left: 40),
                            child: Image.network(
                                "https://media.giphy.com/media/1xQkQnp3yXOmwUtwVZ/giphy.gif")),
                      ],
                    ),
                    const SizedBox(height: 140),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 50),
                        // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                        child: const SelectableText(
                          "Weather App",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xff0779E4), fontSize: 35),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 40),
                        child: Flexible(
                          child: OutlinedButton(
                            child: Wrap(
                              children: const [
                                Text(
                                  "Github",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  MyFlutterApp.github,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            onPressed: () async {
                              const url =
                                  "https://github.com/MohammadA8/Weather-app";
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
                              backgroundColor: Color(0xff6e5494),
                              side: const BorderSide(
                                  width: 3.0, color: Color(0xff0B0C10)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 35, left: 50),
                      child: const Expanded(
                        child: SelectableText.rich(
                          TextSpan(
                            text: 'Purpose of app',
                            style: TextStyle(
                                color: Color(0xff0779E4), fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 15, left: 50, right: 50),
                      child: SelectableText.rich(
                        TextSpan(
                          text:
                              'This application lets the user look up the weather of a certain region in a asthetic and representable way',
                          style:
                              TextStyle(color: Color(0xff323232), fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(top: 15, left: 830),
                      child: const Expanded(
                        child: SelectableText.rich(
                          TextSpan(
                            text: 'Demo',
                            style: TextStyle(
                                color: Color(0xff0779E4), fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 15),
                                margin: const EdgeInsets.only(right: 290),
                                child: SelectableText.rich(
                                  TextSpan(
                                    text: 'Technology',
                                    style: TextStyle(
                                        color: Color(0xff323232), fontSize: 20),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 15),
                                margin: const EdgeInsets.only(right: 180),
                                child: SelectableText.rich(
                                  TextSpan(
                                    text: 'Javascript, HTML, and CSS',
                                    style: TextStyle(
                                        color: Color(0xff323232), fontSize: 15),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 15),
                                margin: const EdgeInsets.only(right: 310),
                                child: SelectableText.rich(
                                  TextSpan(
                                    text: 'Overview',
                                    style: TextStyle(
                                        color: Color(0xff323232), fontSize: 20),
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 70),
                                child: SelectableText.rich(
                                  TextSpan(
                                    text:
                                        "You can look up the regions's name and that will make an API call to the OpenWeatherMap API. This will then add a card associated with info for the specified region. You can also see an image represenation of the weather at that geographical place",
                                    style: TextStyle(
                                        color: Color(0xff323232), fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15, left: 160),
                          margin: const EdgeInsets.only(right: 30),
                          child: Image.network(
                              "https://media.giphy.com/media/JY7xvVjw65z1SLVhT1/giphy.gif"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 250),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 50),
                        // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                        child: const SelectableText(
                          "Contact Manager",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xff0779E4), fontSize: 35),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 40),
                        child: Flexible(
                          child: OutlinedButton(
                            child: Wrap(
                              children: const [
                                Text(
                                  "Github",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  MyFlutterApp.github,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            onPressed: () async {
                              const url =
                                  "https://github.com/alexp0804/ContactManager";
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
                              backgroundColor: Color(0xff6e5494),
                              side: const BorderSide(
                                  width: 3.0, color: Color(0xff0B0C10)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 35, left: 50),
                      child: const Expanded(
                        child: SelectableText.rich(
                          TextSpan(
                            text: 'Purpose of app',
                            style: TextStyle(
                                color: Color(0xff0779E4), fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 15, left: 50, right: 50),
                      child: SelectableText.rich(
                        TextSpan(
                          text:
                              'This application manages a set of contacts for a user through a web platform that is easy to navigate and has many functionalities',
                          style:
                              TextStyle(color: Color(0xff323232), fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(top: 15, left: 830),
                      child: const Expanded(
                        child: SelectableText.rich(
                          TextSpan(
                            text: 'Demo',
                            style: TextStyle(
                                color: Color(0xff0779E4), fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 15),
                                margin: const EdgeInsets.only(right: 290),
                                child: SelectableText.rich(
                                  TextSpan(
                                    text: 'Technology',
                                    style: TextStyle(
                                        color: Color(0xff323232), fontSize: 20),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 15),
                                margin: const EdgeInsets.only(right: 115),
                                child: SelectableText.rich(
                                  TextSpan(
                                    text:
                                        'LAMP stack in addition to Bootstrap 4',
                                    style: TextStyle(
                                        color: Color(0xff323232), fontSize: 15),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 15),
                                margin: const EdgeInsets.only(right: 310),
                                child: SelectableText.rich(
                                  TextSpan(
                                    text: 'Overview',
                                    style: TextStyle(
                                        color: Color(0xff323232), fontSize: 20),
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 70),
                                child: SelectableText.rich(
                                  TextSpan(
                                    text:
                                        "You can add, edit, search, and delete contacts using this app. This app used a Database to store the contacts and the functionality of the app is dynamic. I worked alongside 6 people creating the app, and my main goal was the database and the API.",
                                    style: TextStyle(
                                        color: Color(0xff323232), fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 30),
                          padding: const EdgeInsets.only(top: 15, left: 160),
                          child: Image.network(
                              "https://media.giphy.com/media/YUOuv9vHKKCvbOXzZE/giphy.gif"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 200),
                  ],
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


