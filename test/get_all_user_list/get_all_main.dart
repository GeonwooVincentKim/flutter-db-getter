import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/body.dart';
import './provider/user_provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => UserProvider())
        FutureProvider(create: (_) => UserProvider().loadAsset()),
      ],
      child: MaterialApp(
        routes: {
          // "/": (context) => MyApp(),
          "/": (context) => Body(),
          // "/users": (context) => MyUsers(),
          // "/main": (context) => MyMain(),
        },
        initialRoute: "/",
        onGenerateRoute: (settings) {
          final List<String> routeInfo = settings.name.split("/");
          if(routeInfo[0] != '') return null;
          else if(routeInfo[1] == 'users'){
            String userID = routeInfo[2];
            // return MaterialPageRoute(builder: (BuildContext context) => MyUsers(userID: userID));
          } 
        },
      )
    );
  }
}