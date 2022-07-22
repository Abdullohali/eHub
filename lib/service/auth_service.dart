import 'dart:convert';

import 'package:ehub/models/cities_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class EHubRegisterService {
  final String baseUrl = 'https://e-hub.uz/api/v1';

  Future signup({required String phone}) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$baseUrl/api-auth/send_sms/'));
    request.fields.addAll({
      'phone_number': "+998${int.parse(phone)}",
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = await response.stream.bytesToString();
      print("Kerakli ------------------ " + data.toString());

      return jsonDecode(data);
    } else {
      return null;
    }
  }

  Future smsConfirmation({required String sms}) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$baseUrl/api-auth/register/'));
    request.fields.addAll({
      'code': sms,
    });

    http.StreamedResponse response = await request.send();

    print(response.toString());

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = await response.stream.bytesToString();
      await Hive.box('user').put('token', jsonDecode(data)["token"]);
      await Hive.box('user').put('userId', jsonDecode(data)["user"]['user_id']);
      return jsonDecode(data);
    } else {
      return null;
    }
  }

  Future<List<Citiyes>?> cityService() async {
    try {
      var response = await http.get(
        Uri.parse("$baseUrl/question/get/"),
      );
      if (response.statusCode == 200) {
        print("body" + response.body.toString());
        List<Citiyes> data = (jsonDecode(response.body) as List)
            .map(
              (e) => Citiyes.fromJson(e),
            )
            .toList();
        print(data.toString());
        return data;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      // return e;
    }
  }

  Future registerService({
    required String name,
    required String surname,
    required String date,
    required String gender,
    required List variants,
  }) async {
    String encoded = jsonEncode(variants);
    var userId = await Hive.box('user').get('userId');
    print(userId.toString());
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/course/post_user_info/'));
    request.fields.addAll({
      "id": userId.toString(),
      "first_name": name.toString(),
      "last_name": surname.toString(),
      "gender": gender,
      "birth_date": date,
      // "variants": variants.toString(),
      // "job_location": [25.1548561, 23.4578541].toString(),
      // "home_location": [25.1548561, 23.4578541].toString()
    });
    request.headers['Authorization'] = await Hive.box('user').get('token');

    print("date $date ");

    http.StreamedResponse response = await request.send();

    print("statusc" + response.statusCode.toString());

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = await response.stream.bytesToString();
      print("statuscode " + response.statusCode.toString());
      print("date post" + data.toString());
      return jsonDecode(data);
    } else {
      return null;
    }
  }
}
