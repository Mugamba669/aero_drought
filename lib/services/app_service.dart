import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class AppService {
  static Future processImage(Map<String, dynamic> data) async {
    try {
      MultipartRequest request = MultipartRequest(
        "POST",
        Uri.parse(""),
      );
      var response = await request.send();
      // handle response
      if (response.statusCode == HttpStatus.ok) {
        return json.decode(await response.stream.bytesToString());
      } else {
        return json.decode(await response.stream.bytesToString());
      }
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
