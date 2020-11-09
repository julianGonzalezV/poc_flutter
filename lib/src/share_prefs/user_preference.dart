import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  static final UserPreference _instance = new UserPreference._internal();

  bool _colorSec;
  int _gender;
  String _name;

  SharedPreferences prefs;

  factory UserPreference() {
    return _instance;
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  UserPreference._internal();

  get gender {
    return prefs.getInt('gender') ?? 1;
  }

  set gender(int value) {
    prefs.setInt('gender', value);
  }

  get color {
    return prefs.getBool('secColor') ?? false;
  }

  set color(bool value) {
    prefs.setBool('secColor', value);
  }

  get name {
    return prefs.getString('name') ?? 'default';
  }

  set name(String value) {
    prefs.setString('name', value);
  }

  get lastPage {
    return prefs.getString('lastPage') ?? '/';
  }

  set lastPage(String value) {
    prefs.setString('lastPage', value);
  }
}
