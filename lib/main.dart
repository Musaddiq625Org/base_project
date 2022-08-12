import 'package:base_project/components/main_scaffold_component.dart';
import 'package:base_project/generated_route.dart';
import 'package:base_project/src/app_cubit/app_cubit.dart';
import 'package:base_project/src/constants/color_constants.dart';
import 'package:base_project/src/constants/font_styles_constants.dart';
import 'package:base_project/src/constants/route_constants.dart';
import 'package:base_project/components/text_component.dart';
import 'package:base_project/src/network/dio_api_services.dart';
import 'package:base_project/src/network/dio_client_network.dart';
import 'package:base_project/src/repositories/token_repository.dart';
import 'package:base_project/src/services/navigation_service.dart';
import 'package:base_project/src/services/translation_srevice.dart';
import 'package:base_project/src/utils/shared_preferences_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await _initRepos();
  _errorBuilder();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    path: 'assets/translations',
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ur', 'PK'),
    ],
    fallbackLocale: const Locale('en', 'US'),
    child: MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => AppCubit(),
      ),
    ], child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Starter Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: onGenerateRoute,
      locale: const Locale('en'),
      supportedLocales: const [
        Locale('en'),
        Locale('ur'),
      ],
      navigatorKey: navigationService.navigatorKey,
      localizationsDelegates: context.localizationDelegates,
    );
  }
}

void _errorBuilder() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScaffold(
        bgColor: ColorConstants.lightGrey,
        widget: Center(
          child: TextComponent(
            'Error: ${details.exception}',
            maxLines: 50,
            style: FontStylesConstants.subtitleTwo(
              color: ColorConstants.red,
            ),
          ),
        ),
      ),
    );
  };
}

late NavigationService navigationService;
Future<void> _initRepos() async {
  navigationService = NavigationService();
  getIt
    ..registerSingleton(SharedPreferencesUtil())
    ..registerSingleton(DioClientNetwork())
    ..registerSingleton(TokenRepository())
    ..registerSingleton(TranslationService())
    ..registerSingleton(
      DioApiServices(
        onAPIErrorDetection: () async {
          await navigationService.navigateTo(
            RouteConstants.loginSelectionScreen,
          );
        },
      ),
    );
}
