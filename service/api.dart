import 'package:dio/dio.dart';
import "dart:convert";

Map<String, dynamic> data = {
  'users': [
    {
      "id": 1,
      "first_name": "Jean",
      "last_name": "Robert",
      "email": "jean.robert@esih.edu",
      "password": "@1234",
      "photo": "https://png.pngtree.com/png-clipart/20231019/original/pngtree-user-profile-avatar-png-image_13369988.png"
    },
    {
      "id": 2,
      "first_name": "ADM",
      "last_name": "Narcisse",
      "email": "adm.narcisse@esih.edu",
      "password": "@0000",
      "photo": "https://png.pngtree.com/png-clipart/20231019/original/pngtree-user-profile-avatar-png-image_13369988.png"
    }
  ],
};


class APIService {
  static final Dio _dio = Dio();

  static Future<dynamic> get(String url) async {
    final response = await _dio.get(url);

    if(response.statusCode == 200) {
      return json.decode(response.data);
    } else {
      print("gen erè");
    }
  }

  static Future<dynamic> post(String url, dynamic data) async {
    final response = await _dio.post(url, data: data);
    if(response.statusCode == 200) {
      return json.decode(response.data);
    } else {
      print("gen erè");
    }
    
  }
}
