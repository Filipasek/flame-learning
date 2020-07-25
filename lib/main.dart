import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:Game/game.dart';
import 'package:flutter/gestures.dart';

void main() {
  BoxGame game = BoxGame();
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;

  runApp(game.widget);

  Util flameUtil = new Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);
  flameUtil.addGestureRecognizer(tapper);
}
