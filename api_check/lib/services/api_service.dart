import 'package:api_check/core/network/api_client.dart';
import 'package:dio/dio.dart';

Future<String> sendFormData({
  required String title,
  required String body,
  required int userId,
}) async {
  try {
    Map<String, dynamic> postData = 
      {
        "title": title,
        "body": body,
        "userId": userId,
      };
    

    Response response = await DioClient.dio.post("posts", data:postData);

    if(response.statusCode == 200 || response.statusCode == 201){
      return "Form Data sent successfully ID: ${response.data['id']}";
    }
    else{
      return "Error: ${response.statusCode}";
    }
  } on DioException catch(e){
    return "Dio Error: ${e.response?.data ?? e.message}";
  }
}