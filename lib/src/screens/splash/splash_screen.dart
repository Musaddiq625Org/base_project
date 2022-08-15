import 'dart:developer';

import 'package:base_project/main.dart';
import 'package:base_project/src/app_cubit/app_cubit.dart';
import 'package:base_project/src/constants/string_constants.dart';
import 'package:base_project/src/services/translation_srevice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConstants.loginExpired,
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(StringConstants.loginExpired),
          ),
          ElevatedButton(
            child: const Text('Urdu'),
            onPressed: () async {
              getIt<TranslationService>().locale = 'ur';
              context.read<AppCubit>().changeLanguage(const Locale('ur'));
              setState(() {});
            },
          ),
          ElevatedButton(
            child: const Text('English'),
            onPressed: () async {
              getIt<TranslationService>().locale = 'en';
              context.read<AppCubit>().changeLanguage(const Locale('en'));
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
