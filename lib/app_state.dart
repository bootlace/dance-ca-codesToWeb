import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _memberid = await secureStorage.getString('ff_memberid') ?? _memberid;
    _circletoken =
        await secureStorage.getString('ff_circletoken') ?? _circletoken;
    _firstname = await secureStorage.getString('ff_firstname') ?? _firstname;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _memberid = '';
  String get memberid => _memberid;
  set memberid(String _value) {
    _memberid = _value;
    secureStorage.setString('ff_memberid', _value);
  }

  void deleteMemberid() {
    secureStorage.delete(key: 'ff_memberid');
  }

  String _circletoken = '';
  String get circletoken => _circletoken;
  set circletoken(String _value) {
    _circletoken = _value;
    secureStorage.setString('ff_circletoken', _value);
  }

  void deleteCircletoken() {
    secureStorage.delete(key: 'ff_circletoken');
  }

  String _firstname = '';
  String get firstname => _firstname;
  set firstname(String _value) {
    _firstname = _value;
    secureStorage.setString('ff_firstname', _value);
  }

  void deleteFirstname() {
    secureStorage.delete(key: 'ff_firstname');
  }

  String _currentCode = '';
  String get currentCode => _currentCode;
  set currentCode(String _value) {
    _currentCode = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
