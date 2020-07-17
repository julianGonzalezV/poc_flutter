import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final listado = ['aaaa', 'bbbb', 'cccc'];

  TextStyle estiloTexto = new TextStyle(fontSize: 30);
  @override
  Widget build(BuildContext context) {
    // Flutter io : Saffold is an elemente that full
    // all the cel display and allows adding an appBar(header)
    // and bottomBar(footer)
    // and drawers(lateral Menu)
    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba de concepto'),
        centerTitle: true,
      ),
      body: _lista(),
    );
  }

// Dado que LisView en el arbol de herencia resulta ser un Widget entonces
// el tipo de retorno pordría ser un "Widget", ya que el "body" del Scaffold
// recibe todo lo herede de él, incluyendolo :)
  ListView _lista() {
    return ListView(children: _listadoMenu());
  }

  List<Widget> _listadoMenu() {
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
}
