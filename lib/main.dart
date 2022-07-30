
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

import 'package:flame/game.dart';

import 'package:flame/components.dart';
import 'package:flutter/services.dart';

import 'classes/Spaceship.dart';





class EndPoint extends PositionComponent {
  static final _paint = Paint()..color = Colors.red;

  @override
  void render(Canvas canvas) {
    canvas.drawCircle(Offset.zero, size.length, _paint);
  }
}


class SpaceShooterGame extends FlameGame with KeyboardEvents{

  late SpaceShip player; 
  late bool left = false, right=false, up=false, down=false;


// Handle all the key events

   @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is RawKeyDownEvent;
    

    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);

    if(keysPressed.contains(LogicalKeyboardKey.keyA)){
      player.angle-=0.1;
    }
    if(keysPressed.contains(LogicalKeyboardKey.keyD)) {

    }
    if(keysPressed.contains(LogicalKeyboardKey.keyW)) {

    }
    if(keysPressed.contains(LogicalKeyboardKey.keyS)) {

    }

    if (isSpace && isKeyDown) {
      if (keysPressed.contains(LogicalKeyboardKey.altLeft) ||
          keysPressed.contains(LogicalKeyboardKey.altRight)) {
            
        
      } else {
        player.transform.angle+=1;
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }


  //Called once when the game starts

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    camera.viewport = FixedResolutionViewport(Vector2(800,600));

    player = SpaceShip()
        ..position = size / 2
        ..width = 50
        ..height = 50
        ..anchor = Anchor.center;

    add(player);
    add(SpaceShip()..position = Vector2(0,size.y-100)..width=50..height=100);
    add(EndPoint()..position=Vector2(size.x-50,50)..width=50..height=50);


    camera.followComponent(player);

  
  }

}

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  Flame.device.setLandscape();
  Flame.device.fullScreen();
  runApp(GameWidget(game: SpaceShooterGame()));
}