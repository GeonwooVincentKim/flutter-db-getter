import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  final int pageIndex;
  final String title;
  final Function pageInfo;

  HomePage({
    @required this.pageIndex,
    @required this.title,
    @required this.pageInfo
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Widget initState() { super.initState(); }
  
  Widget _buildHomePageAppBar(){
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      backgroundColor: Color(0xfffbc02d)
    );
  }

  Widget _buildHomePageBody(){
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHomePageAppBar(),
      body: _buildHomePageBody(),
    );
  }
}