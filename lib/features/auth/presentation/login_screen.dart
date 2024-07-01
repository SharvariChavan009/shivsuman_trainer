import 'package:car_trainer_application/core/common/colors.dart';
import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/common/u_validations_all.dart';
import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/common/widgets/c_button.dart';
import 'package:car_trainer_application/core/common/widgets/c_text.dart';
import 'package:car_trainer_application/core/common/widgets/c_text_field.dart';

import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/features/auth/cubit/CheckEmailPassword/check_email_pass_cubit.dart';
import 'package:car_trainer_application/features/auth/bloc/menu_selection/menu_name_bloc.dart';
import 'package:car_trainer_application/features/auth/bloc/menu_selection/menu_name_state.dart';
import 'package:car_trainer_application/core/common/cubits/email_validation/email_cubit.dart';
import 'package:car_trainer_application/core/common/cubits/password_validation/login_cubit.dart';
import 'package:car_trainer_application/features/auth/presentation/forgot_password_screen.dart';
import 'package:car_trainer_application/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void showErrorSnackbar(String msg) {
    final snackBar = SnackBar(
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Login",
            style: TextStyle(
                fontSize: 18,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          centerTitle: true,
        ),
        body: BlocListener<CheckEmailPassCubit, CheckEmailPassState>(
          listener: (context, state) {
            if (state is LoadingState) {
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.buttonColorNew,
                ),
              );
            }

            if (state is LoginFailedfulState) {
              showErrorSnackbar("Login Failed");
            }
            if (state is LoginSuccessfulState) {
              // NavigationHelper.navigateAndRemoveUntil(
              //     context, const HomeScreen());
            }
          },
          child: Column(
            children: [
              //! Container 1
              Expanded(
                flex: 5,
                child: Center(
                  child: SizedBox(
                    height: ScreenDimension.screenHeight * 0.34,
                    child: Image.asset(
                      AppImages.loginscreenLogo,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              //! Container 2

              Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      //* Email Field

                      BlocBuilder<EmailCubit, EmailState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25.0, right: 25),
                                          child: CustomTextField(
                                            hintText: "Enter your email",
                                            controller: emailController,
                                            inputType:
                                                CustomTextInputType.email,
                                            borderColor:
                                                (state is EmailValidatorState
                                                    ? Colors.red
                                                    : AppColors.buttonColorNew
                                                        .withOpacity(0.2)),
                                          ))),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 25, left: 25),
                                    child: Visibility(
                                        visible: state is EmailValidatorState,
                                        child: (state is EmailValidatorState)
                                            ? Text(
                                                state.errorMessage2,
                                                style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 12),
                                              )
                                            : const Text("")),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        },
                      ),

                      //* password Field

                      BlocBuilder<PasswordCubit, PasswordState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25.0, right: 25),
                                          child: CustomTextField(
                                            hintText: "Enter your password",
                                            inputType:
                                                CustomTextInputType.password,
                                            controller: passwordController,
                                            borderColor: (state is ErrorState1
                                                ? Colors.red
                                                : AppColors.buttonColorNew
                                                    .withOpacity(0.2)),
                                          ))),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 25, left: 25),
                                    child: Visibility(
                                        visible: state is ErrorState1,
                                        child: (state is ErrorState1)
                                            ? Text(
                                                state.errorMessage2,
                                                style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 12),
                                              )
                                            : const Text("")),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          );
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25.0),
                        child: GestureDetector(
                          child: CommonButton(buttonName: "Log in"),
                          onTap: () {
                            // NavigationHelper.navigateAndRemoveUntil(
                            //     context, const HomeScreen());

                            BlocProvider.of<EmailCubit>(context)
                                .Loginvalidation1(emailController.text);
                            BlocProvider.of<PasswordCubit>(context)
                                .Loginvalidation(passwordController.text);

                            if (ValidationsAll.isValidEmail(
                                    emailController.text) &&
                                ValidationsAll.isValidPassword(
                                    passwordController.text)) {

                              BlocProvider.of<CheckEmailPassCubit>(context)
                                  .Loginvalidation3(emailController.text,
                                      passwordController.text);
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 25, left: 25),
                            child: GestureDetector(
                              child: CommomText(
                                text: "Forgot password?",
                                textColor: AppColors.buttonColorNew,
                              ),
                              onTap: () {
                                NavigationHelper.navigateTo(
                                    context, const ForgotPasswordScreen());
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ))),
            ],
          ),
        ));
  }
}
