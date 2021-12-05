// ignore_for_file: prefer_const_constructors

import 'package:chandra_portfolio_mariogame/provider/movement_provider.dart';
import 'package:chandra_portfolio_mariogame/provider/skill_provider.dart';
import 'package:chandra_portfolio_mariogame/screens/mario_world.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Movement()),
    ChangeNotifierProvider(create: (_) => Skills())
  ], child: MyApp()));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var marioFont = GoogleFonts.pressStart2p(fontSize: 20, color: Colors.yellow);
  var gameFont = GoogleFonts.pressStart2p(fontSize: 30, color: Colors.white);
  bool hasPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
              // ignore: avoid_unnecessary_containers
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 10),
                    child: Text('Hi, Welcome to my Portfolio...',
                        style: marioFont),
                  ),
                  Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange[800],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Chandra Kumar S',
                        style: gameFont,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(),
                    alignment: Alignment(0, 1),
                    child: SizedBox(
                      height: 350,
                      width: 350,
                      child: Image.asset(
                        'lib/assets/images/mario.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            flex: 5,
          ),
          Expanded(
              child: Container(
            alignment: Alignment(0, 0),
            color: Colors.brown,
            child: SizedBox(
                width: 300,
                height: 60,

                // ignore: deprecated_member_use
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          !hasPressed ? Colors.green : Colors.blue[300]),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black)))),
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_circle,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Click here...',
                          style: GoogleFonts.pressStart2p(
                              fontSize: 15, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      hasPressed = true;
                    });
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MarioWorld()));
                    SystemChrome.setPreferredOrientations(
                        [DeviceOrientation.landscapeLeft]);
                  },
                )),
          ))
        ],
      ),
    );
  }
}
