import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:premier_league/Utilities/date_helper.dart';

import '../Utilities/shared_preferances_helper.dart';
import '../Utilities/toast_helper.dart';

class APIHelper {
  /// baseServerURL
  static const String baseServerURL = "https://api.football-data.org";
  /// baseURL
  static const String _baseURL = "$baseServerURL/v2/competitions/";

  /// Apis Url
  static const String matchApi = "2021/matches";

  /// function to get request Api
  static Future getRequest({
    required String url,
    String? customUrl,
    Map<String, String>? headers,
  }) async {
    try {
      log(customUrl ?? "$_baseURL$url");
    var request = http.Request('GET', Uri.parse(customUrl ?? "$_baseURL$url"));
    request.headers.addAll({
      'X-Auth-Token': '2ed0805d217745e0a9c866af252ddd1f',
      // 'Authorization': 'Bearer ${SharedPref.getServerData()?.accessToken}'
    });
    if (headers != null) request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      String result = await response.stream.bytesToString();
      return json.decode(result);
    }else{
      return null;
    }
    } catch (e) {
      log('error : ' + e.toString());
      return null;
    }
  }
}
