import 'dart:async';
import 'dart:ffi';
import 'package:car_trainer_application/core/common/colors.dart';
import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/common/widgets/c_button.dart';
import 'package:car_trainer_application/core/common/widgets/c_text.dart';
import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/features/auth/cubit/verify_otp/verify_otp_cubit.dart';
import 'package:car_trainer_application/features/auth/presentation/confirm_password_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String varificationNumber = '';

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  String code = '';
  late Timer _timer;
  int _start = 45;
  bool isLoading = false;
  bool isResendAgain = false;
  bool isVerfied = false;
  bool isContinueButtonEnabled = false;
  late String _email;

  void resend() {
    setState(() {
      pinController.clear(); // Clear the OTP
      isResendAgain = true;
      isContinueButtonEnabled = false;
    });
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (mounted) {
        setState(() {
          if (_start == 0) {
            _start = 45;
            isResendAgain = false;
            timer.cancel();
            if (!isVerfied) {
              _showTimeoutPopup(context);
            }
          } else {
            _start--;
          }
        });
      }
    });
  }

  Future<void> _showTimeoutPopup(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
          ),
          child: Container(
            width: 430,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 25, left: 25),
                            child: CommomText(
                              text: "OTP Expired",
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: AppColors.primaryColor,
                  ), // Adjust the vertical spacing

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 2, left: 2),
                        child: Expanded(
                          child: Row(
                            children: [
                              CommomText(
                                text: "The verification has been expired",
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 20), // Adjust the vertical spacing

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                              AppColors.buttonColorNew,
                            ),
                            shape: WidgetStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 25, left: 25),
                                  child: CommomText(
                                    textColor: Colors.white,
                                    text: "OK",
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {

    super.initState();
    resend();
    pinController.addListener(() {
      setState(() {
        isContinueButtonEnabled = pinController.text.isNotEmpty;
      });
    });
  }

  verify() {
    setState(() {
      isLoading = true;
    });
    const oneSec = Duration(milliseconds: 10000);
    _timer = Timer.periodic(oneSec, (timer) {
      if (mounted) {
        setState(() {
          isLoading = false;
          isVerfied = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RichText text;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Verification",
          style: TextStyle(
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocListener<VerifyOtpCubit, VerifyOtpState>(
          listener: (context, state) {
            if (state is VerifyOTPLoadingState) {
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.buttonColorNew,
                ),
              );
            }
            if (state is VerifyOTPErrorState) {
              final snackBar = SnackBar(
                content: Text(
                  "Please enter valid OTP",
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is VerifyOTPSuccessState) {
              NavigationHelper.navigateAndRemoveUntil(
                  context, ConfirmPasswordScreen());
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: ScreenDimension.screenHeight * 0.34,
                  child: Image.asset(
                    AppImages.loginscreenLogo,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 25, left: 25),
                          child: CommomText(
                            text: "VERIFICATION CODE",
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "Enter the Verification code that was sent\n to your phone number ",
                        style: TextStyle(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                            fontFamily: "Poppins"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Pinput(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                        FilteringTextInputFormatter.deny(RegExp(
                            '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'))
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      scrollPadding: const EdgeInsets.all(15),
                      controller: pinController,
                      focusNode: focusNode,
                      defaultPinTheme: PinTheme(
                        width: 58.74,
                        height: 58.74,
                        // textStyle: CustomStyles.appbarTextStyle(),
                        decoration: BoxDecoration(
                          //  color: Colors.red,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: Colors.black, // Set the border color
                            width: 1.0, // Set the border width
                          ),
                        ),
                      ),
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        setState(() {
                          code = pin;
                          // isContinueButtonEnabled = code.isNotEmpty;
                        });
                        debugPrint('onCompleted: $pin');
                      },
                      onChanged: (value) {
                        debugPrint('onChanged: $value');

                        varificationNumber = value;
                        print("Verification Number: $varificationNumber");
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: AppColors.buttonColorNew,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25.0),
                      child: GestureDetector(
                        child: CommonButton(
                          buttonName: "Verify OTP",
                          buttonColor: varificationNumber.length == 4
                              ? AppColors.buttonColorNew
                              : AppColors.iconColor,
                        ),
                        onTap: () {
                          if (varificationNumber.length == 4) {
                            BlocProvider.of<VerifyOtpCubit>(context)
                                .verifyOTPFunction(varificationNumber);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    text = RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: '''Didn’t received the code? ''',
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                            text: isResendAgain
                                ? '''Try again in  $_start'''
                                : '''Resend ''',
                            style: TextStyle(color: Colors.black),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                if (isResendAgain) return;
                                resend();
                              },
                          ),
                        ]))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
