import 'package:api_check/core/network/api_client.dart';
import 'package:api_check/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:api_check/models/post_model.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final ValueNotifier<List<PostModel>> postsNotifier = ValueNotifier([]);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier(true);

  // formData response
  final ValueNotifier<String> formDataResponseNotifier = ValueNotifier(
    'Sending Form Data....',
  );

  @override
  void initState() {
    super.initState();
    fetchPosts();
    loadFormData();
  }

  Future<void> loadFormData() async{
    var response = await sendFormData(title: 'Title', body: 'body', userId: 1);
    formDataResponseNotifier.value = response.toString();
  }

    void fetchPosts() async{
      try {
        var response = await DioClient.dio.get('posts');

        if (response.data is List){
          postsNotifier.value = (response.data as List).map((json)=> PostModel.fromJson(json)).toList();
        }
        else {
          postsNotifier.value = [];
        }
      } catch (e) {
        print('Error while fetching the posts $e');
        postsNotifier.value = [];
      } finally {
        isLoadingNotifier.value = false;
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'API CHECK',
          style:TextStyle(
            fontSize: 12,
            color: Colors.amberAccent,
          )
          ),
      ),
      body: Column(children: [
        ValueListenableBuilder<String>(
          valueListenable: formDataResponseNotifier, 
          builder: (context, response, _) {
            return Text(
              response,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            );
          },
        ),

        // Posts List
        Expanded(
          child: ValueListenableBuilder<bool>(
            valueListenable: isLoadingNotifier, 
            builder: (context, isLoading, _){
              if(isLoading){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ValueListenableBuilder<List<PostModel>>(
                valueListenable: postsNotifier, 
                builder: (context, posts, _){
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index){
                      final post = posts[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 6.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'User ID: ${post.userId}',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                  'ID: ${post.id}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  post.title,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(post.body),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          )
        )
      ],)
    );
  }
}