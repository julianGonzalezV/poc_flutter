import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

// _ antes del nombre de la clase para no exponerlo al mundo exterior
class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {}

  /// _cargarMenu
  /// Se realiza cambio a async dado que cuando se llamaba desde home_page
  /// continuaba el computo y no llenaba las opciones del menu
  Future<List<dynamic>> cargarDatosMenu() async {
    final loadResponse = await rootBundle.loadString('data/listado-menu.json');
    Map datosMap = json.decode(loadResponse);
    print('Map $datosMap');
    opciones = datosMap[
        'opciones']; //opciones es el key del json en data/listado-menu.json
    return opciones;
  }
}

/*
* Así, solo se estaría exponiendo la instancia 
* Para que se hace? R/ para evitar siempre el llamado de nuevo  ya que lo carga de una
* en la memoria (epecie de caché)
*/
final menuProvider = new _MenuProvider();
