import 'dart:io';

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

  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);

        print("Image Uploaded");
      });
    }
  }

  void _showPickerDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(ctx).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

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
                  backgroundImage: (_image == null)
                      ? AssetImage(
                          AppImages.personPlaceholder,
                        )
                      : FileImage(_image!),
                ),
                onTap: () {
                  _showPickerDialog(context);
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
