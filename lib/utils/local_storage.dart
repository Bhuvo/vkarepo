import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/patient.dart';
import 'package:timesmedlite/model/user.dart';

class LocalStorage {

  static const String patientSearchDoctorId = "patientSearchDoctorId";
  static const String isFromPatient = "isFromPatient";

  static const String TOKEN = "TOKEN";
  static const String USER = "USER";
  static const String IsType = "IsType";
  static const String ONLINE = "ONLINE";
  static const String CURSOR_USER = "CURSOR_USER";

  static SharedPreferences? _prefs;
  static final Map<String, dynamic> _memoryPrefs = <String, dynamic>{};

  static Future<SharedPreferences?> load() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs;
  }

  static void setJson(String key, Map<String, dynamic> map) {
    final str = jsonEncode(map);
    _prefs?.setString(key, str);
  }

  static User getUser(){
    //return Consts.DUMMY_USER.copyWith(id: 38371);
    return User.fromJson(getJson(USER));
  }

  static int getPatientSearchDoctorId(){
    return _prefs?.getInt(patientSearchDoctorId) ?? 178936;
  }

  static bool getIsFromPatient(){
    return _prefs?.getBool(isFromPatient) ?? true;
  }

  static dynamic getUID(){
    //return Consts.DUMMY_USER.copyWith(id: 38371);
    final user = User.fromJson(getJson(USER));
    print(getJson(USER));
    final id = '${user.id ??user.userId ?? user.patientid}';
    final id2 ='${user.userId ?? user.patientid}';
    return getString(IsType) == Consts.doctor ?id : id2;
  }
  static Patient getCursorPatient(){
    //return Consts.DUMMY_USER.copyWith(id: 38371);
    return Patient.fromJson(getJson(CURSOR_USER));
  }

  static void setString(String key, String value) {
    _prefs?.setString(key, value);
    _memoryPrefs[key] = value;
  }

  static void setInt(String key, int value) {
    _prefs?.setInt(key, value);
    _memoryPrefs[key] = value;
  }

  static void setDouble(String key, double value) {
    _prefs?.setDouble(key, value);
    _memoryPrefs[key] = value;
  }

  static void setBool(String key, bool value) {
    _prefs?.setBool(key, value);
    _memoryPrefs[key] = value;
  }

  static Map<String, dynamic> getJson(String key) {
    final str = _prefs?.getString(key) ?? '{}';
    return jsonDecode(str);
  }

  static String getString(String key, {String def = ''}) {
    return _prefs?.getString(key) ?? def;
  }

  static int getInt(String key, {int? def}) {
    int val = 0;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null) {
      val = _prefs!.getInt(key)!;
    }
    if (val == null) {
      val = def!;
    }
    _memoryPrefs[key] = val;
    return val;
  }

  static double getDouble(String key, {double? def}) {
    double val = 0.0;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null) {
      val = _prefs!.getDouble(key)!;
    }
    if (val == null) {
      val = def!;
    }
    _memoryPrefs[key] = val;
    return val;
  }

  static bool getBool(String key, {bool def = false}) {
    return _prefs?.getBool(key) ?? def;
  }

  static Future<void> clear() {
    _memoryPrefs.clear();
    return _prefs!.clear();
  }

}