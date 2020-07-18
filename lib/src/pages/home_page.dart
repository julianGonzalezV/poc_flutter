import 'package:flutter/material.dart';
import 'package:poc_flutter/src/pages/alert_page.dart';
import 'package:poc_flutter/src/providers/menu_provider.dart';
import 'package:poc_flutter/src/util/icon_str.dart';

class HomePage extends StatelessWidget {
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
  Widget _lista() {
    //menuProvider.cargarDatosMenu().then((listadoMenu) {
    return FutureBuilder(
      future: menuProvider.cargarDatosMenu(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(children: _listadoMenu(snapshot.data, context));
      },
    );
  }

  List<Widget> _listadoMenu(List<dynamic> listado, BuildContext context) {
    return listado
        .map((item) => Column(
              children: <Widget>[
                ListTile(
                  title: Text(item['texto']),
                  subtitle: Text('Subtitulo'),
                  leading:
                      getIcon(item['icon']), //leading es un elemento al inicio
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    final ruta = MaterialPageRoute(
                        builder: (context) => EjemploAlerta());
                    Navigator.push(context, ruta);
                  },
                ),
                Divider()
              ],
            ))
        .toList();
  }
}
