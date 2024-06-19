import 'package:car_trainer_application/core/common/colors.dart';
import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:flutter/material.dart';

class ProfileDialog extends StatefulWidget {
  const ProfileDialog({super.key});

  @override
  State<ProfileDialog> createState() => _ProfileDialogState();
}

class _ProfileDialogState extends State<ProfileDialog> {
  @override
  Widget build(BuildContext context) {
    return    Dialog(
              backgroundColor: Colors.white,
              child: SizedBox(
                width: ScreenDimension.screenWidth * 0.9,
                height: ScreenDimension.screenHeight * 0.20,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, bottom: 8, right: 10, left: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                         Image.asset(AllIcons.check,height: 100,width: 100,),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                "Account information update successfull",
                                style: TextStyle(
                                    color: AppColors.darkColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: "Poppins"),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
  
  }
}