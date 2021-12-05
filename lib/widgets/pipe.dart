import 'package:flutter/material.dart';

class Pipe extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final size;
  // ignore: use_key_in_widget_constructors
  const Pipe(this.size);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset('lib/assets/images/mario_pipe.png'),
      width: 80,
      height: size,
    );
  }
}
