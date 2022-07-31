import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Bullet extends SpriteComponent with HasGameRef {
  static final _paint = Paint()..color = Colors.red;
  double vx = 0;
  double vy = 0;
  String spriteFile = "spaceshipver1.png";

  Bullet({vx, vy, spriteFile});

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('spaceshipver1.png');
    add(RectangleHitbox(size: size));
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double dt) {
    position.x += vx * dt * 100;
    position.y += vy * dt * 100;
  }
}
