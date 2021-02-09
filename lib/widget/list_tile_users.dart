import 'package:flutter/material.dart';
import 'package:flutter_db_test/data/model/model_users.dart';
import 'package:flutter_db_test/shared/style/text.dart';


class ListTileUsers extends StatelessWidget {
  final UserModel users;
  ListTileUsers({@required this.users});

  Widget _buildUsersInfo(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextDesign(
            basicText: users.USER_NAME,
            textStyle: TextStyle(fontSize: 9, color: Colors.black)
          ),
          // debugPrint("Test"),
          Divider(height: 5, color: Colors.transparent),
          TextDesign(
            basicText: users.EMAIL,
            textStyle: TextStyle(fontSize: 9, color: Colors.black)
          ),
          Divider(height: 5, color: Colors.transparent),
          TextDesign(
            basicText: users.IMAGE_URL,
            textStyle: TextStyle(fontSize: 9, color: Colors.black)
          ),
          Divider(height: 5, color: Colors.transparent),
          TextDesign(
            basicText: users.ADDRESS,
            textStyle: TextStyle(fontSize: 9, color: Colors.black)
          ),
          Divider(height: 5, color: Colors.transparent),
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: _buildUsersInfo(context),
      )
    );
  }
}