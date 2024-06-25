import 'package:car_trainer_application/core/common/colors.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatefulWidget {
  String buttonName;
  Color? buttonColor;
  CommonButton({super.key, required this.buttonName, this.buttonColor});

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.buttonColorNew,
            width: 0.5,
          ),
          color: widget.buttonColor == null
              ? AppColors.buttonColorNew
              : widget.buttonColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              widget.buttonName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: "Poppins"),
            ),
          ),
        ),
      ),
    );
  }
}
