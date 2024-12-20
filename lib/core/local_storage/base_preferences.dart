

import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class BasePreferences {

  /// String
  Future<bool> setStringApplicationSavedInformation(String storageKey, String name, String value) async{
    final prefs = await _prefs;

    return true;

  }
}