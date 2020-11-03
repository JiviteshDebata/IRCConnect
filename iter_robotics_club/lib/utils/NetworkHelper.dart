import 'package:http/http.dart' as http;

// ignore: todo
//TODO All apis implemented here split to other dart files later

class NetworkHelper {
  final String baseUrl =
      // "https://api.weatherapi.com/v1/current.json?key=63b555c5f07647868f642959203009&q=";

  NetworkHelper();

  Future<http.Response> getApiData(String apiUrl) async {
    return await http.get(baseUrl + apiUrl);
  }

  Future<http.Response> postApiData(
      String apiUrl, Map<String, String> parameters) async {
    return await http.post(baseUrl + apiUrl, body: parameters);
  }
}
