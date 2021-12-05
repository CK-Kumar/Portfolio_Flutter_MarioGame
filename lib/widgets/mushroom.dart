import 'package:chandra_portfolio_mariogame/provider/movement_provider.dart';
// ignore: unused_import
import 'package:chandra_portfolio_mariogame/provider/skill_provider.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class Mushroom extends StatelessWidget {
  const Mushroom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mushroomX = context.watch<Movement>().mushroom;
    double x = context.watch<Movement>().marioX;
    int marioLevel = context.watch<Movement>().level;
    return Container(
      alignment: marioLevel == 2 && x >= 5.065392549852277e-16
          ? const Alignment(2, 1)
          : Alignment(mushroomX, 1),
      child: SizedBox(
        child: Image.asset('lib/assets/images/mushroom.png'),
        width: 50,
        height: 50,
      ),
    );
  }
}
