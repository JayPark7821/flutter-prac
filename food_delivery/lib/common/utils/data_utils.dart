import '../const/data.dart';

class DataUtils {
  static String pathToUrl(String value) {
    return 'http://$ip $value';
  }

  static List<String> listPathsToUrls(List urls) {
    return urls.map((e) => pathToUrl(e)).toList();
  }
}
