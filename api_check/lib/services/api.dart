import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_check/models/user.dart';

class ApiService {
  static const String baseUrl = 'https://randomuser.me/api/';

  static Future<List<User>> fetchUsers(int count) async {
    try{
      final url = '$baseUrl?results=$count';
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200){
        final json = jsonDecode(response.body);
        final List<dynamic> results = json['results'];

      List<User> users = results.map((userJson) => User.fromJson(userJson)).toList();
      return users;
      } 
      else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    }
    catch (e) {
      print('Error fetching users: $e');
      throw Exception('Error fetching users: $e');
    }
  }
}