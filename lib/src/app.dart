import 'package:flutter/material.dart';
import 'package:poc_flutter/src/pages/alert_page.dart';
import 'package:poc_flutter/src/pages/avatar_page.dart';
import 'package:poc_flutter/src/pages/contador_page.dart';
import 'package:poc_flutter/src/pages/home_page.dart';

class PruebaConcepto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // para borrar la etiqueta de DEBUG en la parte superior derecha
    // use debugShowCheckedModeBanner:false
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        'alert': (BuildContext context) => EjemploAlerta(),
        'avatar': (BuildContext context) => EjemploAvatar(),
        'whatch': (BuildContext context) => ContadorPage(),
      },
    );
  }
}
