import 'package:car_trainer_application/core/common/colors.dart';
import 'package:car_trainer_application/core/common/cubits/confirm_password/confirmpassword_cubit.dart';
import 'package:car_trainer_application/core/common/cubits/password_validation/login_cubit.dart';
import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/common/u_validations_all.dart';
import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/common/widgets/c_button.dart';
import 'package:car_trainer_application/core/common/widgets/c_text_field.dart';
import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/features/auth/cubit/reset_password/reset_password_cubit.dart';
import 'package:car_trainer_application/features/auth/presentation/login_screen.dart';
import 'package:car_trainer_application/features/home/change_password/cubit/change_password/change_password_cubit.dart';
import 'package:car_trainer_application/features/home/change_password/cubit/old_password_validation/old_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();

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
        centerTitle: true,
        title: const Text(
          "Change password",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1,
              fontFamily: "Poppins"),
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: const Icon(
            Icons.turn_left,
            size: 35,
            color: AppColors.darkColor,
          ),
          onTap: () {
            NavigationHelper.goBack(context);
          },
        ),
      ),
      body: BlocListener<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccessState) {
            NavigationHelper.navigateAndRemoveUntil(context, LoginScreen());
          }
          if (state is ChangePasswordErrorState) {
            showErrorSnackbar("Failed to change");
          }
          if (state is ChangePasswordLoadingState) {
            const Center(
              child: CircularProgressIndicator(
                color: AppColors.buttonColorNew,
              ),
            );
          }
        },
        child: Column(
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
                      // Old password field

                      BlocBuilder<OldPasswordCubit, OldPasswordState>(
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
                                            hintText: "Old password",
                                            controller: oldPasswordController,
                                            borderColor:
                                                (state is OldPasswordErrorState
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
                                        visible: state is OldPasswordErrorState,
                                        child: (state is OldPasswordErrorState)
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
                                height: 20,
                              ),
                            ],
                          );
                        },
                      ),

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
                                            borderColor:
                                                (state is ConfirmpassErrorState
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
                                        visible: state is ConfirmpassErrorState,
                                        child: (state is ConfirmpassErrorState)
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
                          child: CommonButton(buttonName: "Change password"),
                          onTap: () {
                            BlocProvider.of<OldPasswordCubit>(context)
                                .oldPasswordlidationFunction(
                                    oldPasswordController.text);

                            BlocProvider.of<PasswordCubit>(context)
                                .Loginvalidation(passwordController.text);

                            BlocProvider.of<ConfirmpasswordCubit>(context)
                                .ConfirmPassFunction(passwordController.text,
                                    confirmPasswordController.text);

                            if ((ValidationsAll.isValidPassword(
                                    confirmPasswordController.text)) &&
                                (passwordController.text ==
                                    confirmPasswordController.text) &&
                                (ValidationsAll.isValidPassword(
                                    oldPasswordController.text))) {
                              BlocProvider.of<ChangePasswordCubit>(context)
                                  .changePasswordFunction(
                                      oldPasswordController.text,
                                      passwordController.text,
                                      confirmPasswordController.text);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
