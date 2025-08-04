import 'package:flutter/material.dart';
import 'package:world_clock/pages/posts.dart';
// import 'package:world_clock/pages/post_detail_page.dart';
// import 'widgets/loading_widget.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PostsListPage(),
        // '/post-detail': (context) => PostDetailPage(),
      }
    );
  }
}
