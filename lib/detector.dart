import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'bala_component.dart';
import 'zombie_component.dart';

class MiJuego extends FlameGame with HasCollisionDetection, TapDetector {
  late final ZombieComponent zombie;
  late final PositionComponent soldado;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Crea un "soldado" visual (puedes luego usar SpriteComponent si quieres una imagen)
    soldado = PositionComponent()
      ..position = Vector2(100, 300)
      ..size = Vector2(30, 30)
      ..anchor = Anchor.topLeft;

    // Pintamos el soldado como un rectángulo rojo
    soldado.add(RectangleHitbox());
    add(soldado);

    // Agrega un zombie
    zombie = ZombieComponent(posicion: Vector2(250, 300));
    add(zombie);
  }

  @override
  void onTapDown(TapDownInfo info) {
    // Crear bala desde la posición del soldado
    final bala = BalaComponent(
      posicionInicial: Vector2(
        soldado.x + soldado.width,
        soldado.y + soldado.height / 2 - 2.5,
      ),
      velocidadX: 5,
      velocidadY: 0,
      dano: null,
    );

    add(bala);
  }
}
