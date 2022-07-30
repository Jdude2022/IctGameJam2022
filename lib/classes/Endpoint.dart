import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/sprite.dart';
import 'package:gamejam/main.dart';

class EndPoint extends SpriteAnimationComponent with HasGameRef {
  static final _paint = Paint()..color = Colors.red;

  SpriteAnimationComponent TapeAnimation = SpriteAnimationComponent();
  final double _animationSpeed = 0.1;
  late final SpriteAnimation _tapeAnimation;

  @override
  Future<void> onLoad() async {
    _loadAnimations().then((_) => {animation = _tapeAnimation});
    add(CircleHitbox());
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('TapeWormSheet.png'),
      srcSize: Vector2(128.0, 128.0),
    );
    _tapeAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 5);
  }

  // @override
  // void render(Canvas canvas) {
  //   canvas.drawCircle(Offset.zero, size.x, _paint);
  // }

  void move() {
    position.x = Random().nextInt(700) + 50;
    position.y = Random().nextInt(500) + 50;
  }
}
