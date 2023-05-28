import 'package:get/get.dart';
import 'package:restaurant/common/values/storage.dart';

class ApiClient extends GetConnect implements GetxService{
  static ApiClient get to => Get.find();
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeader;

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
}