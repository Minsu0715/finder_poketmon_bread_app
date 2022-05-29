import 'package:flutter/material.dart';
import 'package:map_test/first_page.dart';
import 'package:map_test/second_page.dart';
import 'package:map_test/third_page.dart';
import 'package:map_test/fourth_page.dart';
import 'package:map_test/map_sample.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'map view',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('poketmon',style: TextStyle(color: Color(0xff0000FF))),
          backgroundColor: Colors.white,
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[FirstApp(), SecondApp(),ThirdApp(),FourthApp(),MapSample()],
          controller: controller,
        ),
        bottomNavigationBar: TabBar(

          tabs: <Tab>[
            Tab(icon: Icon(Icons. gps_fixed_sharp)),
            Tab(icon: Icon(Icons.shopping_basket)),
            Tab(icon: Icon(Icons.favorite_border)),
            Tab(icon: Icon(Icons.person)),
            Tab(icon: Icon(Icons.map))
          ], controller: controller,
          indicatorColor: Colors.transparent, // indicator 없애기
          unselectedLabelColor: Colors.grey, // 선택되지 않은 tab 색
          labelColor: Colors.black,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
