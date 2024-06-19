import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/features/auth/presentation/login_screen.dart';
import 'package:car_trainer_application/features/home/settings/presentation/setting_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      NavigationHelper.navigateAndRemoveUntil(context, LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    //! ----------------------------------------------------------------

    var sWidth = MediaQuery.of(context).size.width;
    var sHeight = MediaQuery.of(context).size.height;

    ScreenDimension.screenWidth = sWidth;
    ScreenDimension.screenHeight = sHeight;

    print("Screen Width: $sWidth");
    print("Screen Height: $sHeight");

    //! ----------------------------------------------------------------

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                  AppImages.companyLogo,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.splashImage,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
