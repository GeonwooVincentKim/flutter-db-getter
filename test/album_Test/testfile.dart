import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// Main app and Pages for Tab Layout
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => DataProvider()),
              FutureProvider(create: (_) => UserProvider().loadUserData()),
              StreamProvider(
                  create: (_) => EventProvider().intStream(), initialData: 0)
            ],
            child: DefaultTabController(
                length: 3,
                child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("Provider Demo"),
                      bottom: TabBar(
                        tabs: [
                          Tab(icon: Icon(Icons.add)),
                          Tab(icon: Icon(Icons.person)),
                          Tab(icon: Icon(Icons.message)),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        MyCountPage(),
                        MyUserPage(),
                        MyEventPage(),
                      ],
                    ),
                  ),
                ))));
  }
}

// Event page (counting)
class MyEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _value = Provider.of<int>(context);
    return Container(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('StreamProvider Example'),
        SizedBox(height: 150),
        Text('${_value.toString()}',
            style: Theme.of(context).textTheme.displayLarge)
      ],
    )));
  }
}

// User List Page
class MyUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _users = Provider.of<List<User>>(context);
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('FutureProvider Example, users loaded from a File'),
        ),
        Expanded(
            child: _users == null
                ? Container(child: CupertinoActivityIndicator(radius: 50.0))
                : ListView.builder(
                    itemCount: _users.length,
                    itemBuilder: (context, index) {
                      return Container(
                          height: 50,
                          color: Colors.grey[(index * 200) % 400],
                          child: Center(
                              child: Text(
                                  '${_users[index].firstName} ${_users[index].lastName} | ${_users[index].website}')));
                    }))
      ],
    );
  }
}

// Counter Page
class MyCountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DataProvider _data = Provider.of<DataProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ChangeNotifierProvider Example'),
            SizedBox(height: 150),
            Text(
              '${_data.count}',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _data.incrementCount(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

// EventProvider (Stream)
class EventProvider {
  Stream<int> intStream() {
    Duration interval = Duration(seconds: 2);
    int _count = 0;
    return Stream<int>.periodic(interval, (int _count) => _count++);
  }
}

// UserProvider (Future)
class UserProvider {
  final String _dataPath = "assets/data/users.json";
  List<User> users;

  Future<List<User>> loadUserData() async {
    var dataString = await loadAsset();
    Map<String, dynamic> jsonUserData = jsonDecode(dataString);
    users = UserList.fromJson(jsonUserData['users']).users;
    print('done loading user!' + jsonEncode(users));
    return users;
  }

  Future<String> loadAsset() async {
    return await Future.delayed(Duration(seconds: 10), () async {
      return await rootBundle.loadString(_dataPath);
    });
  }
}

// DataProvider (ChangeNotifier)
class DataProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  DataProvider() {}

  void incrementCount() {
    _count++;
    notifyListeners();
  }
}

// User Model
class User {
  final String firstName, lastName, website;
  const User(this.firstName, this.lastName, this.website);

  User.fromJson(Map<String, dynamic> json)
      : this.firstName = json['first_name'],
        this.lastName = json['last_name'],
        this.website = json['website'];

  Map<String, dynamic> toJson() => {
        "first_name": this.firstName,
        "last_name": this.lastName,
        "website": this.website
      };
}

// User List Model
class UserList {
  final List<User> users;
  UserList(this.users);

  UserList.fromJson(List<dynamic> usersJson)
      : users = usersJson.map((user) => User.fromJson(user)).toList();
}
