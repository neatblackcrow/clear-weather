import 'package:http/http.dart' as http;

class WeatherClient extends http.BaseClient {
  final String _appId = ''; // Put your API key here.
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5/';
  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    Map<String, String> redirectedQuery = {'appid': _appId};
    redirectedQuery.addAll(request.url.queryParameters);
    var redirectedRequest = http.Request(
        request.method, request.url.replace(queryParameters: redirectedQuery));
    return _inner.send(redirectedRequest);
  }

  @override
  void close() => _inner.close();

  Future<http.Response> fetchCurrentWeather(String cityName, String units) =>
      get(Uri.parse('$_baseUrl/weather?q=$cityName&units=$units'));
}
