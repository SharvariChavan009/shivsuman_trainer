import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_trainer_application/core/common/colors.dart';
import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/common/widgets/c_button.dart';
import 'package:car_trainer_application/core/common/widgets/c_text_field.dart';
import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/features/home/profile/presentation/dialogBox/profile_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController registerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // --------------------------------
    File? _imgFile;

    void takeSnapshot() async {
      final ImagePicker picker = ImagePicker();
      final XFile? img = await picker.pickImage(
        source: ImageSource.gallery, // alternatively, use ImageSource.gallery
        maxWidth: 400,
      );
      if (img == null) return;
      setState(() {
        _imgFile = File(img.path); // convert it to a Dart:io file
      });
    }

    // --------------------------------

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
          "Profile",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1,
              fontFamily: "Poppins"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ScreenDimension.screenHeight * 0.03,
              ),
              
              GestureDetector(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: (_imgFile == null)
                      ? AssetImage(
                          AppImages.personPlaceholder,
                        )
                      : FileImage(_imgFile!) as ImageProvider,
                ),
                onTap: () {
                  takeSnapshot();
                },
              ),
              SizedBox(
                height: ScreenDimension.screenHeight * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    hintText: "Full name",
                    controller: nameController,
                    inputType: CustomTextInputType.text,
                  )),
                ],
              ),
              SizedBox(
                height: ScreenDimension.screenHeight * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    hintText: "domen@gmail.com",
                    controller: emailController,
                    inputType: CustomTextInputType.email,
                  )),
                ],
              ),
              SizedBox(
                height: ScreenDimension.screenHeight * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    hintText: "Phone number",
                    controller: phoneController,
                    inputType: CustomTextInputType.number,
                  )),
                ],
              ),
              SizedBox(
                height: ScreenDimension.screenHeight * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    readOnly: true,
                    hintText: "Registration number",
                    controller: registerController,
                    inputType: CustomTextInputType.text,
                  )),
                ],
              ),
              SizedBox(
                height: ScreenDimension.screenHeight * 0.03,
              ),
              GestureDetector(
                child: CommonButton(buttonName: "Save information"),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ProfileDialog();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
