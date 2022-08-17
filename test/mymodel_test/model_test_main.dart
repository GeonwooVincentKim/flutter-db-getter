// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureProvider<ProviderMyModel>( //                      <--- FutureProvider
//       // initialData: MyModel(someValue: 'default value'),
//       create: (context) => ProviderMyModel.someAsyncFunctionToGetMyModel(),
//       child: MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(title: Text('My App')),
//           body: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[

//               Container(
//                 padding: const EdgeInsets.all(20),
//                 color: Colors.green[200],
//                 child: Consumer<ProviderMyModel>( //                    <--- Consumer
//                   builder: (context, myModel, child) {
//                     return RaisedButton(
//                       child: Text('Do something'),
//                       onPressed: (){
//                         myModel.doSomething();
//                       },
//                     );
//                   },
//                 )
//               ),

//               Container(
//                 padding: const EdgeInsets.all(35),
//                 color: Colors.blue[200],
//                 child: Consumer<MyModel>( //                    <--- Consumer
//                   builder: (context, myModel, child) {
//                     return Text(myModel.someValue);
//                   },
//                 ),
//               ),

//             ],
//           ),
//         ),
//       ),
//     );

//   }
// }

// class ProviderMyModel with ChangeNotifier{
//   String someValue = 'Hello';

//   Future<void> doSomething() async {
//     await Future.delayed(Duration(seconds: 2));
//     someValue = 'Goodbye';
//     print(someValue);
//   }

//   Future<MyModel> someAsyncFunctionToGetMyModel() async { //  <--- async function
//   await Future.delayed(Duration(seconds: 3));
//   return MyModel(someValue: 'new data');
//   }
// }

// class MyModel { //                                               <--- MyModel
//   final String someValue;
//   MyModel({@required this.someValue});
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<MyModel>(
      //                      <--- FutureProvider
      initialData: MyModel(someValue: 'default value'),
      create: (context) => someAsyncFunctionToGetMyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My App')),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel>(
                    //                    <--- Consumer
                    builder: (context, myModel, child) {
                      return ElevatedButton(
                        child: Text('Do something'),
                        onPressed: () {
                          myModel.doSomething();
                        },
                      );
                    },
                  )),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>(
                  //                    <--- Consumer
                  builder: (context, myModel, child) {
                    return Text(myModel.someValue);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<MyModel> someAsyncFunctionToGetMyModel() async {
  //  <--- async function
  await Future.delayed(Duration(seconds: 3));
  return MyModel(someValue: 'new data');
}

class MyModel {
  //                                               <--- MyModel
  MyModel({this.someValue});
  String someValue = 'Hello';
  Future<void> doSomething() async {
    await Future.delayed(Duration(seconds: 2));
    someValue = 'Goodbye';
    print(someValue);
  }
}
