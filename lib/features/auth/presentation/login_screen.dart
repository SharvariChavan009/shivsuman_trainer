import 'package:car_trainer_application/core/common/colors.dart';
import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/common/widgets/c_button.dart';
import 'package:car_trainer_application/core/common/widgets/c_text.dart';
import 'package:car_trainer_application/core/common/widgets/c_text_field.dart';

import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/features/auth/bloc/menu_selection/menu_name_bloc.dart';
import 'package:car_trainer_application/features/auth/bloc/menu_selection/menu_name_state.dart';
import 'package:car_trainer_application/features/auth/presentation/forgot_password_screen.dart';
import 'package:car_trainer_application/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Login",
            style: TextStyle(
                fontSize: 18,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          centerTitle: true,
        ),
        body: Column(
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
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25),
                                child: CustomTextField(
                                  hintText: "Enter your phoneNumber",
                                  controller: phoneController,
                                  inputType: CustomTextInputType.number,
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
                          padding: const EdgeInsets.only(right: 25, left: 25),
                          child: CommomText(
                            text: "phone Error",
                            textColor: Colors.red,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25),
                                child: CustomTextField(
                                    hintText: "Enter your password",
                                    inputType: CustomTextInputType.password,
                                    controller: passwordController))),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 25, left: 25),
                          child: CommomText(
                            text: "Password Error",
                            textColor: Colors.red,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25.0),
                      child: GestureDetector(
                        child: CommonButton(buttonName: "Log in"),
                        onTap: () {
                          NavigationHelper.navigateAndRemoveUntil(
                              context, HomeScreen());
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
                                  context, ForgotPasswordScreen());
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ))),
          ],
        ));
  }
}

// Widget LoginColumn(BuildContext context) {
//   return Column(
//     children: [
//       Row(
//         children: [
//           Expanded(
//               child: Padding(
//                   padding: const EdgeInsets.only(left: 25.0, right: 25),
//                   child: CustomTextField(
//                     hintText: "Enter your phoneNumber",
//                     controller: phoneController,
//                     inputType: CustomTextInputType.number,
//                   ))),
//         ],
//       ),
//       const SizedBox(
//         height: 2,
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 25, left: 25),
//             child: CommomText(
//               text: "phone Error",
//               textColor: Colors.red,
//             ),
//           )
//         ],
//       ),
//       const SizedBox(
//         height: 20,
//       ),
//       Row(
//         children: [
//           Expanded(
//               child: Padding(
//                   padding: const EdgeInsets.only(left: 25.0, right: 25),
//                   child: CustomTextField(
//                       hintText: "Enter your password",
//                       inputType: CustomTextInputType.password,
//                       controller: passwordController))),
//         ],
//       ),
//       const SizedBox(
//         height: 2,
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 25, left: 25),
//             child: CommomText(
//               text: "Password Error",
//               textColor: Colors.red,
//             ),
//           )
//         ],
//       ),
//       const SizedBox(
//         height: 25,
//       ),
//       Padding(
//         padding: const EdgeInsets.only(left: 25, right: 25.0),
//         child: GestureDetector(
//           child: CommonButton(buttonName: "Log in"),
//           onTap: () {
//             NavigationHelper.navigateAndRemoveUntil(context, HomeScreen());
//           },
//         ),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 25, left: 25),
//             child: GestureDetector(
//               child: CommomText(
//                 text: "Forgot password?",
//                 textColor: AppColors.buttonColorNew,
//               ),
//               onTap: () {
//                 NavigationHelper.navigateTo(context, ForgotPasswordScreen());
//               },
//             ),
//           )
//         ],
//       )
//     ],
//   );
// }
