// 현재 위치 구글맵으로 표시해주는 page를 만들었습니다. 실행시 에뮬레이터 현재 위치 default 값이 구글 본사이어서 계속 한 곳 만 뜰 겁니다.
// 길찾기 구현은 실패해서 현재 위치 구글맵으로 뿌리는 것으로 대체했습니다.
// 구동 잘 안될 시 아래 콘솔 창 오류 잘 봐주세요.
// 이 앱이 애뮬레이터에서 구동되기 위해 androidMainifest.xml 에서 구글 qpi 키가 필요합니다. 구글링하시면 됩니다! 그리고
// <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
// <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
// 위 두 문장도 andriodMainifest.xml 에 참조해야 하는데 위치를 모르시면 이것도 구글링 하시면 됩니다!
// 전체적으로 모르시겠다면 flutter 구글맵 빈 화면이라고 검색하시면 됩니다.
// pubspec.yaml 도 잘 확인하셔서 pub.get 잘 해주셔야 됩니다!

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