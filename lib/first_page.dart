import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:map_test/map_sample.dart';

class FirstApp extends StatefulWidget{
  FirstApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _FirstAppState();
}

class _FirstAppState extends State<FirstApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://minsu0715.github.io/map_data/map_marker_data_',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => MapSample()));
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.navigation,color: Colors.black),
      ),
    );
  }
}