import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

class UserModel{
  int ID;
  String USER_NAME;
  String EMAIL;
  String IMAGE_URL;
  String ADDRESS;

  UserModel({
    @required this.ID,
    @required this.USER_NAME,
    @required this.EMAIL,
    @required this.IMAGE_URL,
    @required this.ADDRESS
  });

  factory UserModel.fromMap(UserModel user){
    return UserModel(
      ID: user.ID ?? '',
      USER_NAME: user.USER_NAME ?? '',
      EMAIL: user.EMAIL ?? '',
      IMAGE_URL: user.IMAGE_URL ?? '',
      ADDRESS: user.ADDRESS ?? ''
    );
  }

  UserModel.fromJson(Map<String, dynamic> json){
    ID = json['title'];
    USER_NAME = json['USER_NAME'];
    EMAIL = json['EMAIL'];
    IMAGE_URL = json['IMAGE_URL'];
    ADDRESS = json['ADDRESS'];
  }
  // factory UserModel.fromJson(Map<String, dynamic> json){
  //   return UserModel(
  //     ID: json['key']['ID'],
  //     USER_NAME: json['USER_NAME'],
  //     EMAIL: json['EMAIL'],
  //     IMAGE_URL: json['IMAGE_URL'],
  //     ADDRESS: json['ADDRESS']
  //   );
  // }

  factory UserModel.initUser(){
    return UserModel(
      ID: 0,
      USER_NAME: '',
      EMAIL: '',
      IMAGE_URL: '',
      ADDRESS: ''
    );
  }
}

class UserList{
  final List<UserModel> userList;
  UserList({@required this.userList});

  UserList.fromJson(List<dynamic> usersJson) :
    userList = usersJson.map((user) => UserModel.fromJson(user)).toList();
}
