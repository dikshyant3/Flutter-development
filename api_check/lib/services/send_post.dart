import 'package:api_check/services/api_service.dart';
import 'package:flutter/material.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();


  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  final ValueNotifier<String> _responseMessage = ValueNotifier("");
  final ValueNotifier<bool> _autoValidate = ValueNotifier(false);

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    _isLoading.dispose();
    _responseMessage.dispose();
    _autoValidate.dispose();
    super.dispose();
  }

  void _sendPost() async {

    _autoValidate.value = true;

    if (!_formKey.currentState!.validate()) {
      return;
    }

    _isLoading.value = true;
    _responseMessage.value = "Sending Post...";

    try {
      var response = await sendFormData(
        title: _titleController.text.trim(),
        body: _bodyController.text.trim(), 
        userId: 111
      );

      
        _isLoading.value = false;
        _responseMessage.value = response;

      if (response.toLowerCase().contains("success")) {
        _showSnackBar("Post sent successfully!", Colors.green);
        // Clear form on success
        _titleController.clear();
        _bodyController.clear();
        _autoValidate.value = false;
      } else {
        _showSnackBar("Failed to send post: $response", Colors.red);
      }
    } catch (e) {
        _isLoading.value = false;
        _responseMessage.value = "Error: $e";
      
      _showSnackBar("Network error occurred", Colors.red);
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Create New Post",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: ValueListenableBuilder<bool>(
          valueListenable: _autoValidate,
          builder: (context, value, child) {
            return Form(
              key: _formKey,
              autovalidateMode: value ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.create,
                            size: 48,
                            color: Colors.indigo[400],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Share your thoughts",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Title Field
                  Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: "Enter your post title...",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.indigo, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red, width: 2),
                      ),
                      prefixIcon: const Icon(Icons.title, color: Colors.indigo),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Title cannot be empty";
                      }
                      if (value.trim().length < 3) {
                        return "Title must be at least 3 characters";
                      }
                      return null;
                    },
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Body Field
                  Text(
                    "Body",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _bodyController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: "Write your post content here...",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.indigo, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(bottom: 80),
                        child: Icon(Icons.description, color: Colors.indigo),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Body cannot be empty";
                      }
                      if (value.trim().length < 10) {
                        return "Body must be at least 10 characters";
                      }
                      return null;
                    },
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Submit Button
                  SizedBox(
                    height: 54,
                    child: ValueListenableBuilder<bool>(
                      valueListenable: _isLoading,
                      builder: (context, isLoading, child) {
                        return ElevatedButton(
                          onPressed: isLoading ? null : _sendPost,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                            disabledBackgroundColor: Colors.grey[300],
                          ),
                          child: _isLoading.value
                              ? const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Text("Sending...", style: TextStyle(fontSize: 16)),
                                  ],
                                )
                              : const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.send, size: 20),
                                    SizedBox(width: 8),
                                    Text(
                                      "Send Post",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                        );
                      }
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Response Message
                  ValueListenableBuilder<String>(
                    valueListenable: _responseMessage, 
                    builder: (context, responseMessage, child){
                      if (responseMessage.isNotEmpty) return SizedBox.shrink();
                    
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: responseMessage.toLowerCase().contains("success")
                            ? Colors.green[50]
                            : Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: responseMessage.toLowerCase().contains("success")
                              ? Colors.green[200]!
                              : Colors.blue[200]!,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            responseMessage.toLowerCase().contains("success")
                                ? Icons.check_circle
                                : Icons.info,
                            color: responseMessage.toLowerCase().contains("success")
                                ? Colors.green[600]
                                : Colors.blue[600],
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              responseMessage,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: responseMessage.toLowerCase().contains("success")
                                    ? Colors.green[700]
                                    : Colors.blue[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                    }
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}