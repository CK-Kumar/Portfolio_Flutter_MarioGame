import 'package:chandra_portfolio_mariogame/provider/skill_provider.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class SkillText extends StatelessWidget {
  const SkillText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double yAxis = context.watch<Skills>().skillY;
    List skillPoints = context.watch<Skills>().skillSets;
    int i = context.watch<Skills>().index;

    return Container(
      alignment: Alignment(-0.65, yAxis),
      child: SizedBox(
        child: Text(skillPoints[i],
            style: const TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.bold)),
        width: 200,
        height: 80,
      ),
    );
  }
}
