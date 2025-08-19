import 'package:api_check/services/send_post.dart';
import 'package:api_check/widget/post_widget.dart';
import 'package:flutter/material.dart';

class PostsHomePage extends StatefulWidget {
  const PostsHomePage({super.key});

  @override
  State<PostsHomePage> createState() => _PostsHomePageState();
}

class _PostsHomePageState extends State<PostsHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CreatePostPage(),
    PostWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: "Create",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Posts",
          ),
        ],
      ),
    );
  }
}
