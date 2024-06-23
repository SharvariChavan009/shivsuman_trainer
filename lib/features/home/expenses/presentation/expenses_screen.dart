import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_trainer_application/core/common/colors.dart';
import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/common/utils/screen_dimension.dart';
import 'package:car_trainer_application/core/common/widgets/c_button.dart';
import 'package:car_trainer_application/core/common/widgets/c_text_field.dart';
import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/features/home/notification/presentation/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  // ! ----------------------------------------------------------------
  TextEditingController expesesController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String _year = "No year picked";

  final ImagePicker _picker = ImagePicker();
  File? _image;

  void _datePicker() {
    final DateTime now = DateTime.now();
    final DateFormat pickYear = DateFormat('dd-MM-yyyy');
    final String formatted = pickYear.format(now);

    setState(() {
      _year = formatted;
    });
  }

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

  // ! ----------------------------------------------------------------

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
          "Expenses",
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
      body: Column(
        children: [
// ! Container 1

          Card(
            color: Colors.white,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: CustomTextField(
                                hintText: "Enter car expenses",
                                controller: expesesController,
                                inputType: CustomTextInputType.text,
                              )),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 20),
                            child: Row(
                              children: [
                                Expanded(
                                    child: CustomTextField(
                                  hintText: "Enter amount",
                                  controller: expesesController,
                                  inputType: CustomTextInputType.number,
                                )),
                              ],
                            ),
                          ),
                          GestureDetector(
                            child: CommonButton(buttonName: "Submit"),
                            onTap: () {
                              _datePicker();
                              print("Submitted");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 2.0, left: 2),
                            child: _image == null
                                ? Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.baseColor,
                                          width: 0.3,
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8)),
                                    height: ScreenDimension.screenHeight * 0.12,
                                    width: ScreenDimension.screenWidth * 0.30,
                                    child: Center(
                                      child: Text(
                                        "Upload receipt",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: "Poppins"),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: ScreenDimension.screenHeight * 0.12,
                                    width: ScreenDimension.screenWidth * 0.30,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            15) // Adjust the radius as needed
                                        ),
                                    child: Image.file(
                                      _image!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                          GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 23.0, right: 2, left: 2),
                                child:
                                    CommonButton(buttonName: "Upload receipt"),
                              ),
                              onTap: () {
                                // _pickImage(ImageSource.gallery);
                                _showPickerDialog(context);
                              })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

// ! Container 2

          Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                  itemCount: 11,
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            backgroundColor: AppColors.buttonColorNew,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'Edit',
                            onPressed: (ctx) {
                              print("Clicked on edit button");
                            },
                          ),
                          SlidableAction(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                            onPressed: (ctx) {
                              print("Clicked on delete button");
                            },
                          ),
                        ],
                      ),
                      child: Card(
                        color: Colors.white,
                        elevation: 4,
                        margin: EdgeInsets.all(10.0),
                        child: ListTile(
                          leading: Container(
                              height: ScreenDimension.screenHeight * 0.06,
                              width: ScreenDimension.screenWidth * 0.12,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      15) // Adjust the radius as needed
                                  ),
                              child: Image.asset(
                                AppImages.videoThumbnail,
                                fit: BoxFit.fill,
                              )),
                          title: Row(
                            children: [
                              FittedBox(
                                fit: BoxFit.contain,
                                child: AutoSizeText(
                                  "Petrol",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: AutoSizeText(
                                      "Price: 10000",
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                          fontFamily: "Poppins"),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: AutoSizeText(
                                      "22-06-2024",
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                          fontFamily: "Poppins"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}
