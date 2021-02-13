import 'package:flutter/material.dart';
import 'package:flutter_db_test/data/model/model_users.dart';

class ProviderUsers with ChangeNotifier{
  List<UserModel> userList = [];
  UserModel _selectedUser;

  List<UserModel> get listUsers {
    return [...userList];
  }

  // UserModel get selectedUser {
    // return _selectedUser != null ? UserModel.fromMap(_selectedUser) : null;
  // }
  List<UserModel> get selectedUser => [...userList];
  void selectMenu(UserModel user){
    _selectedUser = user;
    notifyListeners();
  }
}