import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:userprofile/model/user_model.dart';

class ServiceUserList {
  static Future<UserModel?> getAllUserList() async {
  
    try {
      var request = http.Request('GET', Uri.parse('https://reqres.in/api/users'));
       http.StreamedResponse response = await request.send();


      if (response.statusCode == 200) {
        String resp = await response.stream.bytesToString();

        final UserModel userList = userModelFromJson(resp);

       

        return userList;
      }
    } catch (e) {
      //throw Exception("error");
    }
    return null;
  }
}
