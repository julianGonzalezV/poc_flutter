import 'package:flutter/material.dart';

/*
* Home temporal o Version 1.0.0 para entender la evolcución, PERO EL HOME REAL ES
* home_page.dart
*/
class HomePageV1 extends StatelessWidget {
  final listado = [
    'aaaa',
    'bbbb',
    'cccc'
  ]; // final porque estamos en un StatelessWidget

  List<Widget> _listaHomeImperativo() {
    List<Widget> listResult = [];
    for (var item in listado) {
      /*listResult.add(ListTile(
        title: Text(item),
      ));
      listResult.add(Divider());*/

      // One line and composition
      listResult..add(ListTile(title: Text(item)))..add(Divider());
    }
    return listResult;
  }

  List<Widget> _listaHomeDeclarativo() {
    return listado
        .map((e) => Column(
              children: <Widget>[
                ListTile(
                  title: Text(e),
                  subtitle: Text('Subtitulo'),
                  leading: Icon(
                      Icons.access_time), //leading es un elemento al inicio
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () => {},
                ),
                Divider()
              ],
            ))
        .toList();
  }

  TextStyle estiloTexto = new TextStyle(fontSize: 30);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba de concepto V1'),
        centerTitle: true,
      ),
      body: ListView(
        children: _listaHomeDeclarativo(),
      ),
    );
  }
}
