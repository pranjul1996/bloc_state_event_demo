import 'dart:convert';

import 'package:bloc_demo/user_model.dart';
import 'package:http/http.dart';

class UserRepository {
  String userUrl = 'https://reqres.in/api/users?page=1';

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['data'] as List;
      return result.map((e) => UserModel.fromJson(e)).toList();
    }else{
      throw Exception("Something went wrong!");
    }
  }
}
