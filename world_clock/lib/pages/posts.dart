import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_check.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import '../widgets/post_card.dart';

class PostsListPage extends StatefulWidget {
  const PostsListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PostsListPageState createState() => _PostsListPageState();
}

class _PostsListPageState extends State<PostsListPage> {
  final ApiService _apiService = ApiService();
  List<Post>? posts;
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      final fetchedPosts = await _apiService.fetchPosts();
      setState(() {
        posts = fetchedPosts;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Posts',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: _loadPosts,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueAccent.withAlpha(10),
              Colors.white,
            ],
          ),
        ),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return LoadingWidget(message: 'Loading posts...');
    }

    if (error != null) {
      return ErrorDisplayWidget(
        error: error!,
        onRetry: _loadPosts,
      );
    }

    if (posts?.isEmpty ?? true) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox,
              size: 64,
              color: Colors.grey[400],
            ),
            SizedBox(height: 16),
            Text(
              'No posts found',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadPosts,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: posts!.length,
        itemBuilder: (context, index) {
          final post = posts![index];
          return PostCard(
            post: post,
            onTap: () => _navigateToPostDetail(post),
          );
        },
      ),
    );
  }

  void _navigateToPostDetail(Post post) {
    Navigator.pushNamed(
      context,
      '/post-detail',
      arguments: post,
    );
  }
}
