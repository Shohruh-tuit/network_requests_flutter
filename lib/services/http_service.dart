import 'dart:convert';

import 'package:http/http.dart';
import 'package:pdp_s5_networkk_request/model/post_model.dart';

class Network {
  // domain nomi o'zgarmasligi uchun bitta o'zgaruvchiga olib olamiz
  static String BASE = "jsonplaceholder.typicode.com";

  // header qismi ham huddi shunday uncha munchaga o'zgarmaydi
  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8'
  };

  /*   Http Api s */
  static String API_LIST = "/posts";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts/"; // {id}
  static String API_DELETE = "/posts/"; // {id}

  /* Http Requests */

  // GET method
  static Future<String> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);

    // url = uri + headers + params
    var response = await get(uri, headers: headers); // javob

    if (response.statusCode == 200) {
      return response.body; // oxir oqibat bizga server body ni beradi
    }
    return null;
  }

  /* POST method */
  static Future<String> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(
        BASE, api); // get dan farqli o'laroq parametrlarni http da berilmaydi

    // url = uri + headers + params
    var response = await post(
      uri,
      headers: headers,
      body: jsonEncode(params),
    ); // javob  va ushbu psotga parametr body attributiga beriladi

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body; // oxir oqibat bizga server body ni beradi
    }
    return null;
  }

  // PUT da o'zgarish faqat if da 201 statuscode wartamas qolgani post metodi bilan bir xil
  static Future<String> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(
        BASE, api); // get dan farqli o'laroq parametrlarni http da berilmaydi

    // url = uri + headers + params
    var response = await put(
      uri,
      headers: headers,
      body: jsonEncode(params),
    ); // javob  va ushbu psotga parametr body attributiga beriladi

    if (response.statusCode == 200) {
      return response.body; // oxir oqibat bizga server body ni beradi
    }
    return null;
  }

  static Future<String> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(
        BASE, api); // get dan farqli o'laroq parametrlarni http da berilmaydi

    // url = uri + headers + params
    var response = await delete(
      uri,
      headers: headers,
      body: jsonEncode(params),
    ); // javob  va ushbu psotga parametr body attributiga beriladi

    if (response.statusCode == 200) {
      return response.body; // oxir oqibat bizga server body ni beradi
    }
    return null;
  }

  /* Http parameters or body */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      "title": post.title,
      "body": post.body,
      "userId": post.userId.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      'id': post.id.toString(),
      "title": post.title,
      "body": post.body,
      "userId": post.userId.toString(),
    });
    return params;
  }
}
