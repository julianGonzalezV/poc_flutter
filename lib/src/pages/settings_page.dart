import 'package:flutter/material.dart';
import 'package:poc_flutter/src/providers/menu_provider.dart';
import 'package:poc_flutter/src/util/icon_str.dart';
import 'package:poc_flutter/src/widgets/menu_widget.dart';

class SettingsPage extends StatelessWidget {
  final TextStyle estiloTexto = new TextStyle(fontSize: 30);
  @override
  Widget build(BuildContext context) {
    // Flutter io : Saffold is an elemente that full
    // all the cel display and allows adding an appBar(header)
    // and bottomBar(footer)
    // and drawers(lateral Menu)
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        centerTitle: true,
      ),
      drawer: MenuWidget(_lista()),
      body: _settingsBody(),
    );
  }

  Widget _settingsBody() {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Settings',
            style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        SwitchListTile(
            value: true, title: Text('Color'), onChanged: (boolValue) {}),
        RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: 1,
            onChanged: (intValue) {}),
        RadioListTile(
            value: 1,
            title: Text('Femenino'),
            groupValue: 1,
            onChanged: (intValue) {}),
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 35.0),
          child: TextField(
            decoration: InputDecoration(
                labelText: 'Nombre', helperText: 'agrega tu nombre'),
            onChanged: (valueStr) {},
          ),
        )
      ],
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
                    Navigator.pushNamed(context, item['ruta']);
                  },
                ),
                Divider()
              ],
            ))
        .toList();
  }
}
