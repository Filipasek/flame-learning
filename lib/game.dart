import 'dart:ui';
import 'dart:math';

import 'package:Game/components/fly.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';

class LangawGame extends Game {
  Size screenSize;
  double tileSize;
  Random rnd;

  LangawGame() {
    initialize();
  }
  List<Fly> flies;
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);

    flies.forEach((Fly fly) => fly.render(canvas));
  }

  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
  }

  void initialize() async {
    flies = List<Fly>();
    resize(await Flame.util.initialDimensions());
    rnd = Random();
    spawnFly();
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);

    flies.add(Fly(this, x, y));
  }
}
