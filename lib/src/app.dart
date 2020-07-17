import 'package:flutter/material.dart';
import 'package:poc_flutter/src/pages/home_page.dart';

class PruebaConcepto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:
            false, // para borrar la etiqueta de DEBUG en la parte superior derecha
        home: HomePage());
  }
}
