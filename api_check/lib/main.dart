// import 'package:api_check/services/send_post.dart';
import 'package:api_check/providers/posts_provider.dart';
import 'package:flutter/material.dart';
import 'package:api_check/screen/posts_home_screen.dart';
import 'package:provider/provider.dart';
// import 'package:api_check/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (context) => PostsProvider(),
        ),
      ],
      child: MaterialApp(
        home: PostsHomePage(),
      ),
    );
  }
}
