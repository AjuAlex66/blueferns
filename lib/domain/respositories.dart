import 'dart:convert';

import 'package:blueferns_taskaju/utils/helper.dart';
import 'package:http/http.dart';

class ApiRepository {
  static const environment = ApiEnvironment.dev;

  static Future<Response> postMethod(
      String url, Map<String, dynamic> data) async {
    Helper.showLog('${environment.baseUrl + url} -- $data');
    try {
      return await post(
        Uri.parse(environment.baseUrl + url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "",
        },
        body: jsonEncode(data),
      );
    } catch (e) {
      Helper.showException(scope: "postMethod", message: e.toString());
      rethrow;
    }
  }

  static Future<Response> getMethod({required String url}) async {
    Helper.showLog(environment.baseUrl + url);
    try {
      return await get(
        Uri.parse(environment.baseUrl + url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "",
        },
      );
    } catch (e) {
      Helper.showException(scope: "postMethod", message: e.toString());
      rethrow;
    }
  }
}

enum ApiEnvironment {
  dev("https://atom1.blueferns.com"),
  prod("https://atom1.blueferns.com");

  final String baseUrl;
  const ApiEnvironment(this.baseUrl);
}
