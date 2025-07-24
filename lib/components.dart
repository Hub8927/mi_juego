import 'package:flame/game.dart';
import 'package:flame/components.dart';

class MiJuego extends FlameGame {
  @override
  Future<void> onLoad() async {
    final soldadoSprite = await loadSprite('imagenes/soldado.webp');
    final zombieSprite = await loadSprite('imagenes/zombie.jpg');

    add(SpriteComponent(sprite: soldadoSprite, position: Vector2(100, 100)));
    add(SpriteComponent(sprite: zombieSprite, position: Vector2(200, 100)));

    await super.onLoad();
  }
}
