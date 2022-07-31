import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:gamejam/main.dart';

class MyGame extends StatelessWidget {
  MyGame({Key? key}) : super(key: key);

  final game = SpaceShooterGame();

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: game, overlayBuilderMap: {
      'PauseMenu': (BuildContext context, SpaceShooterGame game) {
        return Center(
          child: Text(
            "Game over\nPress space to play again",
            style: TextStyle(
              fontSize: 80,
              color: Colors.red,
            ),
          ),
        );
      }
    });
  }
}
