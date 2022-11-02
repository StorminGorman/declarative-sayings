import 'dart:convert';

import 'package:declarative_sayings/saying.dart';
import 'package:http/http.dart';

const googleToken = 'XXXXXXXX';

class Language implements Saying {
  final Saying origin;
  final String code;

  Language(this.origin, this.code);

  @override
  Future<String> say() async {
    final client = Client();
    final response = await client.post(
        Uri.parse('https://translation.googleapis.com/language/translate/v2'),
        headers: {
          "Authorization": "Bearer $googleToken",
        },
        body: {
          "q": await origin.say(),
          "source": "en",
          "target": code,
          "format": "text"
        });
    final data = json.decode(response.body);
    return data['data']['translations'][0]['translatedText'] ??
        'error translating';
  }
}

class Spanish implements Saying {
  final Saying origin;
  Spanish(final Saying saying) : origin = Language(saying, 'es');
  @override
  Future<String> say() {
    return origin.say();
  }
}
