    import 'package:flame/components.dart';
    import 'package:flutter/material.dart';
    
    class SpaceShip extends PositionComponent{
      SpaceShip() : super(size: Vector2.all(100.0));

      static final _paint = Paint()..color = Colors.red;
    
      @override
      Future<void> onLoad() async {
        super.onLoad();
        // sprite = await gameRef.loadSprite('idle.png');
      
      }

      @override
      void update(double dt) {
        position.x-=0.1;
        // this.transform.angle+=0.1;
      
      }

      @override
      void render(Canvas canvas) {
        canvas.drawRect(size.toRect(), _paint);
      }
    }