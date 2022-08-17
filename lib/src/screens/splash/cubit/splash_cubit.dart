import 'package:base_project/src/screens/splash/splash_interface.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> implements SplashInterface{
  SplashCubit() : super(SplashInitial());
}
