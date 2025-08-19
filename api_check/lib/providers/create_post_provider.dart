import 'package:api_check/models/post_model.dart';
import 'package:api_check/services/api_service.dart';
import 'package:flutter/material.dart';

class CreatePostProvider extends ChangeNotifier{
  List<PostModel> submittedPosts = [];
  List<PostModel> fetchedPosts = [];
  bool isLoading = false;
  String responseMessage = "";


    Future<void> submitPost({
      required String title,
      required String body,
      required int userId,
    }) async {
      try {
      final response = await sendFormData(
        title: title,
        body: body, 
        userId: userId,
      );

      if (response.toLowerCase().contains("success")) {
        final postId = submittedPosts.length + 1;

        final newPost = PostModel(
          userId: userId, 
          id: postId,
          title: title, 
          body: body
        );

        submittedPosts.add(newPost);
        notifyListeners();
      }
      }
      catch(e){
        isLoading = false;
        responseMessage = "Failed to Submit Post: $e";
      }

    }
  }

