import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/providers/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  void save(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  Future<dynamic> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) == null) return null;
    String ? key_shared=prefs.getString(key);
    return json.decode(key_shared ?? '');
  }
  //si existe algun dato en el prefernce shared
  Future<bool> contains(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  void logout(BuildContext context,String idUser) async {
    AuthProvider userProvider=new AuthProvider();
    userProvider.init();
    await remove('user');
    Navigator.pushNamedAndRemoveUntil(context, 'login', ((route) => false));
  }
}