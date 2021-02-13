import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class Job {
//   final int id;
//   final String position;
//   final String company;
//   final String description;

//   Job({this.id, this.position, this.company, this.description});

//   factory Job.fromJson(Map<String, dynamic> json) {
//     return Job(
//       id: json['id'],
//       position: json['position'],
//       company: json['company'],
//       description: json['description'],
//     );
//   }
// }
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


class JobsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserModel>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<UserModel> data = snapshot.data;
          return _jobsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<UserModel>> _fetchJobs() async {

    // final jobsListAPIUrl = 'https://mock-json-service.glitch.me/';
    final jobListAPIUrl = "https://192.168.88.204:3010/users";
    final response = await http.get(jobListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new UserModel.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].position, data[index].company, Icons.work);
        });
  }

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
      );
}