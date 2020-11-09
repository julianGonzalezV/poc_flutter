import 'package:flutter/material.dart';
import 'package:poc_flutter/src/app.dart';
import 'package:poc_flutter/src/share_prefs/user_preference.dart';

void main() async {
  /// la idea de inicializar las preferencia acá (sgtes 3 líneas) es que ya
  /// las tenga listas en toda mi aplicación
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreference();
  await prefs.initPrefs();
  runApp(new PruebaConcepto());
}

// Todos los widget son clases
