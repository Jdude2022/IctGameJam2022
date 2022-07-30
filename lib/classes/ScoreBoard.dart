import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Scoreboard extends TextComponent with HasGameRef {
  static final _paint = Paint()..color = Colors.red;

  int score = 0;

  final TextPaint textPaint = TextPaint(
    style: TextStyle(
      fontSize: 48.0,
      fontFamily: 'Awesome Font',
    ),
  );
  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(CircleHitbox(radius: size.x, anchor: Anchor.center));
  }

  @override
  void render(Canvas canvas) {
    textPaint.render(canvas, "Score: $score", Vector2(gameRef.size.x / 3, 10));
  }
}
