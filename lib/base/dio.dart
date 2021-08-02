// Package imports:
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RequestHelper {
  static Dio dio = Dio(BaseOptions(connectTimeout: 10000))
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        request: false,
        requestBody: true,
        responseBody: false,
        compact: false,
      ),
    );

  static set setBaseOptions(BaseOptions baseOptions) =>
      dio.options = baseOptions;

  static Future<dynamic> getRequest({
    required Uri uri,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await dio.getUri(uri);
    try {
      if (response.statusCode == 200) {
        return response.data;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> postRequest({
    required Uri uri,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await dio.postUri(
      uri,
      data: data,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    try {
      if (response.statusCode == 200) {
        return response.data;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> downloadImage({
    required String url,
    required String savePath,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    dynamic data,
    Options? options,
  }) async {
    final response = await dio.download(
      url,
      savePath,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      deleteOnError: deleteOnError,
      lengthHeader: lengthHeader,
      data: data,
      options: options,
    );
    try {
      if (response.statusCode == 200) {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }
}
