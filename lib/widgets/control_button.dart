import 'package:chandra_portfolio_mariogame/provider/movement_provider.dart';
import 'package:chandra_portfolio_mariogame/provider/skill_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int marioStop = context.watch<Movement>().stop;
    return GestureDetector(
      onTap: () {
        if (marioStop == 1) {
          context.read<Movement>().moveForward();
          context.read<Skills>().skillUpdation();
        }
        if (marioStop == 2 || marioStop == 3) {
          context.read<Movement>().jump();
          context.read<Skills>().skillUpdation();
        }
        if (marioStop == 4 ||
            marioStop == 5 ||
            marioStop == 8 ||
            marioStop == 9 ||
            marioStop == 12) {
          context.read<Movement>().moveForward();
          context.read<Skills>().skillUpdation();
        }
        if (marioStop == 6) {
          context.read<Movement>().linerJump();
          context.read<Skills>().skillUpdation();
        }

        if (marioStop == 7) {
          context.read<Movement>().linerJump();
          context.read<Movement>().mushroomMovement();
          context.read<Skills>().skillUpdation();
        }
        if (marioStop == 10) {
          context.read<Movement>().counter();
          context.read<Skills>().flameMovement();
          context.read<Skills>().skillUpdation();
        }
        if (marioStop == 11) {
          context.read<Movement>().counter();
          context.read<Skills>().fireMovement();
          context.read<Skills>().skillUpdation();
        }
        if (marioStop == 13) {
          context.read<Movement>().counter();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            child: const Icon(Icons.forward),
          ),
        ),
      ),
    );
  }
}
