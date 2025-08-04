import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:world_clock/models/post.dart';

class ApiService{

    static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

    static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  // Generic HTTP GET method
  Future<http.Response> _get(String endpoint) async {
    try {
      final uri = Uri.parse('$_baseUrl$endpoint');
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ApiException('HTTP ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw ApiException('Network error: $e');
    }
  }

  // Fetch all Posts
  Future<List<Post>> fetchPosts() async{
    try{
    final response = await _get('/posts');
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((json)=> Post.fromJson(json)).toList();
    }
    catch(e){
      throw ApiException('Failed to fetch posts: $e');
    }
  } 

  //  Fetch single Post
  Future<Post> fetchPost(int postId) async{
    try{
      final response = await _get('/posts/$postId');
      return Post.fromJson(json.decode(response.body));
    }
    catch(e){
      throw ApiException('Failed to fetch post: $e');
    }
  }

  // fetch post by title
  Future<Post> fetchPostByTitle(String title) async{
    try {
      final response = await _get('/posts/$title');
      return Post.fromJson(json.decode(response.body));
    } catch (e) {
      throw ApiException('Failed to fetch post by title: $e');
    }
  }

  
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}
