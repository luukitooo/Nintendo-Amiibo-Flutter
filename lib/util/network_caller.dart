import 'dart:convert';

import 'package:amiibo_app_flutter/util/call_result.dart';
import 'package:http/http.dart';

class NetworkCaller {

  static Future<CallResult> safeCall(Future<Response> Function() networkCall) async {
    try {
      var response = await networkCall.call();
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(data: json.decode(response.body));
      } else {
        return Failure(exception: Exception("Request Error!"));
      }
    } on Exception catch (e) {
      return Failure(exception: e);
    }
  }
}