 import 'dart:convert';
 import 'package:http/http.dart' as http;

 class User {
   String id;
   String email;
   String firstName;
   String lastName;
   String avatar;

   User({this.id, this.email, this.firstName, this.lastName, this.avatar});

   factory User.createUser(Map<String, dynamic> object) {
     return User(
       id: object["id"].toString(),
       email: object["email"].toString(),
       firstName: object["first_name"].toString(),
       lastName: object["last_name"].toString(),
       avatar: object["avatar"].toString(),
     ); 
   }

   static Future<User> getUserFromApi(int id) async {
      String apiUrl = "https://reqres.in/api/users/" + id.toString();

      var apiResult = await http.get(apiUrl);
      var jsonObject = json.decode(apiResult.body);
      var userData = (jsonObject as Map<String, dynamic>)['data'];

      return User.createUser(userData);
   }
 }

 class UninitializedUser extends User{} //pakai di block nanti