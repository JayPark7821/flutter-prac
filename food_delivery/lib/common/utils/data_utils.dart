import 'dart:convert';

import '../const/data.dart';

class DataUtils {
  static String pathToUrl(String value) {
    return 'http://$ip $value';
  }

  static List<String> listPathsToUrls(List urls) {
    return urls.map((e) => pathToUrl(e)).toList();
  }

  static String plainToBase64(String plain) {
    return base64.encode(utf8.encode(plain));
  }

  static DateTime stringToDateTime(String value) {
    return DateTime.parse(value);
  }
}
