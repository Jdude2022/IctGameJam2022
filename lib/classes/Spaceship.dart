    import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
    import 'package:flutter/material.dart';
import 'package:gamejam/classes/Endpoint.dart';
    
    class SpaceShip extends SpriteComponent with HasGameRef, CollisionCallbacks{
      SpaceShip() : super(size: Vector2.all(100.0));

      static final _paint = Paint()..color = Colors.red;

      bool up = false, down=false, left=false, right=false;
      double turnSpeed = 1;
      double moveSpeed = 10;
      double maxSpeed = 300;
      double vx = 0,vy=0;
      double acceleration = 3;


      @override
      Future<void> onLoad() async {
        super.onLoad();
        sprite = await gameRef.loadSprite('spaceshipver1.png');
        add(RectangleHitbox(size:Vector2.all(100)));
  
      }

      @override
      void update(double dt) {

        if(left) {
          angle-=turnSpeed*dt;
        } 
        else if(right){
          angle+=turnSpeed*dt;
        } 
        else if(up) {
          
          vx = cos(angle) * moveSpeed;
          vy = sin(angle) * moveSpeed;

          if(moveSpeed<maxSpeed) {
            moveSpeed+=acceleration;
          }
          else {
            moveSpeed = maxSpeed;
          }
       
          
        } 
        else if(down) {

        }    
        if(!up) {
          moveSpeed = 10;
        }
      position.x+=vx*dt;
      position.y+=vy*dt;
      vx*=0.98;
      vy*=0.98; 


      //Check collisions

      }

      @override
      void render(Canvas canvas) {
        super.render(canvas);
        // canvas.drawRect(size.toRect(), _paint);
        
      }


 @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    // super.onCollision(points, other);

    
    // print(other);
    if (other is ScreenHitbox) {
      //...
   print("collided with screen");
    } 
    else if (other is EndPoint) {
      other.move();
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