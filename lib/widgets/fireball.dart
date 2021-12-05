import 'package:chandra_portfolio_mariogame/provider/skill_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class FireBall extends StatelessWidget {
  const FireBall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fireX = context.watch<Skills>().fire;
    return Container(
      alignment: Alignment(fireX, 1),
      child: SizedBox(
        child: Image.asset('lib/assets/images/fireball.gif'),
        width: 30,
        height: 30,
      ),
    );
  }
}
