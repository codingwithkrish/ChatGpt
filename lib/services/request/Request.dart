import 'dart:convert';

import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
      print(response.body);
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
    String url = "https://api.openai.com/v1/chat/completions";
    // var body = {
    //   "model": "text-davinci-003",
    //   "prompt": text,
    //   "max_tokens": 2048,
    //   "temperature": 0.4
    // };
    var body = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": text}
      ]
    };
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: headres, body: jsonEncode(body));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        Map data = jsonDecode(response.body);
        print(data);
        return data["choices"][0]["message"]["content"];
      } else {
        Map data = jsonDecode(response.body);
        return data["error"]["message"];
      }
    } catch (e) {
      return e;
    }
  }

  Future getcodecompletion(String text, int i) async {
    String url = "https://api.openai.com/v1/completions";
    var body = {
      "model": "text-davinci-003",
      "prompt": text,
      "temperature": 0,
      "max_tokens": 150,
      "top_p": 1.0,
      "frequency_penalty": 0.0,
      "presence_penalty": 0.0,
      "stop": ["\"\"\""]
    };
    if (i == 1) {
      body = {
        "model": "text-davinci-003",
        "prompt": "##### ${text} ### Fixed Python",
        "temperature": 0,
        "max_tokens": 182,
        "top_p": 1.0,
        "frequency_penalty": 0.0,
        "presence_penalty": 0.0,
        "stop": ["###"]
      };
    } else if (i == 2) {
      body = {
        "model": "text-davinci-003",
        "prompt": text,
        "temperature": 0,
        "max_tokens": 150,
        "top_p": 1.0,
        "frequency_penalty": 0.0,
        "presence_penalty": 0.0,
        "stop": ["###"]
      };
    } else if (i == 3) {
      body = {
        "model": "text-davinci-003",
        "prompt": text,
        "temperature": 0,
        "max_tokens": 64,
        "top_p": 1.0,
        "frequency_penalty": 0.0,
        "presence_penalty": 0.0,
        "stop": ["\n"]
      };
    }
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

  Future getavatar(String path) async {
    String url =
        "https://mojipop.p.rapidapi.com/api/FaceDetection/CreateAvatar";
    var headers = {
      "Content-Type": "multipart/form-data",
      "X-RapidAPI-Key": "741339f7f4mshe2d6368b5926105p1a217cjsndb813fa50a0f",
      "X-RapidAPI-Host": "mojipop.p.rapidapi.com"
    };
    // try {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );
    request.headers["Content-Type"] = "multipart/form-data";
    request.headers["X-RapidAPI-Key"] =
        "741339f7f4mshe2d6368b5926105p1a217cjsndb813fa50a0f";
    request.headers["X-RapidAPI-Host"] = "mojipop.p.rapidapi.com";
    request.files.add(
      await http.MultipartFile.fromPath(
        'photo',
        path,
      ),
    );
    request.fields['createIcon'] = "true";
    // request.fields['makeUpAssetID'] = "0831101080020002";

    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      String responseBody = await response.stream.bytesToString();
      Map json = jsonDecode(responseBody);
      print(json);
      return responseBody;
    } else {
      return Null;
    }
    // } catch (e) {
    return Null;
    // }
  }

  getcaricature(String avatarid, int gender) async {
    String url = "https://mojipop.p.rapidapi.com/api/Render/Caricature";
    String tempId = "00510010825091";
    if (gender == 1) {
      tempId = "00510010825091";
    } else if (gender == 2) {
      tempId = "00520010825111";
    }
    var body = {"AvatarID": avatarid, "TemplateID": tempId, "Quality": "100"};
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'X-RapidAPI-Key': "741339f7f4mshe2d6368b5926105p1a217cjsndb813fa50a0f",
      "X-RapidAPI-Host": "mojipop.p.rapidapi.com"
    };
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        return Null;
      }
    } catch (e) {
      print(e);
      return Null;
    }
  }
}
