import 'package:flutter/material.dart';
import 'package:poc_flutter/src/share_prefs/user_preference.dart';

class UserPreferencePage extends StatelessWidget {
  final prefs = new UserPreference();
  final TextStyle estiloTexto = new TextStyle(fontSize: 30);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: prefs.color ? Colors.teal : Colors.blue,
        title: Text('Preferencias de usuario'),
        centerTitle: true,
      ),
      body: _cargarPreferencias(),
    );
  }

  Widget _cargarPreferencias() {
    return Column(
      children: <Widget>[
        Text('Color Sec'),
        Divider(),
        Text('${prefs.color}'),
        Divider(),
        Text('Gender'),
        Divider(),
        Text('${prefs.gender}'),
        Divider(),
        Text('Name'),
        Divider(),
        Text('${prefs.name}'),
        Divider(),
      ],
    );
  }
}
