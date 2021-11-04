import 'package:shared_preferences/shared_preferences.dart';

Future setToken(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("token", value);
}

Future getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("token");
}

Future rmvToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("token");
}

Future setName(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("Name", value);
}

Future getName() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("Name");
}

Future rmvName() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("Name");
}
