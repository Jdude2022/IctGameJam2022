import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:gamejam/classes/Endpoint.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:gamejam/main.dart';

import 'astroid.dart';

class SpaceShip extends SpriteAnimationComponent
    with HasGameRef<SpaceShooterGame>, CollisionCallbacks {
  SpaceShip() : super(size: Vector2.all(100.0));

  static final _paint = Paint()..color = Colors.red;

  bool up = false, down = false, left = false, right = false;
  double turnSpeed = 1;
  double moveSpeed = 10;
  double maxSpeed = 300;
  double vx = 0, vy = 0;
  double acceleration = 3;

  SpriteAnimationComponent shipAnimation = SpriteAnimationComponent();
  final double _animationSpeed = 0.1;
  late final SpriteAnimation _flyingAnimation;
  @override
  Future<void> onLoad() async {
   
    _loadAnimations().then((_) => {animation = _flyingAnimation});
     add(CircleHitbox(radius: (size.x/2)-5, anchor: Anchor.topLeft, position: Vector2(10, 5)));
 super.onLoad();
    //var spritesheet = await images.load('shipSheet.png');

    // SpriteAnimationData spriteData = SpriteAnimationData.sequenced(
    //     amount: 3, stepTime: .3, textureSize: Vector2(32, 32));
    // shipAnimation =
    //     SpriteAnimationComponent.fromFrameData(spritesheet, spriteData)
    //       ..x = 1
    //       ..y = 1
    //       ..size = Vector2(32, 32);
    // sprite = await gameRef.loadSprite('spaceshipver1.png');
    add(RectangleHitbox(size: size));
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('shipSheet.png'),
      srcSize: Vector2(32.0, 32.0),
    );
     _flyingAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 3);
  }
    @override
    void update(double dt) {
      super.update(dt);
      if (left) {
        angle -= turnSpeed * dt;
      } else if (right) {
        angle += turnSpeed * dt;
      } else if (up) {
        vx = cos(angle) * moveSpeed;
        vy = sin(angle) * moveSpeed;

        if (moveSpeed < maxSpeed) {
          moveSpeed += acceleration;
        } else {
          moveSpeed = maxSpeed;
        }
      } else if (down) {}
      if (!up) {
        moveSpeed = 10;
      }
      position.x += vx * dt;
      position.y += vy * dt;

      //Check collisions
      if(position.y+size.y/2>=gameRef.size.y) {
        position.y = gameRef.size.y-size.y/2;
      }
      else if(position.y<=size.y/2) {
        position.y = size.y/2;
      }

      if(position.x+size.x/2>=gameRef.size.x) {
        position.x = gameRef.size.x-size.x/2;
      }
      else if(position.x <= size.x/2) {
        position.x = size.x/2;
      }
      
  
    //Decelerate
      vx*=0.98;
      vy*=0.98; 
    }

    // @override
    // void render(Canvas canvas) {
    //   //super.render(canvas);
    //   // canvas.drawRect(size.toRect(), _paint);
    // }

    @override
    void onCollision(Set<Vector2> points, PositionComponent other) {
      // super.onCollision(points, other);

      // print(other);
      if (other is ScreenHitbox) {
        //...
        // print("collided with screen");
      } else if (other is EndPoint) {
        other.move();
        gameRef.increaseScore();
      }
      else if(other is astroid) {
          gameRef.overlays.add("PauseMenu"); 
          gameRef.pauseEngine();
      }
      // else if (other is YourOtherComponent) {
      //   //...
      // }
    }

    @override
    void onCollisionEnd(PositionComponent other) {
      super.onCollisionEnd(other);
      if (other is ScreenHitbox) {
        //...
      }
      // else if (other is YourOtherComponent) {
      //   //...
      // }
    }
  }

