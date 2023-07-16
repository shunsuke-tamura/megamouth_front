import 'package:http/http.dart' as http;
import 'package:megamouth_front/main.dart';

class ApiClient {
  Uri baseUri = Uri.parse("https://megamouth-api.azurewebsites.net/api/v1");

  Future<http.Response> post(Uri endpoint, String body) async {
    Uri combineUri = baseUri.replace(path: "${baseUri.path}/${endpoint.path}");
    Map<String, String> headers = {'content-type': 'application/json'};

    return await http.post(combineUri, headers: headers, body: body);
  }

  Future<http.Response> get(Uri endpoint, Uri? pathParam,
      {bool useToken = true}) async {
    Uri combineUri = baseUri.replace(path: "${baseUri.path}/${endpoint.path}");
    if (pathParam != null) {
      combineUri =
          combineUri.replace(path: "${combineUri.path}/${pathParam.path}");
    }

    Map<String, String> headers = {'content-type': 'application/json'};
    if (useToken) {
      String? token = await storage.read(key: "token");
      if (token == null) {
        return http.Response('token is null', 400);
      }
      headers.addAll({'Authorization': "Bearer$token"});
    }

    return await http.get(combineUri, headers: headers);
  }

  Future<http.Response> put(Uri endpoint, Uri? pathParam, String body) async {
    Uri combineUri = baseUri.replace(path: "${baseUri.path}/${endpoint.path}");
    if (pathParam != null) {
      combineUri =
          combineUri.replace(path: "${baseUri.path}/${pathParam.path}");
    }

    String? token = await storage.read(key: "token");
    if (token == null) {
      return http.Response('token is null', 400);
    }
    Map<String, String> headers = {
      'content-type': 'application/json',
      'Authorization': "Bearer$token"
    };

    return await http.put(combineUri, headers: headers, body: body);
  }

  Future<http.Response> delete(Uri endpoint, Uri? pathParam) async {
    Uri combineUri = baseUri.replace(path: "${baseUri.path}/${endpoint.path}");
    if (pathParam != null) {
      combineUri =
          combineUri.replace(path: "${baseUri.path}/${pathParam.path}");
    }

    String? token = await storage.read(key: "token");
    if (token == null) {
      return http.Response('token is null', 400);
    }
    Map<String, String> headers = {
      'content-type': 'application/json',
      'Authorization': "Bearer$token"
    };

    return await http.delete(combineUri, headers: headers);
  }
}
