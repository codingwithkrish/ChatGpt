import 'dart:convert';

import 'package:http/http.dart' as http;

class Request {
  var headres = {
    "Content-Type": "application/json",
    "Authorization":
        "Bearer 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"
  };
  getrequest(String url, Map<String, dynamic> data) async {
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: headres, body: jsonEncode(data));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        Map data = jsonDecode(response.body);
        return data["data"];
      } else {
        Map data = jsonDecode(response.body);
        return data["error"]["message"];
      }
    } catch (e) {
      return e;
    }
  }

  Future gettextcompletion(String text) async {
    String url = "https://api.openai.com/v1/completions";
    var body = {
      "model": "text-davinci-003",
      "prompt": text,
      "max_tokens": 2048,
      "temperature": 0.4
    };
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: headres, body: jsonEncode(body));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        Map data = jsonDecode(response.body);
        print(data);
        return data["choices"][0]["text"];
      } else {
        Map data = jsonDecode(response.body);
        return data["error"]["message"];
      }
    } catch (e) {
      return e;
    }
  }

  Future getcodecompletion(String text) async {
    String url = "https://api.openai.com/v1/completions";
    var body = {
      "model": "code-cushman-001",
      "prompt": text,
      "max_tokens": 2000,
      "temperature": 0.4
    };
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: headres, body: jsonEncode(body));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        Map data = jsonDecode(response.body);
        print(data);
        return data["choices"][0]["text"];
      } else {
        Map data = jsonDecode(response.body);
        return data["error"]["message"];
      }
    } catch (e) {
      return e;
    }
  }
}
