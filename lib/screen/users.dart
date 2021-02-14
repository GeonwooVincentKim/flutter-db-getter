import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_db_test/data/provider/provider_users.dart';
// import 'package:provider/provider.dart';
import 'package:userTest/model/user.dart';
import '../design/user_design.dart';
import '../provider/user_provider.dart';
import 'package:http/http.dart' as http;


class MyUser extends StatefulWidget {
  final int pageIndex;
  final String title;
  final Function pageInfo;

  MyUser({
    @required this.pageIndex,
    @required this.title,
    @required this.pageInfo
  });

  @override
  _MyUserState createState() => _MyUserState();
}

class _MyUserState extends State<MyUser> {
  // var futureProvider = List<UserModel> users;
  // Future<List<UserModel>> fetchPhotos() async {
  //   final response =
  //       await http.get('http://192.168.219.104:3010/api/users');
  //   debugPrint(response.body);
  //   // Use the compute function to run parsePhotos in a separate isolate.
  //   // return compute(parsePhotos, response.body);
  //   return json.decode(response.body);
  // }
  
  List<UserModel> _users = List<UserModel>();
  Future<List<UserModel>> fetchUserTest() async{
    var url = "http://192.168.219.104:3011/api/users";
    var response = await http.get(url);

    var users = List<UserModel>();

    if(response.statusCode == 200){
      var usersInfo = json.decode(response.body) as List;
      // debugPrint(usersInfo);
      for(var userInfo in usersInfo){
        users.add(UserModel.fromJson(userInfo));
      }
    }
    return users;
  }

  @override
  void initState(){
    fetchUserTest().then((value){
      setState((){
        _users.addAll(value);
      });
    });
    super.initState();
    // fetchUserTest();
  }

  

  // Future<List<UserModel>> fetchLists() async {
  //   final response = await http.get("http://192.168.219.104:3010/api/users");
  //   Map<String, dynamic> data = json.decode(response.body);
  //   List usersData = data["key"];
  //   return usersData.map((user) => UserModel.fromJson(user));
  // }

  // A function that converts a response body into a List<Photo>.
  // List<UserModel> parsePhotos(String responseBody) {
  //   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  //   return parsed.map<UserModel>((json) => UserModel.fromJson(json['key'])).toList();
  // }

 Widget _buildUserAppBar(){
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      actions: [

      ],
    );
  }

  Widget _buildUserBody(BuildContext context){
    // var futureProvider = Provider.of<List<UserModel>>(context);
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index){
          return Card(
            child: Column(
              children: [
                // Text("HI")
                Text(_users[index].USER_NAME),
                // Text(_users[index].USER_NAME),
                Text(_users[index].EMAIL),
                Text(_users[index].IMAGE_URL),
                Text(_users[index].ADDRESS)
              ],
            )
          );
        },
        itemCount: _users.length,
      )
    );
    // var _users = Provider.of<List<UserModel>>(context);
    // return Container(
    //   child: FutureBuilder<List<UserModel>>(
    //     // future: fetchLists(),
    //     future: fetchPhotos(),
    //     builder: (context, snapshot){
    //       if(snapshot.hasError) print(snapshot.error);
    //       return snapshot.hasData ?
    //         // Text(snapshot.data['key'].toString()):
    //         SnapShotListTileUser(users: snapshot.data) :
    //         Center(child: CircularProgressIndicator()); 
    //       // Consumer<UserProvider>(
    //       //   builder: (ctx, userList, child){
    //       //     final List<UserModel> users = userList.get_users.indexOf();
    //       //   }
    //       // );
          
    //     }
    //   ),
    // );
    // return Container(
    //   child: Consumer<UserProvider>(
    //     builder: (context, users, _){
    //       List<UserModel> userList = users.users.toList();
    //       return userList.length == 0 ?
    //         Center(child: Text("No Results found")) :
    //         GridView.builder(
    //           shrinkWrap: true,
    //           itemCount: userList.length,
    //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 2,
    //             childAspectRatio: 0.75,
    //             crossAxisSpacing: 30.0,
    //             mainAxisSpacing: 30.0
    //           ),
    //           itemBuilder: (context, index) => ListTileUsers(users: userList),
    //         );
    //     }
    //   )
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildUserAppBar(),
      body: _buildUserBody(context),
    );
  }
}

class SnapShotListTileUser extends StatelessWidget{
  final List<UserModel> users;
  SnapShotListTileUser({@required this.users});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemCount: users.length,
      itemBuilder: (context, index){
        return Text("${users[index].ID}");
      },
    );
  }

}