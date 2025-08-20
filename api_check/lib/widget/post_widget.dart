import 'package:api_check/providers/posts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  // final ValueNotifier<List<PostModel>> postsNotifier = ValueNotifier([]);
  // final ValueNotifier<bool> isLoadingNotifier = ValueNotifier(true);

  // formData response
  // final ValueNotifier<String> formDataResponseNotifier = ValueNotifier(
  //   'Sending Form Data....',
  // );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<PostsProvider>(context, listen: false);
      provider.fetchPosts();
      provider.loadFormData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'API CHECK',
          style: TextStyle(fontSize: 12, color: Colors.amberAccent),
        ),
      ),
      body: Column(
        children: [
          Consumer<PostsProvider>(
            builder: (context, postsProvider, child) {
              return Text(
                postsProvider.responseMessage.isEmpty
                    ? 'Sending Form data ...'
                    : postsProvider.responseMessage,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              );
            },
          ),

          // Posts List
          Expanded(
            child: Consumer<PostsProvider>(
              builder: (context, postsProvider, child) {
                if (postsProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (postsProvider.errorMessage.isNotEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          postsProvider.errorMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                        ElevatedButton(
                          onPressed: () => postsProvider.fetchPosts(),
                          child: const Text("Retry"),
                        ),
                      ],
                    ),
                  );
                }

                final posts = postsProvider.allPosts;

                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];

                    final isNewPost =
                        index < postsProvider.submittedPosts.length;

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 6.0,
                      ),
                      elevation: isNewPost ? 4 : 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'User ID: ${post.userId}',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Spacer(),
                                if (isNewPost)
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "New",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                              ],
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
            ),
          ),
        ],
      ),
    );
  }
}
