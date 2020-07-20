import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _listaNumeros = [1, 2, 3, 4, 5, 6];

  Widget _listaWidget(BuildContext context) {
    return ListView.builder(
      itemCount: _listaNumeros.length,
      itemBuilder: (context, index) {
        final imagen = _listaNumeros[index];
        return FadeInImage(
          placeholder: AssetImage('assets/loader.gif'),
          image: NetworkImage(
              'https://picsum.photos/seed/picsum/200/300/?image=$imagen'),
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
