import 'package:base_project/src/screens/login/login_interface.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> implements LoginInterface{
  LoginCubit() : super(LoginInitial());
}
