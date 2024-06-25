import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_trainer_application/core/common/colors.dart';
import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/features/home/notification/presentation/notification_screen.dart';
import 'package:car_trainer_application/features/home/student/presentation/student_detail_screen.dart';
import 'package:car_trainer_application/features/home/student/presentation/student_dialogbox.dart';
import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
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
          "Student",
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
      body: ListView.builder(
        itemCount: 11,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: const Card(
              color: Colors.white,
              elevation: 4,
              margin: EdgeInsets.all(10.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                ),
                title: Row(
                  children: [
                    FittedBox(
                      fit: BoxFit.contain,
                      child: AutoSizeText(
                        "Alice Johnson",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                            fontFamily: "Poppins"),
                      ),
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    FittedBox(
                      fit: BoxFit.contain,
                      child: AutoSizeText(
                        "Batch Time: 11:00 AM - 12:00 PM",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                            fontFamily: "Poppins"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return StudentDetailScreen();
                },
              );
              print("Click to student Index: $index");
            },
          );
        },
      ),
    );
  }
}
