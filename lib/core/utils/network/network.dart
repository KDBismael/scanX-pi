import 'dart:convert';
import 'dart:io';

class NetworkRequest {
  final _baseUurl = "http://localhost:3030";
  final _client = HttpClient();

  Future<HttpClientRequest> post(String path, dynamic data) async {
    final res = await _client.post(
        '$_baseUurl/$path', HttpClient.defaultHttpPort, json.encode(data));
    return res;
  }

  // Future<HttpClientRequest> analysePatient(dynamic data) async {
  //   final res = await _client.post(
  //       _baseUurl, HttpClient.defaultHttpPort, json.encode(data));
  //   return res;
  // }
}
