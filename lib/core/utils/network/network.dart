import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:scanx/features/analyse_image/domain/entities/patient_entity.dart';

class NetworkRequest {
  final _baseUurl = "http://192.168.1.85:3030";
  final client = HttpClient();
  final _dio = Dio();

  Future<Response<dynamic>> post(String path, dynamic data) async {
    try {
      final response =
          await _dio.post('$_baseUurl/$path', data: json.encode(data));
      return response;
    } catch (e) {
      print('Erreur lors de l\'exécution du code : $e');
      rethrow;
    }
  }

  Future<dynamic> analyse(String path, PatientEntity data) async {
    _dio.options.contentType = "multipart/form-data";
    var formData = FormData.fromMap({
      'firstName': data.firstName,
      'lastName': data.lastName,
      'birthDate': data.firstName,
      'image': await MultipartFile.fromFile(data.image.path,
          filename: data.image.name)
    });
    final res = await _dio.post('$_baseUurl/$path', data: formData);
    return res.data['patient_result'];
  }

  Future<dynamic> getAll(String path) async {
    final res = await _dio.get('$_baseUurl/$path');
    return res.data;
    // return {'patient_result': 'hhh'};
  }
}
