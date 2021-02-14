import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<UserModel>> fetchPhotos(http.Client client) async {
  final response =
      // await client.get('https://jsonplaceholder.typicode.com/photos');
      await client.get("http://192.168.219.104:3011/api/users");
  // Use the compute function to run parsePhotos in a separate isolate.
  debugPrint(response.body);
  // return json.decode(response.body);
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<UserModel> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  debugPrint(parsed);
  return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
}

// class Photo {
//   final int albumId;
//   final int id;
//   final String title;
//   final String url;
//   final String thumbnailUrl;

//   Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

//   factory Photo.fromJson(Map<String, dynamic> json) {
//     return Photo(
//       albumId: json['albumId'] as int,
//       id: json['id'] as int,
//       title: json['title'] as String,
//       url: json['url'] as String,
//       thumbnailUrl: json['thumbnailUrl'] as String,
//     );
//   }
// }

class UserModel{
  final int ID;
  final String USER_NAME;
  final String EMAIL;
  final String IMAGE_URL;
  final String ADDRESS;

  UserModel({
    @required this.ID,
    @required this.USER_NAME,
    @required this.EMAIL,
    @required this.IMAGE_URL,
    @required this.ADDRESS
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      ID: json['ID'] as int,
      USER_NAME: json['USER_NAME'] as String,
      EMAIL: json['EMAIL'] as String,
      IMAGE_URL: json['IMAGE_URL'] as String,
      ADDRESS: json['ADDRESS'] as String
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: fetchPhotos(http.Client()),
        // future: fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<UserModel> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        // return Image.network(photos[index].thumbnailUrl);
        return Text(photos[index].USER_NAME);
      },
    );
  }
}