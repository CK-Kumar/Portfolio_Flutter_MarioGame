import 'package:flutter/material.dart';

class Clouds extends StatelessWidget {
  const Clouds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(-0.5, -1),
      child: SizedBox(
        child: Image.asset('lib/assets/images/clouds.png'),
        width: 200,
        height: 200,
      ),
    );
  }
}
