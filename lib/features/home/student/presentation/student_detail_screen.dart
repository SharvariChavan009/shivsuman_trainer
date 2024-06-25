import 'package:car_trainer_application/core/common/colors.dart';

import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/common/widgets/c_button.dart';

import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:flutter/material.dart';

class StudentDetailScreen extends StatefulWidget {
  const StudentDetailScreen({super.key});

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  TextEditingController feedbackController = TextEditingController();
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
          "Details",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1,
              fontFamily: "Poppins"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: ScreenDimension.screenWidth * 0.78,
                    child: const Text(
                      textAlign: TextAlign.start,
                      "John Smith",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "Poppins"),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF6F8F9),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        //! Address
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: ScreenDimension.screenWidth * 0.75,
                              child: const Text(
                                textAlign: TextAlign.start,
                                "Address",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: "Poppins"),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: ScreenDimension.screenWidth * 0.75,
                              child: const Text(
                                textAlign: TextAlign.start,
                                "Learner Drivers First Ever Driving Lesson - #1",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: "Poppins"),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        //! Mobile No
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: ScreenDimension.screenWidth * 0.75,
                              child: const Text(
                                textAlign: TextAlign.start,
                                "Mobile No",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: "Poppins"),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: ScreenDimension.screenWidth * 0.75,
                              child: const Text(
                                textAlign: TextAlign.start,
                                "7098554334",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: "Poppins"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        //! Batch Time
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: ScreenDimension.screenWidth * 0.75,
                              child: const Text(
                                textAlign: TextAlign.start,
                                "Batch",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: "Poppins"),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: ScreenDimension.screenWidth * 0.75,
                              child: const Text(
                                textAlign: TextAlign.start,
                                "9:00 AM - 12:00 PM",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: "Poppins"),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //! Feedback Field

                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(
                                    fontFamily: "Poppins", fontSize: 14),
                                minLines: 6,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    border: OutlineInputBorder(),
                                    hintText: "Give feedback",
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.2),
                                        fontFamily: "Poppins",
                                        fontSize: 14)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          child: CommonButton(buttonName: "Send Feedback"),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
