import 'package:flutter/material.dart';
import 'package:poc_flutter/src/providers/menu_provider.dart';
import 'package:poc_flutter/src/util/icon_str.dart';
import 'package:poc_flutter/src/widgets/menu_widget.dart';

/// Se hace uso de la librería share_prefereces
///
class UserPreferencePage extends StatelessWidget {
  final TextStyle estiloTexto = new TextStyle(fontSize: 30);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        centerTitle: true,
      ),
      drawer: MenuWidget(_lista()),
      body: _lista(),
    );
  }

  Widget _lista() {
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
                    Navigator.pushNamed(context, item['ruta']);
                  },
                ),
                Divider()
              ],
            ))
        .toList();
  }
}
