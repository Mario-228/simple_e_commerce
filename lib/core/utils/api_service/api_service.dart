import 'package:dio/dio.dart';

class ApiService {
  final Dio dioHelper;
  ApiService({required this.dioHelper});
  Future<Map<String, dynamic>> get(String endPoint) async {
    var response = await dioHelper.get(
      endPoint,
      options: Options(contentType: Headers.contentTypeHeader),
    );
    return response.data;
  }
}
