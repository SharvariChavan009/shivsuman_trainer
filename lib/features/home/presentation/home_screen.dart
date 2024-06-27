import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_trainer_application/core/common/colors.dart';
import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/features/home/delete_accountt/dialogBox/delete_dialog.dart';
import 'package:car_trainer_application/features/home/expenses/presentation/expenses_screen.dart';
import 'package:car_trainer_application/features/home/logout_account/dialogBox/logout_dialog.dart';
import 'package:car_trainer_application/features/home/notification/presentation/notification_screen.dart';
import 'package:car_trainer_application/features/home/self_attendence/presentation/self_attendence_screen.dart';
import 'package:car_trainer_application/features/home/settings/presentation/setting_screen.dart';
import 'package:car_trainer_application/features/home/student/presentation/student_screen.dart';

import 'package:car_trainer_application/features/home/training_videos/presentation/videoPlayerScreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // -----------------------------------------------------

  List listviewNameContainers = ["Training Videos", "Self Attendence"];
  List listviewImageContainers = [AllIcons.training, AllIcons.attendence];

  List gridviewNameContainers = ["Student", "Expenses", "Settings", "Logout"];
  List gridviewImageContainers = [
    AllIcons.student,
    AllIcons.expensives,
    AllIcons.settings,
    AllIcons.logout
  ];

  int currentImage = 0;
  Widget indicator(int index) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: currentImage == index ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentImage == index
              ? AppColors.buttonColorNew
              : const Color.fromARGB(255, 87, 125, 242)),
    );
  }

  // -----------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset(
          AppImages.companyLogo,
          fit: BoxFit.fill,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              child: const ImageIcon(
                color: AppColors.darkColor,
                AssetImage(AllIcons.notification1),
                size: 30,
              ),
              onTap: () {
                NavigationHelper.navigateTo(
                    context, const NotificationScreen());
              },
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            //! Container 1

            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CarouselSlider.builder(
                        itemCount: listviewNameContainers.length,
                        itemBuilder: (context, index, realIndex) {
                          return GestureDetector(
                            child: Card(
                              elevation: 4,
                              color: Colors.white,
                              child: SizedBox(
                                width: ScreenDimension.screenWidth * 0.72,
                                height: ScreenDimension.screenHeight * 0.20,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height:
                                            ScreenDimension.screenHeight * 0.10,
                                        width:
                                            ScreenDimension.screenWidth * 0.28,
                                        child: Image.asset(
                                          listviewImageContainers[index],
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: AutoSizeText(
                                          listviewNameContainers[index],
                                          maxLines: 1,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primaryColor,
                                              fontFamily: "Poppins"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              print("Click Carousel Index: $index");

                              if (index == 0) {
                                NavigationHelper.navigateTo(
                                    context,(VideoPlayerScreen1()));
                              } else if (index == 1) {
                                NavigationHelper.navigateTo(
                                    context, SelfAttendenceScreen());
                              }
                            },
                          );
                        },
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentImage = index;
                            });
                          },
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(2, (index) {
                        return indicator(index);
                      }),
                    )
                  ],
                ),
              ),
            ),

            //! Container 2

            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 17),
                  child: Text(
                    "Features",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 1,
                        fontFamily: "Poppins"),
                  ),
                )
              ],
            ),

            //! Container 3

            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5, top: 2),
                child: SingleChildScrollView(
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15),
                      itemCount: gridviewNameContainers.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            child: SizedBox(
                              width: ScreenDimension.screenWidth * 0.43,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height:
                                          ScreenDimension.screenHeight * 0.11,
                                      width: ScreenDimension.screenWidth * 0.25,
                                      child: Image.asset(
                                        gridviewImageContainers[index],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: AutoSizeText(
                                      gridviewNameContainers[index],
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryColor,
                                          fontFamily: "Poppins"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            if (index == 0) {
                              NavigationHelper.navigateTo(
                                  context, const StudentScreen());
                            } else if (index == 1) {
                              NavigationHelper.navigateTo(
                                  context, ExpensesScreen());
                            } else if (index == 2) {
                              NavigationHelper.navigateTo(
                                  context, const SettingScreen());
                            } else if (index == 3) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return LogoutDialog();
                                },
                              );
                            }
                          },
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
