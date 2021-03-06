import 'package:flutter/material.dart';
import 'package:poc_flutter/src/providers/menu_provider.dart';
import 'package:poc_flutter/src/share_prefs/user_preference.dart';
import 'package:poc_flutter/src/util/icon_str.dart';
import 'package:poc_flutter/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final prefs = new UserPreference();

  //Definiendo variables que hacen que sea stateFul (widget que va a cambiar una vez construido!)

  bool _colorS;
  int _gender;
  String _name;

  final TextStyle estiloTexto = new TextStyle(fontSize: 30);
// En este caso se usa para colocar valor por defecto pero tambien se usa para
// contener estado que es diferente al ciclo de vida del componente(en este cao inputField)
  TextEditingController _nameCtr = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _colorS = prefs.color;
    _gender = prefs.gender;
    _name = prefs.name;
    _nameCtr = new TextEditingController(text: _name);
  }

  _setGenderSelected(int value) async {
    prefs.gender = value;
    print('_setGenderSelected $value');
    _gender = value;
    setState(() {});
  }

  _setColorSelected(bool value) async {
    prefs.color = value;
    _colorS = value;
    setState(() {});
  }

  _setName(String value) async {
    prefs.name = value;
    _name = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: prefs.color ? Colors.teal : Colors.blue,
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
            'Ajustes',
            style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        SwitchListTile(
            value: _colorS, title: Text('Color'), onChanged: _setColorSelected),
        RadioListTile(
            value: 0,
            title: Text('Masculino'),
            groupValue: _gender,
            onChanged: _setGenderSelected),
        RadioListTile(
            value: 1,
            title: Text('Femenino'),
            groupValue: _gender,
            onChanged: _setGenderSelected),
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 35.0),
          child: TextField(
            controller: _nameCtr,
            decoration: InputDecoration(
              labelText: 'Nombre',
              helperText: 'agrega tu nombre',
            ),
            onChanged: _setName,
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
