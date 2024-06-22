import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:flutter/material.dart';

class StudentDialogBox extends StatefulWidget {
  const StudentDialogBox({super.key});

  @override
  State<StudentDialogBox> createState() => _StudentDialogBoxState();
}

class _StudentDialogBoxState extends State<StudentDialogBox> {
 
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
      height: ScreenDimension.screenHeight*0.26,
      width: ScreenDimension.screenWidth*0.96,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: ScreenDimension.screenWidth * 0.51,
                  child: const Text(
                    textAlign: TextAlign.start,
                    "Name: John Smith",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Poppins"),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: ScreenDimension.screenWidth * 0.68,
                  child: const Text(
                    textAlign: TextAlign.start,
                    "Address: Learner Drivers First Ever Driving Lesson - #1",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Poppins"),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: ScreenDimension.screenWidth * 0.68,
                  child: const Text(
                    textAlign: TextAlign.start,
                    "Mobile No: 7054677532",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Poppins"),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: ScreenDimension.screenWidth * 0.68,
                  child: const Text(
                    textAlign: TextAlign.start,
                    "Batch: 9:00 AM - 12:00 PM",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Poppins"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
