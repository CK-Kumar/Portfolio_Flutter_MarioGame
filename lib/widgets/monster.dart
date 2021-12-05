import 'package:chandra_portfolio_mariogame/provider/skill_provider.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class Monster extends StatelessWidget {
  const Monster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool castle = context.watch<Skills>().isCatle;
    return Container(
      alignment: const Alignment(0.7, 1),
      child: SizedBox(
        child: castle
            ? Image.asset('lib/assets/images/marioCastle.png')
            : Image.asset('lib/assets/images/marioMonster.png'),
        width: castle ? 200 : 120,
        height: castle ? 200 : 120,
      ),
    );
  }
}
