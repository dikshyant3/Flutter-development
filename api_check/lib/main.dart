// import 'package:api_check/services/send_post.dart';
import 'package:api_check/providers/posts_provider.dart';
import 'package:flutter/material.dart';
import 'package:api_check/screen/posts_home_screen.dart';
import 'package:provider/provider.dart';
// import 'package:api_check/screen/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        home: const AppInitializer(), 
      ),
    );
  }
}

class AppInitializer extends StatefulWidget {
  const AppInitializer({super.key});

  @override
  State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Initialize the PostsProvider to load saved data
    final postsProvider = Provider.of<PostsProvider>(context, listen: false);
    await postsProvider.initProvider();

    if (mounted) {
      setState(() {
        _isInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return const PostsHomePage();
  }
}