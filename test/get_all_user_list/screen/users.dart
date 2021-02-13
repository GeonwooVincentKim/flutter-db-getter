import 'package:flutter/material.dart';
import 'package:flutter_db_test/data/model/model_users.dart';
import 'package:flutter_db_test/widget/list_tile_users.dart';
// import 'package:flutter_db_test/data/provider/provider_users.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';


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
 Widget _buildUserAppBar(){
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      actions: [

      ],
    );
  }

  Widget _buildUserBody(){
    // var _users = Provider.of<List<UserModel>>(context);
    return Container(
      
    );
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
      body: _buildUserBody(),
    );
  }
}