import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_trainer_application/core/common/colors.dart';
import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/common/widgets/c_text_field.dart';
import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:flutter/material.dart';

class TrainingVideosScreen extends StatefulWidget {
  const TrainingVideosScreen({super.key});

  @override
  State<TrainingVideosScreen> createState() => _TrainingVideosScreenState();
}

class _TrainingVideosScreenState extends State<TrainingVideosScreen> {
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
          "Training Course",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1,
              fontFamily: "Poppins"),
        ),
      ),
      body: Column(
        children: [
          //! Section 1
          Expanded(
              flex: 4,
              child: Image.asset(
                AppImages.videoThumbnail,
                fit: BoxFit.cover,
              )),

          //! Section 2

          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  children: [
                    FittedBox(
                      fit: BoxFit.contain,
                      child: AutoSizeText(
                        'Speed limit signs',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primaryColor,
                            fontFamily: "Poppins"),
                      ),
                    ),
                  ],
                ),
              )),

          //! Section 3

          Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                                color: Colors.white,
                        
                                child: Row(
                                  children: [
                                    //! Container 1
              
                                    Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10,
                                              top: 8,
                                              bottom: 8),
                                          child: Container(
                                              height: ScreenDimension
                                                      .screenWidth *
                                                  0.21,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15) // Adjust the radius as needed
                                                  ),
                                              child: Image.asset(
                                                AppImages.videoThumbnail,
                                                fit: BoxFit.cover,
                                              )),
                                        )),
              
                                    //! Container 2
              
                                    Expanded(
                                        flex: 8,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.all(12.0),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(
                                                        left: 2),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                  children: [
                                                    SizedBox(
                                                      width: ScreenDimension
                                                              .screenWidth *
                                                          0.51,
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.start,
                                                        "Learner Drivers First Ever Driving Lesson - #1",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                            fontSize: 14,
                                                            fontFamily:
                                                                "Poppins"),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(
                                                        top: 20.0),
                                                child: const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                  children: [
                                                    Text(
                                                      "20 min",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              "Poppins"),
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
              )),
        ],
      ),
    );
  }
}



/*

  Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 2, right: 2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width:
                                                  ScreenDimension.screenWidth *
                                                      0.81,
                                              child: Text(
                                                textAlign: TextAlign.start,
                                                "Message for all students",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    fontFamily: "Poppins"),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 2, right: 2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width:
                                                  ScreenDimension.screenWidth *
                                                      0.81,
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
                                ),



*/