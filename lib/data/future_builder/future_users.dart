import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_db_test/data/model/model_users.dart';


Future<List<UserModel>> fetchUsers(context) async {
  final response = 
    await http.get('http://192.168.88.204:3010/api/users');
  return json.decode(response.body);
}

List<UserModel> parseUsers(String resBody){
  final parsed = jsonDecode(resBody).cast<Map<String, dynamic>>();
  return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
}

class FutureUser{
  Future<List<UserModel>> fetchUsers(context) async {
    // final Map<String, dynamic> response = await http.get("http");
  }
}