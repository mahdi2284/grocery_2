import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:grocery/config.dart';
import 'package:grocery/models/category_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static var client = http.Client();

  static Future<List<CategoryModel>?> getCategories() async {
    Map<String, String> requestHeaders = {'content-type': 'application/json'};

    Map<String, dynamic> queryString = {
      'consumer_key': Config.key,
      'consumer_secret': Config.secret,
      'parent': '0',
      '_field[]': ['id', 'name', 'image.src'],
      'per_page': '100',
      'page': '1',
    };
    var url = Uri.http(
      Config.apiUrl,
      Config.apiEndPoint + Config.categoriesURL,
      queryString,
    );
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return categoriesFromJson(data);
    } else {
      return null;
    }
  }
}
