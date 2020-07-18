import 'package:flutter/material.dart';
import 'package:poc_flutter/src/pages/alert_page.dart';
import 'package:poc_flutter/src/routes/routes.dart';

class PruebaConcepto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // para borrar la etiqueta de DEBUG en la parte superior derecha
    // use debugShowCheckedModeBanner:false
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: appRoutes(),

      /// cuando las rutas d arriba no se encuentra una nueva entonces podemos
      /// tener el onGenerateRoute, que direcciona a la que le digamos por defecto
      /// que tal que sea un mensaje de "pagina en construcción?""
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => EjemploAlerta());
      },
    );
  }
}
