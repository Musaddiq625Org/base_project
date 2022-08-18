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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final getIt = GetIt.I;

//test commit
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await _initRepos();
  _errorBuilder();
  // await EasyLocalization.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AppCubit(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  Locale? locale;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is LanguageState) {
          locale = state.locale;
        }
      },
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Starter Project',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: onGenerateRoute,
          locale: locale ?? const Locale('en'),
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ur', 'PK'),
          ],
          navigatorKey: navigationService.navigatorKey,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
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
