import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  // Create a secure secure_storage instance
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Set string value in secure secure_storage
  Future<void> setString(String key, String value) async {
    debugPrint('setString $key : $value');
    await _storage.write(key: key, value: value);
  }

  /// Get string value from secure secure_storage
  Future<String?> getString(String key) async {
    debugPrint('getString $key');
    return await _storage.read(key: key);
  }

  /// Set int value in secure secure_storage (store as a string)
  Future<void> setInt(String key, int value) async {
    debugPrint('setInt $key');
    await _storage.write(key: key, value: value.toString());
  }

  /// Get int value from secure secure_storage
  Future<int?> getInt(String key) async {
    debugPrint('getInt $key');
    String? value = await _storage.read(key: key);
    return value != null ? int.tryParse(value) : null;
  }

  /// Set double value in secure secure_storage (store as a string)
  Future<void> setDouble(String key, double value) async {
    debugPrint('setDouble $key');
    await _storage.write(key: key, value: value.toString());
  }

  /// Get double value from secure secure_storage
  Future<double?> getDouble(String key) async {
    debugPrint('getDouble $key');
    String? value = await _storage.read(key: key);
    return value != null ? double.tryParse(value) : null;
  }

  /// Set bool value in secure secure_storage (store as a string)
  Future<void> setBool(String key, bool value) async {
    debugPrint('setBool $key');
    await _storage.write(key: key, value: value.toString());
  }

  /// Get bool value from secure secure_storage
  Future<bool?> getBool(String key) async {
    debugPrint('getBool $key');
    String? value = await _storage.read(key: key);
    return value != null ? value.toLowerCase() == 'true' : null;
  }

  /// Remove value from secure secure_storage
  Future<void> removeValue(String key) async {
    debugPrint('removeValue $key');
    await _storage.delete(key: key);
  }

  /// Check if a key exists in secure secure_storage
  Future<bool> isExist(String key) async {
    debugPrint('checkValue $key');
    return await _storage.containsKey(key: key);
  }

  /// Set a list of strings in secure secure_storage (store as a JSON string)
  Future<void> setStringList(String key, List<String> value) async {
    debugPrint('setStringList $key');
    await _storage.write(key: key, value: value.join(','));
  }

  /// Get a list of strings from secure secure_storage
  Future<List<String>?> getStringList(String key) async {
    debugPrint('getStringList $key');
    String? value = await _storage.read(key: key);
    return value?.split(',') ?? [];
  }

  /// Clear all data in secure secure_storage
  Future<void> clear() async {
    debugPrint('clearAllData');
    await _storage.deleteAll();
  }
}
