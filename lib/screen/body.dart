import 'package:flutter/material.dart';

import 'home.dart';
import 'users.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String title;
  int pageIndex = 0;
  List<Widget> controller = List<Widget>();
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true
  );

  Widget _buildBody(){
    return PageView(
      controller: pageController,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        MyHome(pageIndex: pageIndex, title: "Home", pageInfo: _bodyNaviBar),
        MyUser(pageIndex: pageIndex, title: "User", pageInfo: _bodyNaviBar),
      ], onPageChanged: (page) => setState((){pageIndex = page;}),
    );
  }

  List<BottomNavigationBarItem> _bodyNaviBarItem(){
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        // ignore: deprecated_member_use
        title: Text("Home")
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.verified_user),
        // ignore: deprecated_member_use
        title: Text("User")
      )
    ];
  }

  Widget _bodyNaviBar(BuildContext context){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (tap) => tapBottom(tap),
      currentIndex: pageIndex,
      items: _bodyNaviBarItem(),
      iconSize: 45,
      selectedItemColor: Colors.white,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  void tapBottom(int index){
    setState(() {
      pageIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _bodyNaviBar(context),
    );
  }
}