import 'dart:convert';
import 'dart:io';

class NetworkRequest {
  final _baseUurl = "http://localhost:3000/";
  final _client = HttpClient();

  Future<HttpClientRequest> post(dynamic data) async {
    final res = await _client.post(
        _baseUurl, HttpClient.defaultHttpPort, json.encode(data));
    return res;
  }

  Future<HttpClientRequest> analysePatient(dynamic data) async {
    final res = await _client.post(
        _baseUurl, HttpClient.defaultHttpPort, json.encode(data));
    return res;
  }
}
