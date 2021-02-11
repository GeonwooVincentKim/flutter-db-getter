// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// // class Job {
// //   final int id;
// //   final String position;
// //   final String company;
// //   final String description;

// //   Job({this.id, this.position, this.company, this.description});

// //   factory Job.fromJson(Map<String, dynamic> json) {
// //     return Job(
// //       id: json['id'],
// //       position: json['position'],
// //       company: json['company'],
// //       description: json['description'],
// //     );
// //   }
// // }
// class UserModel{
//   final int id;
//   final String user_name;
//   final String email;
//   final String image_url;
//   final String address;

//   UserModel({
//     @required this.id,
//     @required this.user_name,
//     @required this.email,
//     @required this.image_url,
//     @required this.address
//   });

//   factory UserModel.fromMap(UserModel user){
//     return UserModel(
//       id: user.id ?? '',
//       user_name: user.user_name ?? '',
//       email: user.email ?? '',
//       image_url: user.image_url ?? '',
//       address: user.address ?? ''
//     );
//   }

//   factory UserModel.fromJson(Map<String, dynamic> json){
//     return UserModel(
//       id: json['ID'],
//       user_name: json['USER_NAME'],
//       email: json['EMAIL'],
//       image_url: json['IMAGE_URL'],
//       address: json['ADDRESS']
//     );
//   }

//   factory UserModel.initUser(){
//     return UserModel(
//       id: 0,
//       user_name: '',
//       email: '',
//       image_url: '',
//       address: ''
//     );
//   }
// }


// class JobsListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<UserModel>>(
//       future: _fetchJobs(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           List<UserModel> data = snapshot.data;
//           return _jobsListView(data);
//         } else if (snapshot.hasError) {
//           return Text("${snapshot.error}");
//         }
//         return CircularProgressIndicator();
//       },
//     );
//   }

//   Future<List<UserModel>> _fetchJobs() async {

//     // final jobsListAPIUrl = 'https://mock-json-service.glitch.me/';
//     final jobListAPIUrl = "https://192.168.88.204:3010/users";
//     final response = await http.get(jobListAPIUrl);

//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((job) => new UserModel.fromJson(job)).toList();
//     } else {
//       throw Exception('Failed to load jobs from API');
//     }
//   }

//   ListView _jobsListView(data) {
//     return ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (context, index) {
//           return _tile(data[index].position, data[index].company, Icons.work);
//         });
//   }

//   ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
//         title: Text(title,
//             style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 20,
//             )),
//         subtitle: Text(subtitle),
//         leading: Icon(
//           icon,
//           color: Colors.blue[500],
//         ),
//       );
// }

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_db_test/data/model/model_users.dart';
import 'package:http/http.dart';
class Job {
  @required
  String company;
  String description;
  String employmentType;
  int id;
  String location;
  String position;
  List<String> skillsRequired;


  Job(
      this.company,
      this.description,
      this.employmentType,
      this.id,
      this.location,
      this.position,
      this.skillsRequired);

  Job.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    description = json['description'];
    employmentType = json['employmentType'];
    id = json['id'];
    location = json['location'];
    position = json['position'];
    if (json['skillsRequired'] != null) {
      skillsRequired = new List<String>();
      json['skillsRequired'].forEach((v) {
        skillsRequired.add(v);
      });
    }
  }
}

class JobListView extends StatefulWidget {
  @override
  _JobListViewState createState() => _JobListViewState();
}

class _JobListViewState extends State<JobListView> {
  // List<Job> data =  List<Job>();
  List<UserModel> data = List<UserModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<UserModel>>(
        // future: _getJob(),
        future: _getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            data  = snapshot.data;
            // return _listViewFormat(data);
            return _listViewFormatUser(data);
          } else if (snapshot.hasError) {
            return Container();
          }
          return Center(
            child: Container(
              width: 50,
              height: 50,

              child: CircularProgressIndicator(),
            ),
          );
        },
      ),

      floatingActionButton: (FloatingActionButton(child: Icon(Icons.add),onPressed: (){
        setState(() {
          // var j =  Job("CompanyX","Eng.5 position","Full-time",0,"Cairo","Senior",null);
          var j = UserModel(ID: 1, USER_NAME: "VINCENT", EMAIL: "test@example.com", IMAGE_URL: "HAHAHa",ADDRESS: "YourAddress");
          data.add(j);
        });
      },)),
    );
  }
}

ListView _listViewFormat(List<Job> data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _tile(data[index].position, data[index].description, Icons.work);
      });
}

ListView _listViewFormatUser(List<UserModel> data){
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index){
      // return Card(
      //   child: Column(
      //     children: <Widget>[
      //       Text("${data[index]}")
      //     ],
      //   )
      // );
      return _tileUser(data[index].USER_NAME, data[index].EMAIL, Icons.work);
    }
  );
}

ListTile _tile(String title, String subtitle, IconData iconData) {
  return ListTile(
    title: Text(title, style: TextStyle(fontSize: 20)),
    subtitle: Text(
      subtitle,
      style: TextStyle(fontSize: 12),
    ),
    leading: Icon(iconData),
    trailing: Icon(Icons.arrow_right),
  );
}

ListTile _tileUsers(String title, String subtitle, IconData iconData) {
  return ListTile(
    title: Text(title, style: TextStyle(fontSize: 20)),
    subtitle: Text(
      subtitle,
      style: TextStyle(fontSize: 12),
    ),
    leading: Icon(iconData),
    trailing: Icon(Icons.arrow_right),
  );
}

Future<List<Job>> _getJob() async {
  String baseUrl = 'https://mock-json-service.glitch.me';
  var response = await get(baseUrl);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => new Job.fromJson(job)).toList();
  }
}

Future<List<UserModel>> _getUsers() async{
  String baseUrl = 'http://localhost:3010/api/users';
  var response = await get(baseUrl);
  if(response.statusCode == 200){
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => new UserModel.fromJson(user)).toList();
  }
}

ListTile _tileUser(String title, String subtitle, IconData iconData) {
  return ListTile(
    title: Text(title, style: TextStyle(fontSize: 20)),
    subtitle: Text(
      subtitle,
      style: TextStyle(fontSize: 12),
    ),
    leading: Icon(iconData),
    trailing: Icon(Icons.arrow_right),
  );
}