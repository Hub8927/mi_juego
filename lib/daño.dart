import 'package:flame/components.dart';
import 'personaje.dart';
import 'dart:ui';

abstract class Dano {
  double x;
  double y;
  double ancho;
  double alto;
  int danio;

  Dano({
    required this.x,
    required this.y,
    this.ancho = 10,
    this.alto = 10,
    required this.danio,
  });

  Rect get rect => Rect.fromLTWH(x, y, ancho, alto);

  /// Aplica el daño al personaje (método a implementar en las clases hijas)
  void aplicar(personaje objetivo);
}

class Bala extends Dano {
  double velocidadX;
  double velocidadY;

  Bala({
    required double x,
    required double y,
    this.velocidadX = 5,
    this.velocidadY = 0,
    int danio = 10,
    double ancho = 5.0,
    double alto = 5.0,
  }) : super(x: x, y: y, ancho: ancho, alto: alto, danio: danio);

  void mover() {
    x += velocidadX;
    y += velocidadY;
  }

  @override
  void aplicar(personaje objetivo) {
    if (rect.overlaps(objetivo.rect)) {
      objetivo.vida -= danio;
      print('${objetivo.nombre} recibió $danio de daño por bala');
    }
  }
}
