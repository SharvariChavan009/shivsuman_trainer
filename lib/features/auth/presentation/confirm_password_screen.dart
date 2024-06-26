import 'package:car_trainer_application/core/common/colors.dart';
import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/common/validation_variables.dart';
import 'package:car_trainer_application/core/common/widgets/c_button.dart';
import 'package:car_trainer_application/core/common/widgets/c_text.dart';
import 'package:car_trainer_application/core/common/u_validations_all.dart';

import 'package:car_trainer_application/core/common/widgets/c_text_field.dart';
import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/core/common/cubits/confirm_password/confirmpassword_cubit.dart';
import 'package:car_trainer_application/core/common/cubits/password_validation/login_cubit.dart';
import 'package:car_trainer_application/features/auth/cubit/reset_password/reset_password_cubit.dart';

import 'package:car_trainer_application/features/auth/presentation/login_screen.dart';
import 'package:car_trainer_application/features/home/settings/presentation/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  const ConfirmPasswordScreen({super.key});

  @override
  State<ConfirmPasswordScreen> createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Forgot Password",
          style: TextStyle(
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          print(state);
          if (state is ResetPasswordLoadingState) {
            const Center(
              child: CircularProgressIndicator(
                color: AppColors.buttonColorNew,
              ),
            );
          }
          if (state is ResetPasswordErrorState) {
            print(state);

            final snackBar = SnackBar(
              content: Text(
                "Please enter valid password",
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }

          if (state is ResetPasswordSuccessState) {
            print(state);

            NavigationHelper.navigateAndRemoveUntil(context, LoginScreen());
          }
        },
        builder: (context, state) {
          return Column(
            children: [
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
              Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Password field
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
                                              inputType:
                                                  CustomTextInputType.password,
                                              hintText: "New password",
                                              controller: passwordController,
                                              borderColor: (state is ErrorState1
                                                  ? Colors.red
                                                  : AppColors.buttonColorNew
                                                      .withOpacity(0.2)),
                                            ))),
                                  ],
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
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12),
                                                )
                                              : Text("")),
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
                        const SizedBox(
                          height: 2,
                        ),

                        // Confirm password field

                        BlocBuilder<ConfirmpasswordCubit, ConfirmpasswordState>(
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
                                              inputType:
                                                  CustomTextInputType.password,
                                              hintText: "Confirm password",
                                              controller:
                                                  confirmPasswordController,
                                              borderColor: (state
                                                      is ConfirmpassErrorState
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
                                          visible:
                                              state is ConfirmpassErrorState,
                                          child:
                                              (state is ConfirmpassErrorState)
                                                  ? Text(
                                                      state.errorMessage,
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    )
                                                  : Text("")),
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
                            child: CommonButton(buttonName: "CONTINUE"),
                            onTap: () {
                              BlocProvider.of<PasswordCubit>(context)
                                  .Loginvalidation(passwordController.text);

                              BlocProvider.of<ConfirmpasswordCubit>(context)
                                  .ConfirmPassFunction(passwordController.text,
                                      confirmPasswordController.text);

                              if ((ValidationsAll.isValidPassword(
                                      confirmPasswordController.text)) &&
                                  (passwordController.text ==
                                      confirmPasswordController.text)) {
                                BlocProvider.of<ResetPasswordCubit>(context)
                                    .resetFunction(passwordController.text,
                                        confirmPasswordController.text);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}
