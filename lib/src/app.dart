import 'package:flutter/material.dart';
import 'package:poc_flutter/src/pages/alert_page.dart';
import 'package:poc_flutter/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:poc_flutter/src/share_prefs/user_preference.dart';

class PruebaConcepto extends StatelessWidget {
  final prefs = new UserPreference();
  @override
  Widget build(BuildContext context) {
    // para borrar la etiqueta de DEBUG en la parte superior derecha
    // use debugShowCheckedModeBanner:false
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', 'ES'),
        const Locale.fromSubtags(
            languageCode: 'zh'), // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
      initialRoute: prefs.lastPage,
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
