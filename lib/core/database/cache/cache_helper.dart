import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelperService extends GetxService {
  static late SharedPreferences sharedPreferences;

  //! Here the initialize of cache:
  Future<CacheHelperService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  //! this method to retrieve string data from local database using key:
  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  //! this method to save data in local database using key:
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }
    if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      return await sharedPreferences.setString(key, value);
    }
  }

  //! this method to get data already saved in local database using key:
  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //! remove data using specified key:
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //! this method to chech if local database containss the specified key:
  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  //! clear all data from local database:
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }
}
