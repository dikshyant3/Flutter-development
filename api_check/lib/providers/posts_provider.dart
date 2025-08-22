import 'dart:convert';

import 'package:api_check/core/network/api_client.dart';
import 'package:api_check/models/post_model.dart';
import 'package:api_check/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostsProvider extends ChangeNotifier{

  static const String _submittedPostsKey = 'submitted_posts';

  // ignore: prefer_final_fields
  List<PostModel> _submittedPosts = [];
  List<PostModel> _fetchedPosts = [];
  bool _isLoading = false;
  bool _isSubmitting = false;
  String _errorMessage = "";
  String _responseMessage = ""; 
  SharedPreferences? _prefs;
  // bool _autoValidate = false;

  List<PostModel> get submittedPosts => _submittedPosts;
  List<PostModel> get fetchedPosts => _fetchedPosts;
  bool get isLoading => _isLoading;
  String get responseMessage => _responseMessage;
  String get errorMessage => _errorMessage;
  bool get isSubmitting => _isSubmitting;

  // bool get autoValidate => _autoValidate;

  // void setAutoValidate(bool value){
  //   _autoValidate = value;
  //   notifyListeners();
  // }

  List<PostModel> get allPosts{
    return [...submittedPosts, ...fetchedPosts];
  }

  Future<void> initProvider() async{
    _prefs = await SharedPreferences.getInstance();
    await loadSubmittedPosts();
  }

  Future<void> loadSubmittedPosts() async{
    try {
      final String? postsJson = _prefs?.getString(_submittedPostsKey);
      if (postsJson != null && postsJson.isNotEmpty){
        final List<dynamic> postsList = jsonDecode(postsJson);
        _submittedPosts = postsList.map((postMap)=>PostModel.fromJson(postMap)).toList();
        notifyListeners();
      }
    } catch (e) {
      print('Error loading the posts: $e');
      await _prefs?.remove(_submittedPostsKey);
    }
  }

  Future<void> saveSubmittedPosts() async{
    try {
      final List<Map<String, dynamic>> postsMapList = _submittedPosts.map((post)=>{
        'userId': post.userId,
        'id': post.id,
        'title': post.title,
        'body': post.body,
      }).toList();
      final String postsJson = jsonEncode(postsMapList);
      await _prefs?.setString(_submittedPostsKey, postsJson);
    } catch (e) {
      print("Error submitting the posts: $e");
    }
  }

  Future<void> clearSavedData() async{
    await _prefs?.remove(_submittedPostsKey);
    _submittedPosts.clear();
    notifyListeners();
  }

  Future<void> removePost(int postId) async {
    try {
      _submittedPosts.removeWhere((post) => post.id == postId);
      await saveSubmittedPosts();
      notifyListeners();
    } catch (e) {
      print('Error removing post: $e');
    }
  }
  
    Future<void> fetchPosts() async{
      _isLoading = true;
      _errorMessage = "";
      notifyListeners();

      try{
        final response = await DioClient.dio.get("posts");

        if (response.data is List){
          _fetchedPosts = (response.data as List).map((json)=>PostModel.fromJson(json)).toList();
          _errorMessage = "";
        } else {
        _fetchedPosts = [];
        _errorMessage = "Invalid response format";
      }
      }catch(e){
        _errorMessage = "Failed to fetch posts:$e";
        _fetchedPosts = [];
      } finally{
        _isLoading = false;
        notifyListeners();
      }
    }

    Future<bool> submitPost({
      required String title,
      required String body,
      required int userId,
    }) async {
      _isSubmitting = true;
      _responseMessage = "Sending Post...";
      try {
      final response = await sendFormData(
        title: title,
        body: body, 
        userId: userId,
      );

      _responseMessage = response;

      if (response.toLowerCase().contains("success")) {
        final newPost = PostModel(
          userId: userId, 
          id: _submittedPosts.length + 1,
          title: title, 
          body: body
        );


        _submittedPosts.insert(0, newPost);
        await saveSubmittedPosts();
        notifyListeners();
        return true;
      }
      return false;
      }
      catch(e){
        _responseMessage = "Error: $e";
        return false;
      } finally{
        _isSubmitting = false;
        notifyListeners();
      }
      }

      Future<void> loadFormData() async{
        _responseMessage = "Sending the form data...";
        notifyListeners();

        try {
          var response = await sendFormData(title: 'title', body: 'body', userId: 111);
          _responseMessage = response.toString();
          notifyListeners();
        } catch (e) {
          _responseMessage = "Error : $e";
          notifyListeners();
        }
      }

      void clearMessage(){
        _responseMessage = "";
        notifyListeners();
      }
  }

