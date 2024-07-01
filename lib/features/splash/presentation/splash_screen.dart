import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/features/auth/presentation/confirm_password_screen.dart';
import 'package:car_trainer_application/features/auth/presentation/login_screen.dart';
import 'package:car_trainer_application/features/auth/presentation/otp_screen.dart';
import 'package:car_trainer_application/features/home/presentation/home_screen.dart';
import 'package:car_trainer_application/features/home/settings/presentation/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> checkLoginStatus() async {
    var authBox = await Hive.openBox("authBox");

    Future.delayed(const Duration(milliseconds: 3000), () {
      try {
        String? authToken = authBox.get("authToken");
        print("authToken =$authToken");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => (authBox.get("authToken") == null)
                    ? LoginScreen()
                    : HomeScreen()),
            (Route route) => false);
      } catch (e) {
        debugPrint('Error navigating to LoginScreen: $e');
      }
    });
  }

  @override
  void initState() {
    super.initState();

    checkLoginStatus();
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
          Container(
            child: Image.asset(
              AppImages.splashImage,
            ),
          )
        ],
      ),
    );
  }
}
