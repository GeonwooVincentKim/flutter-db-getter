import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_db_test/data/model/model_users.dart';
import 'package:flutter_db_test/data/provider/provider_users.dart';
import 'package:flutter_db_test/shared/style/divider.dart';
import 'package:flutter_db_test/widget/list_tile_users.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class UserPage extends StatefulWidget {
  final int pageIndex;
  final String title;
  final Function pageInfo;

  UserPage({
    @required this.pageIndex,
    @required this.title,
    @required this.pageInfo
  });

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // List<UserModel> userList = [];
  // List<UserModel> usersData = [];

  // Widget initState() { super.initState(); }
  Future fetch() async{ 
    // var res = await http.get("http://192.168.88.204:3010/api/users");
    var res = await http.get(
      "http://192.168.219.105:3010/api/users"
    );
    return json.decode(res.body);
  }
  // List<UserModel> usersData = [];
  // List usersData;
  List usersData;
  Map<String, dynamic> data;
  UserModel userTest;

  getUsers() async {
    // http5.Response response = await http.get("http://localhost:3010/api/users");
    http.Response response = await http.get("http://192.168.219.104:3010/api/users");
    debugPrint(response.body);
    // data = json.decode(response.body);
     data = json.decode(response.body);
    
    // userTest = UserModel.fromJson(json.decode(response.body));
    // UserModel.fromJson(json.decode(response.body));
    setState(() {
      // usersData = data['key'];
      // usersData = data['key'];
      usersData = data['key'];
    });
  }

  getUsersByID() async {
    http.Response response = await http.get("http://192.168.219.105:3010/api/users/:id");
    debugPrint(response.body);
    data = json.decode(response.body);
    setState(() {
      usersData = data['key'];
    });
  }

  @override
  initState(){
    super.initState();
    getUsers();
    // getUsersByID();
  }
  // Future<List<UserModel>> _fetchUsers() async {
  //   final userListAPIurl = 'http://192.168.88.204:3010/users';
  //   final response = await http.get(userListAPIurl);

  //   if(response.statusCode == 200){
  //     List jsonResponse = json.decode(response.body);
  //     return jsonResponse.map((user) => new UserModel.fromJson(user)).toList();
  //   } else {
  //     throw Exception("Failed to load users from API");
  //   }
  // }

  // ListView _usersListView(data){
  //   return ListView.builder(
  //     itemCount: data.length,
  //     itemBuilder: (context, index) => ListTileUsers(users: userList[index])   
      
  //   );
  // }

  Widget _buildUserPageAppBar(){
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      backgroundColor: Color(0xfffbc02d)
    );
  }

  Widget _buildUserPageBody(){
    return Container(
      child: GestureDetector(
        onTap: (){
          // Provider.of<ProviderUsers>(context, listen: false).selectMenu(userData[index);
          Navigator.pushNamed(context, "/users/${usersData.first}");
        },
        child: ListView.builder(
          itemCount: usersData == null ? 0 : usersData.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              child: Column(
                children: <Widget>[
                  Text("${usersData[index]["ID"]}")
                  // Text("${usersData[index]}"),
                  // Text("${usersData[index]["ID"]}"),
                  // Text("${usersData[index]["USER_NAME"]}"),
                  // Text("${usersData[index]["EMAIL"]}"),
                  // Text("${usersData[index]["IMAGE_URL"]}")
                ]
              )
            );
          }
          // itemBuilder: (context, index) => ListTileUsers(users: usersData[index])
        )
      ),

      // child: FutureBuilder(
      //   future: this.fetch(),
      //   builder: (BuildContext context, snap){
      //     if(!snap.hasData) return CircularProgressIndicator();
      //     return Text(snap.data['key'].toString());
      //   }
      // )
      
    );
    // return Container(
    //   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20 / 2),
    //   margin: EdgeInsets.all(10),
    //   child: _usersListView()
    // );
    // return Center(
    //   child: FutureBuilder<List<UserModel>>(
    //     future: _fetchUsers(),
    //     builder: (context, snapshot){
    //       if(snapshot.hasData){
    //         List<UserModel> userData = snapshot.data;
    //         return ListView.builder(
    //           itemCount: userData.length,
    //           itemBuilder: (context, index) => ListTileUsers(users: userList[index])   
              
    //         );
    //         // return _usersListView(userData);
    //       } else if(snapshot.hasError){
    //         return Text("${snapshot.error}");
    //       }
    //       return CircularProgressIndicator();
    //     }
        // future: this.fetch(),
        // builder: (context, snap){
        //   if(!snap.hasData) return CircularProgressIndicator();
        //   return Text(snap.data.toString());
        // }
    //   )
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildUserPageAppBar(),
      body: _buildUserPageBody(),
    );
  }
}