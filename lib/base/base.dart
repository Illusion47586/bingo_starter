// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

// Project imports:
import 'dio.dart';
import 'logger.dart';

mixin Base<T> {
  final Logger log = getLogger(T.toString());

  void silentlyHandleError(Error err) {
    debugPrint('silently handling the following error: ');
    log.e(err);
  }

  void changeDioBaseOption(BaseOptions baseOptions) {
    RequestHelper.setBaseOptions = baseOptions;
  }

  final Future<dynamic> Function({
    required Uri uri,
    Options? options,
    void Function(int, int)? onReceiveProgress,
  }) getRequestUsingURI = RequestHelper.getRequest;

  final Future<dynamic> Function({
    required Uri uri,
    Options? options,
    CancelToken? cancelToken,
  }) deleteRequestUsingURI = RequestHelper.deleteRequest;

  final Future<dynamic> Function({
    required Uri uri,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) postRequestUsingURI = RequestHelper.postRequest;

  final Future<bool> Function({
    required String url,
    required String savePath,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError,
    String lengthHeader,
    dynamic data,
    Options? options,
  }) downloadImage = RequestHelper.downloadImage;
}
