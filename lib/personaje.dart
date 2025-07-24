import 'dart:ui'; // Asegúrate de tener esta importación

abstract class personaje {
  String _nombre;
  String _poder;
  int _nivel;
  int _vida;
  int _experiencia;
  int _fuerza;
  int _defenza;

  double x;
  double y;
  double ancho;
  double alto;

  personaje(
    this._nombre,
    this._poder,
    this._nivel,
    this._vida,
    this._experiencia,
    this._fuerza,
    this._defenza,

    this.x,
    this.y,
    this.ancho,
    this.alto,
  );
  String get nombre => _nombre;
  String get poder => _poder;
  int get nivel => _nivel;
  int get vida => _vida;
  int get experiencia => _experiencia;
  int get fuerza => _fuerza;
  int get defenza => _defenza;

  Rect get rect => Rect.fromLTWH(x, y, ancho, alto);

  set nombre(String nombre) {
    _nombre = nombre;
  }

  set poder(String poder) {
    _poder = poder;
  }

  set nivel(int nivel) {
    _nivel = nivel;
  }

  set vida(int vida) {
    _vida = vida;
  }

  set experiencia(int experiencia) {
    _experiencia = experiencia;
  }

  set fuerza(int fuerza) {
    _fuerza = fuerza;
  }

  set defenza(int defenza) {
    _defenza = defenza;
  }

  void atacar();
  void subirNivel();
  void recibirdano();
  void curar();
  void morir();
}

class soldado extends personaje {
  soldado(
    String nombre,
    String poder,
    int nivel,
    int vida,
    int experiencia,
    int fuerza,
    int defenza,

    double x,
    double y,
    double ancho,
    double alto,
  ) : super(
        nombre,
        poder,
        nivel,
        vida,
        experiencia,
        fuerza,
        defenza,
        x,
        y,
        ancho,
        alto,
      );
  @override
  void atacar() {
    print('El soldado $_nombre ataca con su poder $_poder');
  }

  @override
  void subirNivel() {
    _nivel++;
    print('El soldado $_nombre ha subido al nivel $_nivel');
  }

  @override
  void recibirdano() {
    _vida -= 10;
    print('El soldado $_nombre ha recibido daño. Vida restante: $_vida');
  }

  @override
  void curar() {
    _vida += 10;
    print('El soldado $_nombre se ha curado. Vida actual: $_vida');
  }

  @override
  void morir() {
    print('El soldado $_nombre ha muerto.');
  }

  @override
  String toString() {
    return 'Soldado: $_nombre, Poder: $_poder, Nivel: $_nivel, Vida: $_vida, Experiencia: $_experiencia, Fuerza: $_fuerza, Defenza: $_defenza';
  }
}

class zombie extends personaje {
  zombie(
    String poder,
    int nivel,
    int vida,
    int fuerza,
    int defenza,
    double x,
    double y,
    double ancho,
    double alto,
  ) : super(
        'zombie',
        poder,
        nivel,
        vida,
        0,
        fuerza,
        defenza,
        x,
        y,
        ancho,
        alto,
      );

  @override
  void atacar() {
    print('ataca con su poder $_poder');
  }

  @override
  void subirNivel() {
    _nivel++;
    print('El zombie $_nombre ha subido al nivel $_nivel');
  }

  @override
  void recibirdano() {
    _vida -= 5;
    print('El zombie $_nombre ha recibido daño. Vida restante: $_vida');
  }

  @override
  void curar() {
    _vida += 5;
    print('El zombie $_nombre se ha curado. Vida actual: $_vida');
  }

  @override
  void morir() {
    print('ha muerto.');
  }

  @override
  String toString() {
    return ' Poder: $_poder, Nivel: $_nivel, Vida: $_vida, Fuerza: $_fuerza, Defenza: $_defenza';
  }
}

void main() {
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
}
