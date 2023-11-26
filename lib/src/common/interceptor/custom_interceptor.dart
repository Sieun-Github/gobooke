import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Naver-Client-id'] = 'O_ndctwbE9dHymBPm8Zx';
    options.headers['X-Naver-Client-Secret'] = 'bs59rfhluQ';
    super.onRequest(options, handler);
  }
}
