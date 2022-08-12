import 'package:base_project/main.dart';
import 'package:base_project/src/constants/http_constants.dart';
import 'package:base_project/src/constants/shared_preference_constants.dart';
import 'package:base_project/src/network/dio_api_services.dart';
import 'package:base_project/src/utils/logger_util.dart';
import 'package:base_project/src/utils/shared_preferences_util.dart';
import 'package:base_project/src/wrappers/token_res_wrapper.dart';
import 'package:dio/dio.dart';

class TokenRepository {
  final _sharedPreferencesService = getIt<SharedPreferencesUtil>();

  Future<TokenResWrapper> getTokenRepo({
    required String deviceId,
    required String platform,
    required String fcmToken,
    required String appVersion,
  }) async {
    final formData = FormData.fromMap({
      'device_id': deviceId,
      'platform': platform,
      'fcm_token': fcmToken,
      'app_version': appVersion,
    });
    LoggerUtil.logs('formData.fields: ${formData.fields}');
    final response = await getIt<DioApiServices>().postRequest(
      HttpConstants.token,
      data: formData,
    );
    return TokenResWrapper.fromJson(response);
  }

  Future<String?> get getToken async {
    return _sharedPreferencesService
        .getString(SharedPreferenceConstants.apiAuthToken);
  }
}
