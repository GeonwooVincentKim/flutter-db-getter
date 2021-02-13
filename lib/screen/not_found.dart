import 'package:flutter/material.dart';


class NotFound extends StatelessWidget {
  Widget _buildNotFoundAppBar(){
    return AppBar(
      title: Text("404 Not Found"),
      centerTitle: true,
      actions: [
        
      ]
    );
  }

  Widget _buildNotFoundBody(){
    return Container();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildNotFoundAppBar(),
      body: _buildNotFoundBody(),
    );
  }
}