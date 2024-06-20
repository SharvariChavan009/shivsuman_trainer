import 'package:car_trainer_application/core/common/colors.dart';
import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/common/validation_variables.dart';
import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/features/auth/presentation/forgot_password_screen.dart';
import 'package:car_trainer_application/features/auth/presentation/otp_screen.dart';
import 'package:car_trainer_application/features/home/delete_accountt/dialogBox/delete_dialog.dart';
import 'package:car_trainer_application/features/home/notification/presentation/notification_screen.dart';
import 'package:car_trainer_application/features/home/presentation/home_screen.dart';
import 'package:car_trainer_application/features/home/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // ----------------------------------------------------

  List listviewImageContainers = [
    AllIcons.profile,
    AllIcons.notification1,
    AllIcons.changepassword,
    AllIcons.deleteAccount
  ];

  bool _switchValue = true;

  // ----------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            child: const Icon(
              Icons.turn_left,
              size: 35,
              color: AppColors.darkColor,
            ),
            onTap: () {
              NavigationHelper.navigateAndRemoveUntil(context, HomeScreen());
            },
          ),
          title: const Text(
            "Settings",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 1,
                fontFamily: "Poppins"),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                child: ImageIcon(
                  color: AppColors.darkColor,
                  AssetImage(AllIcons.notification1),
                  size: 30,
                ),
                onTap: () {
                  NavigationHelper.navigateTo(context, NotificationScreen());
                },
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            //! Container 1
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 3,
                        color: Colors.grey,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(
                        child: Image.asset(
                      AppImages.companyLogo,
                      fit: BoxFit.fill,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Shiv Suman",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: 1,
                              fontFamily: "Poppins"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //! Container 2

            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //! Profile
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: GestureDetector(
                        child: ListTile(
                          title: Text(
                            "Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: "Poppins"),
                          ),
                          leading: Image.asset(
                            AllIcons.profile,
                            height: 70,
                            width: 70,
                          ),
                        ),
                        onTap: () {
                          NavigationHelper.navigateTo(context, ProfileScreen());
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                
                    //! Change Password
                
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: GestureDetector(
                        child: ListTile(
                          title: Text(
                            "Change Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: "Poppins"),
                          ),
                          leading: Image.asset(
                            AllIcons.changepassword,
                           height: 70,
                            width: 70,
                          ),
                        ),
                        onTap: () {
                          ValidationAllVariables.changePasswordPage = true;
                          NavigationHelper.navigateTo(
                              context, ForgotPasswordScreen());
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                
                    //! Notifications
                
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 12.0, bottom: 15, left: 15),
                      child: ListTile(
                        title: const Text(
                          "Notifications",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: "Poppins"),
                        ),
                        leading: Image.asset(
                          AllIcons.notification2,
                    
                          height: 70,
                            width: 70,
                        ),
                        trailing: Switch(
                            activeColor:AppColors.buttonColorNew,
                            value: _switchValue,
                            onChanged: (value) {
                              setState(() {
                                _switchValue = value;
                              });
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                
                    //! Delete Account
                
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: GestureDetector(
                        child: ListTile(
                          title: Text(
                            "Delete Account",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: "Poppins"),
                          ),
                          leading: Image.asset(
                            AllIcons.deleteAccount,
                        
                            height: 70,
                            width: 70,
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DeleteDialog();
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
