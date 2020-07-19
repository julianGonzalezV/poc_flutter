import 'package:flutter/material.dart';

class EjemploInputs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EjemploInputsState();
}

class EjemploInputsState extends State<EjemploInputs> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  TextEditingController _inputFechaCtr = new TextEditingController();

  Widget _input() {
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

  Widget _emailInput() {
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

  Widget _passwordInput() {
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

  Widget _fechaInput(BuildContext context) {
    return TextField(
      controller: _inputFechaCtr,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          hintText: 'Fecha',
          labelText: 'Fecha',
          helperText: 'Seleccione una fecha',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_view_day)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusScopeNode());
        _seleccionFecha(context);
      },
    );
  }

  Widget _crearCliente() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
    );
  }

  _seleccionFecha(BuildContext context) async {
    DateTime seleccion = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'),
    );
    if (seleccion != null) {
      setState(() {
        _fecha = seleccion.toString();
        _inputFechaCtr.text = _fecha;
      });
    }
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
          _input(),
          Divider(),
          _emailInput(),
          Divider(),
          _passwordInput(),
          Divider(),
          _fechaInput(context),
          Divider(),
          _crearCliente(),
          Divider(),
        ],
      ),
    );
  }
}
