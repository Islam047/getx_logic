import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Post.dart';
import 'log_service.dart';

class NetworkService {
  static bool isTester = true;
 // #ServerBaseApi
  static const String SERVER_DEVELOPMENT = "jsonplaceholder.typicode.com";
  static const String SERVER_PRODUCTION = "jsonplaceholder.typicode.com";
  // #ServerApi
  static const String API_POST = "/posts";
  static const String API_POST_CREATE = "/posts";
  static const String API_POST_DELETE = "/posts/"; //ID
  static const String API_POST_UPDATE = "/posts/"; //ID
 // #GetServer
  static String getServer() {
    if (isTester) {
      return SERVER_DEVELOPMENT;
    }
    return SERVER_PRODUCTION;
  }
  // #Header
  static Map<String, String> get headers {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    return headers;
  }
  // #GET

  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    Uri uri = Uri.https(getServer(), api, params);
    http.Response? response = await http.get(uri, headers: headers);
    LogService.i(response.statusCode.toString());

    if (response.statusCode != 200) {
      return null;
    }

    return response.body;
  }
  // #POST

  static Future<String?> POST(String api, Map<String, dynamic> body) async {
    Uri uri = Uri.https(getServer(), api);
    http.Response? response = await http.post(uri, body: body, headers: headers);
    LogService.i(response.body);

    if (response.statusCode != 200 || response.statusCode != 201) {
      return null;
    }

    return response.body;
  }
  // #Delete

  static Future<String?> DELETE(String api, Map<String, dynamic> params) async {
    Uri uri = Uri.https(getServer(), api);
    http.Response? response = await http.delete(uri, body: params, headers: headers);
    LogService.i(response.statusCode.toString());

    if (response.statusCode != 200 || response.statusCode != 201) {
      return null;
    }

    return response.body;
  }
  // #PUT

  static Future<String?> PUT(String api, Map<String, dynamic> body) async {
    Uri uri = Uri.https(getServer(), api);
    http.Response? response = await http.put(uri, body: jsonEncode(body), headers: headers);
    LogService.i(response.body);

    return response.body;
  }
 // #Parameters
  static Map<String, dynamic> emptyParams() {
    Map<String, dynamic> map = {};
    return map;
  }
  // #ParsingFromListObject
  static List<Post> parsePostList(String body) {
    List json = jsonDecode(body);
    List<Post> posts = json.map((item) => Post.fromJson(item)).toList();
    return posts;
  }
}