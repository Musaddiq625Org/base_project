import 'dart:io';
import 'package:base_project/main.dart';
import 'package:base_project/src/constants/app_constants.dart';
import 'package:base_project/src/constants/http_constants.dart';
import 'package:base_project/src/constants/shared_preference_constants.dart';
import 'package:base_project/src/network/dio_api_services.dart';
import 'package:base_project/src/utils/logger_util.dart';
import 'package:base_project/src/utils/shared_preferences_util.dart';
import 'package:dio/dio.dart';


class DioClientNetwork {
  late Dio dio;

  String? getAuthToken() {
    return getIt<DioApiServices>().authToken;
  }

  Future<void> initializeDioClientNetwork({
    String? token,
    int locale = 1,
    String? userId = '0',
    bool deleteToken = false,
  }) async {
    LoggerUtil.logs('initializeDioClientNetwork11 $token');
    dio = Dio();
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    );
    // locale - 1 = english, 2 = urdu
    dio.options = setBaseOptions()
      ..headers['Authorization'] = token
      ..headers['locale'] = locale
      ..headers['platform'] = Platform.isIOS
          ? AppConstants.iosPlatform
          : AppConstants.androidPlatform
      ..headers['user-id'] = userId;
    if (deleteToken) {
      await getIt<SharedPreferencesUtil>()
          .removeValue(SharedPreferenceConstants.apiAuthToken);
      getIt<DioApiServices>().authToken = null;
      dio.options.headers['Authorization'] = null;
      LoggerUtil.logs('token deleted');
    } else {
      LoggerUtil.logs('initializeDioClientNetwork token: $token');
      if (token != null) {
        /// Save new token in shared pref
        await getIt<SharedPreferencesUtil>().setString(
          SharedPreferenceConstants.apiAuthToken,
          token,
        );

        /// Save token in Dio class
        getIt<DioApiServices>().authToken = token;
        dio.options.headers['Authorization'] = token;
        LoggerUtil.logs('New token: $token');
      } else {
        /// Get token from shared pref
        final _oldToken = await getIt<SharedPreferencesUtil>()
            .getString(SharedPreferenceConstants.apiAuthToken);
        LoggerUtil.logs('SharedPreferenceConstants.apiAuthToken: $_oldToken');
        if (_oldToken != '') {
          /// Save token in Dio class
          getIt<DioApiServices>().authToken = _oldToken;
          dio.options.headers['Authorization'] = _oldToken;
        }
      }
    }

    LoggerUtil.logs('headers: ${dio.options.headers}');
  }

  BaseOptions setBaseOptions() {
    return BaseOptions(
      connectTimeout: 300000,
      baseUrl: HttpConstants.base,
    );
  }

  dynamic requestInterceptor(RequestOptions options) async {
    if (getAuthToken() == null) {
      final _token = await getIt<SharedPreferencesUtil>()
          .getString(SharedPreferenceConstants.apiAuthToken);
      if (_token != null) {
        getIt<DioApiServices>().authToken = _token;
        // dio.options.headers[WebHeadersEnum.token] =
        //     getIt<DioApiServices>().authToken = _token;
      } else {}
      return options;
    }
  }

  dynamic responseInterceptor(Response options) async {
    return options;
  }

  dynamic errorInterceptor(DioError dioError) async {
    if (dioError.message.contains('ERROR_001')) {
      // this will push a new route and remove all the routes that were present
      // navigatorKey.currentState.pushNamedAndRemoveUntil(
      //     "/login", (Route<dynamic> route) => false);
    } else if (dioError.response!.statusCode == 403) {}
    return dioError;
  }
}
