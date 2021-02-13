import 'package:flutter/material.dart';
import '../model/user.dart';


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