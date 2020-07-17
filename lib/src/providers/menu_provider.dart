import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

// _ antes del nombre de la clase para no exponerlo al mundo exterior
class _MenuProvider {
  List<dynamic> opciones = [];
  _MenuProvider() {
    _cargarMenu();
  }

  void _cargarMenu() {
    rootBundle.loadString('data/listado-menu.json').then((datos) {
      Map datosMap = json.decode(datos);
      print('Map $datosMap');
    });
  }
}

/*
* Así, solo se estaría exponiendo la instancia 
* Para que se hace? R/ para evitar siempre el llamado de nuevo  ya que lo carga de una
* en la memoria (epecie de caché)
*/
final menuProvider = new _MenuProvider();
