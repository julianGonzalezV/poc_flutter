import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  double _ancho = 50.0;
  double _alto = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderR = BorderRadius.circular(10.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contenedores animados'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _ancho,
          height: _alto,
          decoration: BoxDecoration(
            borderRadius: _borderR,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            _ancho = Random().nextDouble() * 100;
            _alto = Random().nextDouble() * 100;
            _color = Color((Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0);
            _borderR = BorderRadius.circular(Random().nextDouble() * 100);
          });
        },
      ),
    );
  }
}
