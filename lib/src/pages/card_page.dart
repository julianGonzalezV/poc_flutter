import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  _tarjetaSencilla() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Titulo tarjeta'),
            subtitle:
                Text('qweqwejhasdasdhdfasadasahsdakjsdgh asgdya gsdas d auyd'),
            leading: Icon(
              Icons.photo_album,
              color: Colors.red,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () {}, child: Text('Cancelar')),
              FlatButton(onPressed: () {}, child: Text('Ok'))
            ],
          )
        ],
      ),
    );
  }

  /// tarjeta normal con imagen: Note que Flutter queda esperando para cargar
  /// e incluso se muestra primero el texto "Imagen.."
  _tarjetaConImagen() {
    final tarjeta = Container(
      child: Column(
        children: <Widget>[
          Image(
              image: NetworkImage(
                  'https://live.staticflickr.com/878/40291533535_8bbfa6657f_b.jpg')),
          Container(
            child: Text('Imagen...'),
            padding: EdgeInsets.all(10.0),
          )
        ],
      ),
    );

    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(2.0, 10.0))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: tarjeta,
        ));
  }

  /// A diferencia de _tarjetaConImagen() este muestra una imagen previa mientas carga
  /// Buena estrategia y suave ante la vista del usuario
  _tarjetaConFadeImagen() {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
              placeholder: AssetImage('assets/loader.gif'),
              fadeInDuration: Duration(milliseconds: 300),
              height: 250,
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://live.staticflickr.com/878/40291533535_8bbfa6657f_b.jpg'))
        ],
      ),
    );
  }

  ListView _getTarjetas() {
    return ListView(
      children: <Widget>[
        _tarjetaSencilla(),
        _tarjetaConImagen(),
        _tarjetaConFadeImagen(),
        _tarjetaConImagen(),
        _tarjetaConImagen(),
        _tarjetaConImagen(),
        _tarjetaConImagen(),
      ],
      padding: EdgeInsets.all(40.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo Tarjeta'),
      ),
      body: _getTarjetas(),
    );
  }
}
