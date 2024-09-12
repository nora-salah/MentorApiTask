import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_api_task/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  GlobalKey<FormState> loginInKey = GlobalKey<FormState>();

  bool isLoginPasswordsShowing = true;
  IconData suffixIcon = Icons.visibility;

  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordsShowing = !isLoginPasswordsShowing;
    suffixIcon =
        isLoginPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeLoginPasswordSuffixIcon());
  }

  signIn() async {
    try {
      //nora88n3@gmail.com
      //anas123
      // for try

      emit(LoginLoadingState());
      final response = await Dio()
          .post("https://food-api-omega.vercel.app/api/v1/user/signin", data: {
        "email": loginEmailController.text,
        "password": loginPasswordController.text,
      });
      emit(LoginSucessState());
      print(response);
    } catch (e) {
      emit(LoginErrorState(errorMessage: e.toString()));
      print(e.toString());
    }
  }
}
