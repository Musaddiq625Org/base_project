part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class LanguageState extends AppState {
  Locale locale = Locale('en');
  LanguageState(this.locale);
}
