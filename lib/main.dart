import 'package:flutter/material.dart';
import 'package:flutter_db_test/screen/body.dart';
import 'package:flutter_db_test/screen/detail/detail_user_page.dart';
import 'package:flutter_db_test/screen/not_found.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
            // "/": (context) => MyApp(),
            "/": (context) => Body(),
            // "/users": (context) => userSettings(),
        },
        initialRoute: "/",
        onGenerateRoute: (settings) {
            final List<String> pathElements = settings.name.split("/");
            if(pathElements[0] != '') return null;
            if(pathElements[1] == 'games'){
              String gameID = pathElements[2];
              // return MaterialPageRoute(builder: (BuildContext context) => Games(gameID: gameID);
            }else if(pathElements[1] == 'users'){
              String userID = pathElements[2];
              return MaterialPageRoute(builder: (BuildContext context) => DetailUser(userID: userID));
            }
        },
        onUnknownRoute: (RouteSettings settings){
            return MaterialPageRoute(
              builder: (BuildContext context) => NotFound(),
            );
        },
    );
    // return MultiProvider(
    //   providers: [

    //   ],
    //   child: MaterialApp(
    //     routes: {
    //       // "/": (context) => MyApp(),
    //       "/": (context) => Body(),
    //       // "/users": (context) => userSettings(),
    //     },
    //     initialRoute: "/",
    //     onGenerateRoute: (settings) {
    //       final List<String> pathElements = settings.name.split("/");
    //       if(pathElements[0] != '') return null;
    //       if(pathElements[1] == 'games'){
    //         String gameID = pathElements[2];
    //         // return MaterialPageRoute(builder: (BuildContext context) => Games(gameID: gameID);
    //       }
    //     },
    //     onUnknownRoute: (RouteSettings settings){
    //       return MaterialPageRoute(
    //         builder: (BuildContext context) => NotFound(),
    //       );
    //     },
    //   ),
    // );
  }
}