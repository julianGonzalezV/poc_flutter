import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContadorPageState();
}

/*
* Por standar Flutter recomienda que se coloque State al final
* Datos que la clase en la línea 3 es de tipo StatefulWidget
* Entonces se debe tener una clase adicional que maneje el estado que se va
* a tener. Dado que es el listado de la clases StateFul entonces 
* es buena practica tenerla privada, para que no se pueda usar por fuera de esta
* clase 'Se logra con _ antes del nombre de la clase'
* State<ContadorPage>: Indica que el tipo de estado a manejar, en este caso 
* ContadorPage
*/
class _ContadorPageState extends State<ContadorPage> {
  TextStyle _estiloTexto = new TextStyle(fontSize: 30);
  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    // Flutter io : Saffold is an elemente that full
    // all the celphone display and allows adding an appBar(header)
    // and bottomBar(footer)
    // and drawers(lateral Menu)
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador2'),
        centerTitle: true,
      ),
      body: Center(
        // Los widget solo pueden tener un hijo
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Dale clic',
              style: _estiloTexto,
            ),
            Text('$_conteo', style: _estiloTexto)
          ],
        ),
      ),
      floatingActionButton: _botones(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _botones() {
    return Row(children: [
      SizedBox(width: 30.0),
      FloatingActionButton(
          heroTag: toString(),
          child: Icon(Icons.settings_backup_restore),
          onPressed: _resetear),
      Expanded(child: Container(height: 100)),
      FloatingActionButton(
          heroTag: toString(), child: Icon(Icons.remove), onPressed: _restar),
      SizedBox(width: 7.0),
      FloatingActionButton(
          heroTag: toString(), child: Icon(Icons.add), onPressed: _agregar)
      //IMPORTANTE! note como no se llama _agregar() con parentesis, se pasa la referencia, especie de lazy
      // para que quede en la definicion pero no se ejecuta sino hasta que se
      // hace el evento Press
    ]);
  }

  void _agregar() {
    //_conteo++;
    // setState es para que se redibuje, solo si SE REQUIERE REFRECAR LA PANTALLA

    //setState(() => {}); al colocarlo solo igual refresca, pero sería buena
    // practica tener el estado que cambia dentro de la funcion tal como sigue
    setState(() {
      _conteo++; // se puede dejar arriba, tal como lo indican las líneas arriba
    });
  }

  void _restar() {
    setState(() => _conteo--);
  }

  void _resetear() {
    setState(() => _conteo = 0);
  }
}
