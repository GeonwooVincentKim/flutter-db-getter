import 'package:flutter/material.dart';


class MyHome extends StatefulWidget {
  final int pageIndex;
  final String title;
  final Function pageInfo;

  MyHome({
    @required this.pageIndex,
    @required this.title,
    @required this.pageInfo
  });

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Widget _buildHomeAppBar(){
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      actions: [

      ],
    );
  }

  Widget _buildHomeBody(){
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHomeAppBar(),
      body: _buildHomeBody(),
    );
  }
}