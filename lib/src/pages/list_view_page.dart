import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollCtr =
      new ScrollController(); //Controlador del scroll de la lista
  List<int> _listaNumeros = new List();
  int _ultimo = 0;
  bool _cargando = false;

  @override
  void initState() {
    super.initState();
    print('initSate => $_ultimo');
    _agregarItems(10);

    _scrollCtr.addListener(() {
      if (_scrollCtr.position.pixels == _scrollCtr.position.maxScrollExtent) {
        //_agregarItems(10);
        fectchImages();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future fectchImages() async {
    setState(() {
      _cargando = true;
    });
    new Timer(Duration(seconds: 5),
        respuestaHttp); //note como se llama a respuestaHttp sin () para no ejecutar la fución
  }

  void respuestaHttp() {
    _cargando = false;
    _agregarItems(10);
    _scrollCtr.animateTo(
      _scrollCtr.position.pixels + 100,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _agregarItems(int cantidad) {
    for (var i = 0; i < cantidad; i++) {
      _ultimo++;
      print('agregando => $_ultimo');
      _listaNumeros.add(_ultimo);
    }
    setState(() {});
  }

  Future _refrescarPagina() async {
    final Duration duration = new Duration(seconds: 3);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimo++;
      _agregarItems(10);
    });
    return Future.delayed(duration);
  }

  Widget _listaWidget(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refrescarPagina,
      child: ListView.builder(
        controller: _scrollCtr,
        itemCount: _listaNumeros.length,
        itemBuilder: (context, index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/loader.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
          );
        },
      ),
    );
  }

  Widget _loading() {
    if (_cargando) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else
      return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          _listaWidget(context),
          _loading(),
        ],
      ),
    );
  }
}
