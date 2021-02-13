import 'package:flutter/material.dart';


class DetailUser extends StatefulWidget{
  final String userID;
  DetailUser({@required this.userID});
  @override
  _DetailUserState createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  Widget _buildAppBar(){
    return AppBar(
      title: Text(widget.userID),
      centerTitle: true,
    );
  }

  Widget _buildBody(){
    return Container(
      child: Column(
        children: <Widget>[
          // Text()
          Text("Testing.."),
          Text("Testing..2"),
          Text("Testing..3")
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody()
    );
  }
}
