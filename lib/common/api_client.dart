import 'dart:html';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Uri baseUri = Uri.parse("https://megamouth-api.azurewebsites.net/api/v1");
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<http.Response> post(Uri endpoint, String body) async {
    Uri combineUri = baseUri.resolveUri(endpoint);
    Map<String, String> headers = {'content-type': 'application/json'};

    return await http.post(combineUri, headers: headers, body: body);
  }

  Future<http.Response> get(Uri endpoint, Uri? pathParam) async {
    Uri combineUri = baseUri.resolveUri(endpoint);
    if (pathParam != null) {
      combineUri = combineUri.resolveUri(pathParam);
    }

    String? token = await storage.read(key: "token");
    Map<String, String> headers = {
      'content-type': 'application/json',
      'Authorization': "Bearer${token!}"
    };

    return await http.get(combineUri, headers: headers);
  }

  Future<http.Response> put(Uri endpoint, Uri? pathParam, String body) async {
    Uri combineUri = baseUri.resolveUri(endpoint);
    if (pathParam != null) {
      combineUri = combineUri.resolveUri(pathParam);
    }

    String? token = await storage.read(key: "token");
    Map<String, String> headers = {
      'content-type': 'application/json',
      'Authorization': "Bearer${token!}"
    };

    return await http.put(combineUri, headers: headers, body: body);
  }

  Future<http.Response> delete(Uri endpoint, Uri? pathParam) async {
    Uri combineUri = baseUri.resolveUri(endpoint);
    if (pathParam != null) {
      combineUri = combineUri.resolveUri(pathParam);
    }

    String? token = await storage.read(key: "token");
    Map<String, String> headers = {
      'content-type': 'application/json',
      'Authorization': "Bearer${token!}"
    };

    return await http.delete(combineUri, headers: headers);
  }
}
