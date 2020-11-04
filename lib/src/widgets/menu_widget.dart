import 'package:flutter/material.dart';
import 'package:poc_flutter/src/util/icon_str.dart';

class MenuWidget extends StatelessWidget {
  Widget lista;
  MenuWidget(this.lista);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _menuDrawer(),
    );
  }

  Widget _menuDrawer() {
    return Drawer(
      // child: ListView(children: _listadoMenu(snapshot.data, context)),
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        DrawerHeader(
          child: Container(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover)),
        ),
        Expanded(child: lista),
      ]),
    );
  }

  List<ListTile> _listadoMenu() {
    List<ListTile> lista = [];
    lista.add(ListTile(
      title: Text('unoe'),
      subtitle: Text('Subtitulo'),
      leading: getIcon('input'), //leading es un elemento al inicio
      trailing: Icon(Icons.keyboard_arrow_right),
    ));
    return lista;
  }
}
