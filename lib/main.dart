import 'package:flutter/material.dart';
import 'package:flutter_db_test/data/provider/provider_users.dart';
import 'package:flutter_db_test/screen/body.dart';
import 'package:flutter_db_test/screen/not_found.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderUsers()),
        FutureProvider(create: (_) => ProviderUsers().getAllUser()),
      ],
      child: MaterialApp(
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
            }
        },
        onUnknownRoute: (RouteSettings settings){
            return MaterialPageRoute(
              builder: (BuildContext context) => NotFound(),
            );
        },
      )
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