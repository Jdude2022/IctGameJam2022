
import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

import 'package:flame/game.dart';

import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:gamejam/classes/ScoreBoard.dart';

import 'classes/Spaceship.dart';
import 'classes/Background.dart';

import 'classes/Endpoint.dart';


class SpaceShooterGame extends FlameGame with HasCollisionDetection {
  late SpaceShip player;
  late EndPoint endPoint;
  Scoreboard scoreBoard = Scoreboard();
  bool left = false, right = false, up = false, down = false;

  Background _background = Background();

@override
  bool get debugMode => true;

  void increaseScore() {
    scoreBoard.score++;
  }

  //Called once when the game starts

  @override
  Future<void> onLoad() async {
    
    await super.onLoad();

    await add(_background);
  
    camera.viewport = FixedResolutionViewport(Vector2(800, 600));

 add(ScreenHitbox());

    player = SpaceShip()
      ..position = size / 2
      ..width = 50
      ..height = 50
      ..anchor = Anchor.center
      ..angle = radians(45);

    endPoint = EndPoint()
      ..position = Vector2(size.x - 50, 50)
      ..width = 50
      ..height = 50
      ..anchor=Anchor.center;

    add(player);

    add(endPoint);
    add(scoreBoard);

    //  camera.followComponent(player);
  }
  @override
  void update(double dt) {
    super.update(dt);
      if (RawKeyboard.instance.keysPressed.contains(LogicalKeyboardKey.keyA)) {
      player.left = true;
    } else {
      player.left = false;
    }
    if (RawKeyboard.instance.keysPressed.contains(LogicalKeyboardKey.keyD)) {
      player.right = true;
    } else {
      player.right = false;
    }
    if (RawKeyboard.instance.keysPressed.contains(LogicalKeyboardKey.keyW)) {
      player.up = true;
    } else {
      player.up = false;
    }
    if (RawKeyboard.instance.keysPressed.contains(LogicalKeyboardKey.keyS)) {
      player.down = true;
    } else {
      player.down = false;
    }
  }
}





void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Flame.device.setLandscape();
  Flame.device.fullScreen();
  runApp(GameWidget(game: SpaceShooterGame()));
}