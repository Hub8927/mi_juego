import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'campo.dart';
import 'dart:ui';
import 'personaje.dart';
import 'daño.dart';
import 'package:flutter/material.dart';
import 'colision.dart';

class MiJuego extends FlameGame {
  @override
  Future<void> onLoad() async {
    // Aquí cargarás el personaje e imágenes luego
    soldado miSoldado = soldado(
      'apolo',
      'fuerza',
      1,
      100,
      0,
      20,
      10,
      50,
      50,
      30,
      30,
    );
    print(miSoldado);
    miSoldado.atacar();
    miSoldado.subirNivel();
    miSoldado.recibirdano();
    miSoldado.curar();
    miSoldado.morir();

    zombie miZombie = zombie('veneno', 1, 50, 15, 5, 100, 100, 30, 30);
    print(miZombie);
    miZombie.atacar();
    miZombie.recibirdano();
    miZombie.morir();

    final soldadoSprite = await loadSprite('imagenes/soldado.webp');
    final zombieSprite = await loadSprite('imagenes/zombie.jpg');

    add(SpriteComponent(sprite: soldadoSprite, position: Vector2(100, 100)));
    add(SpriteComponent(sprite: zombieSprite, position: Vector2(200, 100)));

    await super.onLoad();
  }
}
