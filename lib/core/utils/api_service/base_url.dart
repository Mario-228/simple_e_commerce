import 'package:dio/dio.dart';

abstract class BaseUrl {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/',
      receiveDataWhenStatusError: true,
    ),
  );
}
