import 'package:chandra_portfolio_mariogame/provider/movement_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int marioStop = context.watch<Movement>().stop;
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Text(
        marioStop != 13
            ? 'Start to play my Journey!!!'
            : 'Bravo! We have Completed!',
        style: marioStop != 13
            ? GoogleFonts.pressStart2p(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)
            : GoogleFonts.pressStart2p(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
