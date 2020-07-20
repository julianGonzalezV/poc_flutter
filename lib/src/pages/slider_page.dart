import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _check = false;

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño',
      value: _valorSlider,
      min: 10.0,
      max: 300.0,
      onChanged: (_check)
          ? null
          : (value) {
              setState(() {
                _valorSlider = value;
                print(_valorSlider);
              });
            },
    );
  }

  Widget _crearCheck() {
    /*return Checkbox(
      value: _check,
      onChanged: (value) {
        setState(() {
          _check = value;
        });        
      },
    );*/
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _check,
      onChanged: (value) {
        setState(() {
          _check = value;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _check,
      onChanged: (value) {
        setState(() {
          _check = value;
        });
      },
    );
  }

  _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://static.myfigurecollection.net/pics/figure/big/935381.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheck(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }
}
