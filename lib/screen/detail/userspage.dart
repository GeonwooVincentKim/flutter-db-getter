import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_db_test/data/model/model_users.dart';
import 'package:flutter_db_test/data/provider/provider_users.dart';
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
  List<UserModel> userList = [];
  // Widget initState() { super.initState(); }
  // Future fetch() async{
  //   var res = await http.get("http://192.168.88.204:3010/users");
  //   return json.decode(res.body);
  // }
  Future<List<UserModel>> _fetchUsers() async {
    final userListAPIurl = 'http://192.168.88.204:3010/users';
    final response = await http.get(userListAPIurl);

    if(response.statusCode == 200){
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => new UserModel.fromJson(user)).toList();
    } else {
      throw Exception("Failed to load users from API");
    }
  }

  ListView _usersListView(data){
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => ListTileUsers(users: listUsers[index])     
    );
  }

  Widget _buildUserPageAppBar(){
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      backgroundColor: Color(0xfffbc02d)
    );
  }

  Widget _buildUserPageBody(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20 / 2),
      margin: EdgeInsets.all(10),
      child: Consumer<ProviderUsers>(
        builder: (ctx, category, child){
          
        }
      )
    );
    // return Center(
    //   child: FutureBuilder(
        // future: this.fetch(),
    //     builder: (context, snap){
    //       if(!snap.hasData) return CircularProgressIndicator();
    //       return Text(snap.data.toString());
    //     }
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