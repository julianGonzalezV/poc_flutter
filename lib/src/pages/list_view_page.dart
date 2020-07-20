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

  @override
  void initState() {
    super.initState();
    print('initSate => $_ultimo');
    _agregarItems(10);

    _scrollCtr.addListener(() {
      if (_scrollCtr.position.pixels == _scrollCtr.position.maxScrollExtent) {
        _agregarItems(10);
      }
    });
  }

  void _agregarItems(int cantidad) {
    for (var i = 0; i < cantidad; i++) {
      _ultimo++;
      print('agregando => $_ultimo');
      _listaNumeros.add(_ultimo);
    }
    setState(() {});
  }

  Widget _listaWidget(BuildContext context) {
    return ListView.builder(
      controller: _scrollCtr,
      itemCount: _listaNumeros.length,
      itemBuilder: (context, index) {
        final imagen = _listaNumeros[index];
        return FadeInImage(
          placeholder: AssetImage('assets/loader.gif'),
          image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
        centerTitle: true,
      ),
      body: _listaWidget(context),
    );
  }
}
