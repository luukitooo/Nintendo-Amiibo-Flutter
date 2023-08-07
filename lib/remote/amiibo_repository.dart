import 'dart:convert';
import 'package:amiibo_app_flutter/remote/amiibo_model.dart';
import 'package:amiibo_app_flutter/util/call_result.dart';
import 'package:amiibo_app_flutter/util/network_caller.dart';
import 'package:http/http.dart' as http;

class AmiiboRepository {
  static const String url = "https://amiiboapi.com/api/amiibo/";

  Future<List<String>> fetchCategories() async {
    var result = await NetworkCaller.safeCall(() => http.get(Uri.parse(url)));
    if (result is Success) {
      return (result.data["amiibo"] as List)
          .map((json) => AmiiboDto.fromJson(json).amiiboSeries)
          .toSet()
          .toList();
    }
    return List.empty();
  }

  Future<List<AmiiboDto>> fetchAmiibo() async {
    var result = await NetworkCaller.safeCall(() => http.get(Uri.parse(url)));
    if (result is Success) {
      return (result.data["amiibo"] as List)
          .map((json) => AmiiboDto.fromJson(json))
          .toList();
    }
    return List.empty();
  }
}
