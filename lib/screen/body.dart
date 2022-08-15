import 'package:flutter/material.dart';
import 'package:flutter_db_test/screen/detail/homepage.dart';
import 'package:flutter_db_test/screen/detail/userspage.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String title;
  int _selectPageNum = 0;

  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  Widget _buildBody() {
    return PageView(
        controller: pageController,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          HomePage(
              pageIndex: _selectPageNum,
              title: "First Page",
              pageInfo: _bodyNaviBar),
          UserPage(
              pageIndex: _selectPageNum,
              title: "Second Page",
              pageInfo: _bodyNaviBar),
        ],
        onPageChanged: (page) => setState(() => {_selectPageNum = page}));
  }

  List<BottomNavigationBarItem> _bodyNaviBarItem() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(
          icon: Icon(Icons.verified_user), label: "User Test")
    ];
  }

  Widget _bodyNaviBar(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) => tapBottom(index),
        currentIndex: _selectPageNum,
        items: _bodyNaviBarItem(),
        iconSize: 45,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.amber);
  }

  void tapBottom(int index) {
    setState(() {
      _selectPageNum = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: SideMenu(),
      body: _buildBody(),
      bottomNavigationBar: _bodyNaviBar(context),
    );
  }
}
