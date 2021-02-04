import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

      ],
      /* child: Consumer<ProviderThemeDynamic>(
        builder: (ctx, ProviderThemeDynamic themeData, child){
          return MaterialApp(
            title: "FireBase-ApplicationApp",
            theme: themeDynamic.darkTheme ? dark : lighttheme: themeDynamic.darkTheme ? dark : light
          );
        }
      ) */
      child: MaterialApp(
        title: "FireBase-ApplicationApp",
        // theme: themeDynamic.darkTheme ? dark : light,
        initialRoute: "/",
        routes: {
          // "/": (context) => Body(),
          // "/users": (context) => userSettings(title: "Settings"),
        }
      )
    );
  }
}
