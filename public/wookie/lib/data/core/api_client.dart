import 'dart:convert';

import 'package:http/http.dart';
import 'package:wookie/data/core/api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);
  dynamic get() async {
    final Response response = await _client.get('${ApiConstants.BASE_URL}',
        headers: {'Authorization': ApiConstants.AUTHORIZATION});
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
