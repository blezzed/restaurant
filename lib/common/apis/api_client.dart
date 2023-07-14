import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:restaurant/common/entities/entities.dart';
import 'package:restaurant/common/values/storage.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetConnect implements GetxService{
  static ApiClient get to => Get.find();
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeader;

  static final _baseUrl = dotenv.get('SERVER_HOST', fallback: 'http://10.0.2.2:8080');

  final http.Client _client = http.Client();

  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = TOKEN;
    _mainHeader = {
      'Content-type' : 'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
    };
  }

  Future<Response> getData(String uri,) async{
    try{
      Response  response = await get(uri);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> loginDB(String url, {required String email, required String password}) async {
    var content = {
      'email': email,
      'password': password,
    };

    try{
      Response response = await post(
          "$_baseUrl/$url",
          content
      );
      //print(response.body);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }

  }

  Future<Response> signupDB(String url, {required UserData userData, required String password,}) async {
    //final uri = Uri.parse('$_baseUrl/auth/login');
    var content = {
      'name': userData.name,
      'surname': userData.surname,
      'email': userData.email,
      'phone': userData.phone,
      'password': password,
    };

    try{
      Response response = await post(
          "$_baseUrl/$url",
          content
      );
      //print(response.body);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }

  }
}