import 'package:flame/collisions.dart';
import 'colision.dart';
import 'daño.dart';
import 'package:flutter/material.dart';
import 'campo.dart';
import 'dart:ui';

class BalaComponent extends PositionComponent with CollisionCallbacks {
  final double velocidadX;
  final double velocidadY;

  BalaComponent({
    required Vector2 posicionInicial,
    this.velocidadX = 5,
    this.velocidadY = 0,
  }) {
    position = posicionInicial;
    size = Vector2(5, 5);
    add(RectangleHitbox()); // Agrega la caja de colisión
  }

  @override
  void update(double dt) {
    position.add(Vector2(velocidadX, velocidadY));
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is ZombieComponent) {
      print('¡Bala golpeó al zombie!');
      removeFromParent(); // Destruye la bala
    }
    super.onCollision(intersectionPoints, other);
  }
}
