import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://192.168.93.49:3000";

  static register(Map data) async {
    var url = Uri.parse("$baseUrl/register");
    try {
      final res = await http.post(url, body: data);

      if (res.statusCode == 201) {
        var response = jsonDecode(res.body);
        response['type'] = 'success';
        return response;
      } else {
        var response = jsonDecode(res.body);
        response['type'] = 'error';
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static login(Map data) async {
    var url = Uri.parse("$baseUrl/login");
    try {
      final res = await http.post(url, body: data);

      if (res.statusCode == 200) {
        var response = jsonDecode(res.body);
        response['type'] = 'success';
        return response;
      } else {
        var response = jsonDecode(res.body);
        response['type'] = 'error';
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static getAUser(Map data) async {
    var url = Uri.parse("$baseUrl/user/${data['id']}");
    Map<String, String> headers = {'Authorization': "Bearer ${data['token']}"};

    try {
      final res = await http.get(url, headers: headers);

      if (res.statusCode == 200) {
        var response = jsonDecode(res.body);
        response['type'] = 'success';
        return response;
      } else {
        var response = jsonDecode(res.body);
        response['type'] = 'error';
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
