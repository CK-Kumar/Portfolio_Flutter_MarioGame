// ignore_for_file: implementation_imports

import 'package:chandra_portfolio_mariogame/provider/movement_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class MarioMovement extends StatelessWidget {
  const MarioMovement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isRunning = context.watch<Movement>().run;
    bool isJumping = context.watch<Movement>().isJump;
    double x = context.watch<Movement>().marioX;
    int marioLevel = context.watch<Movement>().level;
    return SizedBox(
      child: !isRunning
          ? Image.asset('lib/assets/images/standingMario.png')
          : isJumping
              ? Image.asset('lib/assets/images/jumpingMario.png')
              : Image.asset('lib/assets/images/runningMario.png'),
      width: (marioLevel == 2 && x >= 5.065392549852277e-16) || marioLevel == 3
          ? 70
          : 50,
      height: (marioLevel == 2 && x >= 5.065392549852277e-16) || marioLevel == 3
          ? 70
          : 50,
    );
  }
}
