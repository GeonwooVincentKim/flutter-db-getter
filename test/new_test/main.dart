import 'package:flutter/material.dart';

//Custom widgets
import 'user_list.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Portal',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Job Portal'),
        ),
        body: Center(
          child: JobsListView()
        ),
      ),
    );
  }
}