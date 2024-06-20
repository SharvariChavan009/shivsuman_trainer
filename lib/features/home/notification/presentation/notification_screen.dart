import 'package:car_trainer_application/core/common/colors.dart';
import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            NavigationHelper.goBack(context);
          },
        ),
        title: const Text(
          "Notification",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1,
              fontFamily: "Poppins"),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 15.0, left: 15, right: 15, bottom: 10),
        child: Container(
          child: SingleChildScrollView(
  
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "All notification",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          letterSpacing: 1,
                          fontFamily: "Poppins"),
                    )
                  ],
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 3.0, left: 10, right: 10),
                        child: Card(
                            elevation: 2,
                            color: Colors.white,
                            child: Row(
                              children: [
                                //! Container 1

                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      height:
                                          ScreenDimension.screenWidth * 0.23,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffE3E9FF),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(11),
                                            bottomLeft: Radius.circular(11)),
                                      ),
                                    )),

                                //! Container 2

                                Expanded(
                                    flex: 11,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 2),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: ScreenDimension
                                                          .screenWidth *
                                                      0.51,
                                                  child: Text(
                                                    textAlign: TextAlign.start,
                                                    "Message for all students",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14,
                                                        fontFamily: "Poppins"),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2, top: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: ScreenDimension
                                                          .screenWidth *
                                                      0.70,
                                                  child: Text(
                                                    textAlign: TextAlign.start,
                                                    "Ali pa kliknite na spodnji gumb, da vas odpeljemo na kontaktno stran.",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontFamily: "Poppins"),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            )),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
