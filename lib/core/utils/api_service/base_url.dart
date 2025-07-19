import 'package:dio/dio.dart';

abstract class BaseUrl {
  static final Dio products = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/',
      receiveDataWhenStatusError: true,
    ),
  );
}
