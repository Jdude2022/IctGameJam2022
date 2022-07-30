import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
    import 'package:flutter/material.dart';

class EndPoint extends PositionComponent with CollisionCallbacks, HasGameRef{
  static final _paint = Paint()..color = Colors.red;
  

     @override
      Future<void> onLoad() async {
        super.onLoad();
        add(CircleHitbox());
  
      }

  @override
  void render(Canvas canvas) {
    canvas.drawCircle(Offset.zero, size.length, _paint);
  }

  void move(){
    position.x = Random().nextInt(700)+50;
    position.y = Random().nextInt(500)+50;
  }
}