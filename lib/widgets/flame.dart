import 'package:chandra_portfolio_mariogame/provider/skill_provider.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class Flame extends StatelessWidget {
  const Flame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double flameX = context.watch<Skills>().flame;
    return Container(
      alignment: Alignment(flameX, 0.6),
      child: SizedBox(
        child: Image.asset('lib/assets/images/monsterFlame.png'),
        width: 50,
        height: 50,
      ),
    );
  }
}
