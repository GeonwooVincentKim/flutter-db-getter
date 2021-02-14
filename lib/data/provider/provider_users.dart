import 'package:flutter/material.dart';
import 'package:flutter_db_test/data/model/model_users.dart';

class ProviderUsers with ChangeNotifier{
  List<UserModel> _userList = [];
  UserModel _selectedUser;

  List<UserModel> get listUsers {
    return [..._userList];
  }

  // UserModel get selectedUser {
    // return _selectedUser != null ? UserModel.fromMap(_selectedUser) : null;
  // }
  List<UserModel> get selectedUser => [..._userList];
  List<UserModel> initUserList(Map<String, dynamic> userList){
    _userList.clear();
    userList.forEach((id, userData){
      userData['key'] = id;
      final UserModel user = UserModel.fromJson(userData);
      _userList.add(user);
    });
    notifyListeners();
    return _userList;
  }

  void selectMenu(UserModel user){
    _selectedUser = user;
    notifyListeners();
  }
}