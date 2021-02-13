import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';
// import 'package:flutter_db_test/data/model/model_users.dart';


class UserProvider with ChangeNotifier{
  final String _dataPath = "http://127.0.0.1:3010/api/users";
  List<UserModel> users = [];
  List<UserModel> get get_users => users; 
  // Future<List<UserModel>> getList() async{
  //   List _result = await http.get("http://192.168.219.105:3010/api/users");
  //   _result.forEach((_item){
  //     addToList()
  //   });
  // }

  // Future<List<UserModel>> fetchUsers() async {
  //   final response =
  //     await http.get(_dataPath);
  //   return json.decode(response.body);
  // }

  // Future fetch() async {
  //   var res = await http.get("http://192.168.219.105:3010/api/users");
  //   return json.decode(res.body);
  // }

  // getUsers() async {
  //   http.Response response = await http.get("http://192.168.219.105:3010/api/users");
  //   Map<String, dynamic> data = json.decode(response.body);

  // }

  // // List<UserModel> loadAsset(String responseBody){
  // //   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  // //   return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  // // }
  Future<List<UserModel>> loadUserData() async {
    var dataString = await loadAsset();
    Map<String, dynamic> jsonUserData = jsonDecode(dataString);
    // jsonUserData.map<UserModel>((json) => UserModel.fromJson(json)).toList();
    users = UserList.fromJson(jsonUserData['key']).userList;
    print("Done loading User!!!" + jsonEncode(users));
    return users;
  }

  Future<String> loadAsset() async {
    return await Future.delayed(Duration(seconds: 10), () async {
      return await rootBundle.loadString(_dataPath);
    });
  }

  Future<List<UserModel>> fetchPhotos(http.Client client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/photos');

    // Use the compute function to run parsePhotos in a separate isolate.
    return compute(parsePhotos, response.body);
  }

  // A function that converts a response body into a List<Photo>.
  List<UserModel> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  }

  // Future<List<UserModel>> fetchUserList() async {
  //   final response = 
  //     await http.get("http://192.168.219.105:3010/api/users");
  //   return compute(parseUsers, response.body);
  // }

  // List<UserModel> parseUsers(String responseBody){
  //   final parsedUser = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  //   return parsedUser.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  // }
}