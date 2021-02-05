import 'package:flutter/material.dart';

class UserModel{
  final int id;
  final String user_name;
  final String email;
  final String image_url;
  final String address;

  UserModel({
    @required this.id,
    @required this.user_name,
    @required this.email,
    @required this.image_url,
    @required this.address
  });

  factory UserModel.fromMap(UserModel user){
    return UserModel(
      id: user.id ?? '',
      user_name: user.user_name ?? '',
      email: user.email ?? '',
      image_url: user.image_url ?? '',
      address: user.address ?? ''
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json['ID'],
      user_name: json['USER_NAME'],
      email: json['EMAIL'],
      image_url: json['IMAGE_URL'],
      address: json['ADDRESS']
    );
  }

  factory UserModel.initUser(){
    return UserModel(
      id: 0,
      user_name: '',
      email: '',
      image_url: '',
      address: ''
    );
  }
}