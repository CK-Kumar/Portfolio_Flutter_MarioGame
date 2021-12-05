import 'package:chandra_portfolio_mariogame/provider/movement_provider.dart';
import 'package:chandra_portfolio_mariogame/provider/skill_provider.dart';
import 'package:chandra_portfolio_mariogame/widgets/clouds.dart';
import 'package:chandra_portfolio_mariogame/widgets/control_button.dart';
import 'package:chandra_portfolio_mariogame/widgets/fireball.dart';
import 'package:chandra_portfolio_mariogame/widgets/flame.dart';
import 'package:chandra_portfolio_mariogame/widgets/level%201/about.dart';
import 'package:chandra_portfolio_mariogame/widgets/mario_movement.dart';
import 'package:chandra_portfolio_mariogame/widgets/monster.dart';
import 'package:chandra_portfolio_mariogame/widgets/mushroom.dart';
import 'package:chandra_portfolio_mariogame/widgets/pipe.dart';
import 'package:chandra_portfolio_mariogame/widgets/skill_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class MarioWorld extends StatefulWidget {
  const MarioWorld({Key? key}) : super(key: key);

  @override
  State<MarioWorld> createState() => _MarioWorldState();
}

class _MarioWorldState extends State<MarioWorld> {
  @override
  Widget build(BuildContext context) {
    double x = context.watch<Movement>().marioX;
    double y = context.watch<Movement>().marioY;
    bool displayButton = context.watch<Movement>().buttonPressed;
    bool isText = context.watch<Skills>().textShowm;
    int marioLevel = context.watch<Movement>().level;
    int marioStop = context.watch<Movement>().stop;
    double money = context.watch<Movement>().moneyY;
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        return true;
      },
      child: Scaffold(
        body: marioStop != 14
            ? Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Stack(children: [
                      if (marioLevel == 2) const Mushroom(),
                      Container(
                        color: marioLevel == 1
                            ? Colors.blue
                            : marioLevel == 2
                                ? Colors.blue
                                : Colors.black,
                        child: AnimatedContainer(
                          alignment: Alignment(x, y),
                          duration: const Duration(),
                          child: const MarioMovement(),
                        ),
                      ),
                      Container(),
                      if (marioLevel == 1 || marioLevel == 2) const Clouds(),
                      if (marioLevel == 2) const Mushroom(),
                      Container(
                        alignment: const Alignment(-0.8, -0.8),
                        child: Text(
                          'LEVEL $marioLevel',
                          style: GoogleFonts.pressStart2p(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                      if ((marioStop == 1 && marioLevel == 1) ||
                          (marioStop == 13 && marioLevel == 3))
                        Container(
                            alignment: marioStop != 13
                                ? const Alignment(0.7, 0)
                                : const Alignment(-0.6, -0.4),
                            child: const About()),
                      if (marioStop >= 2 && marioLevel == 1)
                        Container(
                          alignment: const Alignment(-0.1, 1),
                          child: const Pipe(60.0),
                        ),
                      if (marioStop >= 2 && marioLevel == 1)
                        Container(
                          alignment: const Alignment(0.5, 1),
                          child: const Pipe(85.0),
                        ),
                      if (marioStop >= 2 && marioLevel == 1)
                        Container(
                          alignment: const Alignment(0.65, 1),
                          child: const Pipe(55.0),
                        ),
                      const SkillText(),
                      if (marioLevel == 2)
                        Container(
                          alignment: Alignment(-0.5, money),
                          child: Container(
                            color: Colors.green,
                            height: 30,
                            width: 30,
                            child: const Center(
                                child: Text("\$",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30))),
                          ),
                        ),
                      if (marioLevel == 2)
                        Container(
                          alignment: const Alignment(-0.5, 0.4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: 38,
                              width: 38,
                              color: Colors.brown,
                              child: const Center(
                                  child: Text("?",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20))),
                            ),
                          ),
                        ),
                      if (marioLevel == 3) const Flame(),
                      if (marioLevel == 3) const FireBall(),
                      if (marioLevel == 3) const Monster(),
                      Container(
                        alignment: const Alignment(0.7, -0.6),
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.green),
                          child: Text(
                            marioLevel == 1
                                ? 'Skills'
                                : marioLevel == 2
                                    ? 'Education'
                                    : 'Work Experience',
                            style: GoogleFonts.pressStart2p(
                                fontSize: 25, color: Colors.yellow),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                      child: Container(
                    color: marioLevel == 1
                        ? Colors.brown
                        : marioLevel == 2
                            ? Colors.green
                            : Colors.grey,
                    child: !displayButton && !isText
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // ignore: prefer_const_constructors
                            children: const [
                              Text(
                                'T A P  T H E  B U T T O N',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 20, right: 20)),
                              ControlButton()
                            ],
                          )
                        : null,
                  ))
                ],
              )
            : Container(
                color: Colors.black,
                child: Stack(
                  children: [
                    Container(
                      alignment: const Alignment(0, -0.4),
                      child: Text(
                        'Game Over',
                        style: GoogleFonts.pressStart2p(
                            fontSize: 35, color: Colors.white),
                      ),
                    ),
                    Container(
                      alignment: const Alignment(0, 0),
                      child: const Text(
                        'Contact : chandru0063@gmail.com',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Container(
                      alignment: const Alignment(0, 0.6),
                      child: SizedBox(
                          width: 150,
                          height: 60,

                          // ignore: deprecated_member_use
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Colors.black)))),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.exit_to_app,
                                  size: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Exit',
                                    style: GoogleFonts.pressStart2p(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                          )),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
