import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class NetworkRequest {
  final _baseUurl = "http://127.0.0.1:3030";
  final client = HttpClient();
  final dio = Dio();

  Future<Response<dynamic>> post(String path, dynamic data) async {
    try {
      final response =
          await dio.post('$_baseUurl/$path', data: json.encode(data));
      return response;
    } catch (e) {
      print('Erreur lors de l\'exécution du code : $e');
      rethrow;
    }
  }

  Future<String> analyse(
    String path,
  ) async {
    dio.options.contentType = "multipart/form-data";
    var formData = FormData.fromMap({
      'firstName': 'kdb',
      'lastName': "ismael",
      'birthDate': "date",
      'image':
          await MultipartFile.fromFile('./text.txt', filename: 'upload.txt')
    });
    // final response=await
    return "";
  }
}
