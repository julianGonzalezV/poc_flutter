import 'package:flutter/material.dart';
import 'package:poc_flutter/src/pages/alert_page.dart';
import 'package:poc_flutter/src/pages/animated_page.dart';
import 'package:poc_flutter/src/pages/avatar_page.dart';
import 'package:poc_flutter/src/pages/card_page.dart';
import 'package:poc_flutter/src/pages/contador_page.dart';
import 'package:poc_flutter/src/pages/home_page.dart';
import 'package:poc_flutter/src/pages/inputs_page.dart';
import 'package:poc_flutter/src/pages/list_view_page.dart';
import 'package:poc_flutter/src/pages/slider_page.dart';

Map<String, WidgetBuilder> appRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => EjemploAlerta(),
    'avatar': (BuildContext context) => EjemploAvatar(),
    'whatch': (BuildContext context) => ContadorPage(),
    'card': (BuildContext context) => CardPage(),
    'inputs': (BuildContext context) => EjemploInputs(),
    'slider': (BuildContext context) => SliderPage(),
    'animated': (BuildContext context) => AnimatedPage(),
    'list': (BuildContext context) => ListPage(),
  };
}
