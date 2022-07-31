

import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';

import 'GameComponent.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlameSplashScreen(
  theme: FlameSplashTheme.dark,
    showAfter: (BuildContext context) {
    return Text("Space Game");
  },
  onFinish: (BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => MyGame())),
  );
  }
}
