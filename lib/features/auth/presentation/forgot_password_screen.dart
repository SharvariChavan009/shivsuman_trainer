import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/common/widgets/c_button.dart';
import 'package:car_trainer_application/core/common/widgets/c_text.dart';
import 'package:car_trainer_application/core/common/widgets/c_text_field.dart';

import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/features/auth/presentation/otp_screen.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController mobileController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
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
              child: Container(
               child: Column(
                children: [

                     Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child:  CustomTextField(
                                      hintText: "Enter your phoneNumber",
                                        controller: mobileController)
                )),
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
                    text: "mobile Error",
                    textColor: Colors.red,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25.0),
              child: GestureDetector(
                child: CommonButton(buttonName: "Send OTP"),
                onTap: () {
                  NavigationHelper.navigateTo(context, OtpScreen());
                },
              ),
            ),

                ],
               ),
              ),
            ),
         
          ],
        ),
      ),
    );
  }
}
