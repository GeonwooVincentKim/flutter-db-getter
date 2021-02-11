import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_db_test/data/model/model_users.dart';
import 'package:http/http.dart' as http;

class ProviderUsers with ChangeNotifier{
  // List<UserModel> _userList = [];
  List<UserModel> _userList = [];
  UserModel _selectedUser;
  Map<String, dynamic> data;

  List<UserModel> get listUsers {
    return [..._userList];
  }
  // Future<void> getAllUser() async {
  //   http.Response res = await http.get("http://192.168.88.204:3010/api/users");
    
  //   // List usersData = await http.get("http://192.168.88.204:3010/api/users");
  // }

  Future<List<UserModel>> getAllUser(BuildContext conetxt) async {
    http.Response res = await http.get("http://192.168.88.204:3010/api/users");
    Map<String, dynamic> data = json.decode(res.body);
    _userList = data['key'];
    return _userList;
  }

  Future<UserModel> fetchUser(BuildContext context) async {
    http.Response res = await http.get("http://192.168.88.204:3010/api/users/:id");
    return UserModel.fromJson(jsonDecode(res.body));
    // data = UserModel.fromJson(jsonDecode(res.body));
  }
  // getUsers(BuildContext context) async{
  //   http.Response res = await http.get("http://192.168.88.204:3010/api/users");
  //   data = json.decode(res.body);
  // }

  // UserModel get selectedUser {
    // return _selectedUser != null ? UserModel.fromMap(_selectedUser) : null;
  // }
  // List<UserModel> get selectedUser => [..._userList];
  List<UserModel> userList(Map<String, dynamic> userData){
    // _userList.clear();
    userData.forEach((id, userData){
      userData['key'] = id;
      // userData = 
    });
  }
  // UserModel get jsonSelectedUser{
  //   return _selectedUser != null ? UserModel.fromJson(_sele)
  // }
}