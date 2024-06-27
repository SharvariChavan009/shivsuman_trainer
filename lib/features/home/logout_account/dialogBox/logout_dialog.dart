import 'package:car_trainer_application/core/common/colors.dart';

import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({super.key});

  @override
  State<LogoutDialog> createState() => _LogoutDialog();
}

class _LogoutDialog extends State<LogoutDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        height: ScreenDimension.screenHeight * 0.24,
        width: ScreenDimension.screenWidth * 0.89,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 5.0, bottom: 8, right: 10, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(
                    Icons.delete,
                    size: 40,
                    color: AppColors.errorColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: ScreenDimension.screenWidth * 0.55,
                        child: Text(
                          textAlign: TextAlign.start,
                          "Do you want to logout?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "Poppins"),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Container(
                          width: ScreenDimension.screenWidth * 0.20,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 0.5,
                              ),
                              color: AppColors.buttonColorNew,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: Container(
                          width: ScreenDimension.screenWidth * 0.20,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.errorColor,
                                width: 0.5,
                              ),
                              color: AppColors.errorColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        onTap: () async {
                          var authBox = await Hive.openBox("authBox");                
                          print("Token --> ${authBox.get("authToken")}");
                          authBox.delete("authToken");
                          NavigationHelper.navigateAndRemoveUntil(context, SplashScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
