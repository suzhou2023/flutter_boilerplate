import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../utils/loading.dart';
import '../utils/log.dart';
import '../utils/toast.dart';
import 'my_log_interceptor.dart';
import 'server_error.dart';
import 'server_reponse.dart';
import 'server_request.dart';

class HttpManager {
  static final HttpManager instance = HttpManager._privateConstructor();
  final _dio = Dio();

  HttpManager._privateConstructor() {
    setupInterceptiors();
  }

  setupInterceptiors() {
    _dio.interceptors.addAll([
      MyLogInterceptor(true),
    ]);
  }

  Future<ServerResponse<T>?> request<T>({
    required ServerRequest<T> request,
    BuildContext? context,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    PrograssCallback? onReceivedProgress,
  }) async {
    try {
      if (request.showLoading ?? false) {
        await showLoading();
      }
      final result = await _dio.request<dynamic>(
        request.url,
        queryParameters: request.queryParameters,
        data: request.httpData,
        options: request.options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceivedProgress,
      );
      final res = request.parseResponse(result.data);
      if (res.code == 10042) {
        /// add code
      } else if (res.code != 0) {
        throw ServerError(code: res.code, message: res.message);
      }
      return res;
    } on DioError catch (e) {
      Log.e('$e');
      switch (e.type) {
        case DioErrorType.cancel:
          toast('Dibatalkan');
          break;
        case DioErrorType.connectTimeout:
          toast('Waktu koneksi berakhir');
          break;
        default:
          break;
      }
      return null;
    } on ServerError {
      rethrow;
    } catch (e) {
      Log.e('$e');
      return null;
    } finally {
      if (request.showLoading ?? false) {
        await hideLoading();
      }
    }
  }
}
