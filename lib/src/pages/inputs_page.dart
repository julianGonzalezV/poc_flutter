import 'package:flutter/material.dart';

class EjemploInputs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EjemploInputsState();
}

class EjemploInputsState extends State<EjemploInputs> {
  String _nombre = '';
  String _email = '';
  String _password = '';

  Widget _crearInput() {
    return TextField(
      //autofocus: true, para que aparezca el teclado de una
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          counter: Text('Cantidad de letras ${_nombre.length}'),
          hintText: 'nombre',
          labelText: 'Nombre',
          helperText: 'Ingrese su nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  Widget _crearEmailInput() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          hintText: 'Email',
          labelText: 'Email',
          helperText: 'Ingrese su email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _crearPasswordInput() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          hintText: 'Password',
          labelText: 'Password',
          helperText: 'Ingrese su password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _crearCliente() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 18.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmailInput(),
          Divider(),
          _crearPasswordInput(),
          Divider(),
          _crearCliente(),
          Divider(),
        ],
      ),
    );
  }
}
