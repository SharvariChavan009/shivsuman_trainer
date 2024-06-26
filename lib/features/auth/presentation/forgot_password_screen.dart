import 'package:car_trainer_application/core/common/colors.dart';
import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/common/validation_variables.dart';
import 'package:car_trainer_application/core/common/widgets/c_button.dart';
import 'package:car_trainer_application/core/common/widgets/c_text.dart';
import 'package:car_trainer_application/core/common/widgets/c_text_field.dart';
import 'package:car_trainer_application/core/common/u_validations_all.dart';

import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/core/common/cubits/email_validation/email_cubit.dart';
import 'package:car_trainer_application/features/auth/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:car_trainer_application/features/auth/presentation/login_screen.dart';
import 'package:car_trainer_application/features/auth/presentation/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_trainer_application/core/common/validation_variables.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ValidationAllVariables.emailVariable = emailController.text;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordErrorState) {
              final snackBar = SnackBar(
                content: Text(
                  "Please enter valid email",
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is ForgotPasswordSuccessState) {
              NavigationHelper.navigateAndRemoveUntil(context, OtpScreen());
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
                  child: Container(
                    child: BlocBuilder<EmailCubit, EmailState>(
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
                                          inputType: CustomTextInputType.email,
                                          hintText: "Enter your email",
                                          controller: emailController,
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 25.0),
                              child: GestureDetector(
                                child: CommonButton(buttonName: "Send OTP"),
                                onTap: () async {
                                  BlocProvider.of<EmailCubit>(context)
                                      .Loginvalidation1(emailController.text);

                                  if (ValidationsAll.isValidEmail(
                                      emailController.text)) {
                                    BlocProvider.of<ForgotPasswordCubit>(
                                            context)
                                        .forgotPasswordFunction(
                                            emailController.text);

                                    var emailBox =
                                        await Hive.openBox("emailBox");
                                    emailBox.put(
                                        "emailData", emailController.text);
                                  }
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
