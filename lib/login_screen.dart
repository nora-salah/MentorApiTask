import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_api_task/cubit/login_cubit.dart';
import 'package:mentor_api_task/cubit/login_state.dart';

import 'custom_text_form_faild.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSucessState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text("Success", style: TextStyle(color: Colors.cyan))));
            } else if (state is LoginErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                state.errorMessage,
                style: TextStyle(color: Colors.cyan),
              )));
            }
          },
          builder: (context, state) {
            return Form(
              key: BlocProvider.of<LoginCubit>(context).loginInKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    CustomTextFormField(
                      controller: BlocProvider.of<LoginCubit>(context)
                          .loginEmailController,
                      label: "email",
                      icon2: Icons.email,
                      validate: (data) {
                        if (data!.isEmpty || !data.contains('@gmail.com')) {
                          return "pleaseEnterValidEmail";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      controller: BlocProvider.of<LoginCubit>(context)
                          .loginPasswordController,
                      passwordIsVisable: BlocProvider.of<LoginCubit>(context)
                          .isLoginPasswordsShowing,
                      label: "password",
                      validate: (data) {
                        if (data!.length < 10 || data.isEmpty) {
                          return "pleaseEnterValidPassword";
                        }

                        return null;
                      },
                      icon: BlocProvider.of<LoginCubit>(context).suffixIcon,
                      suffixIconOnPressed: () {
                        BlocProvider.of<LoginCubit>(context)
                            .changeLoginPasswordSuffixIcon();
                      },
                      icon2: Icons.lock,
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    SizedBox(
                      height: 67,
                    ),
                    state is LoginLoadingState
                        ? Center(
                            child: const CircularProgressIndicator(
                              color: Colors.cyan,
                            ),
                          )
                        : SizedBox(
                            height: 55,
                            width: 330,
                            child: ElevatedButton(
                                onPressed: () {
                                  context.read<LoginCubit>().signIn();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .cyan, // Set the background color to teal
                                ),
                                child: Text("Login"))),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
