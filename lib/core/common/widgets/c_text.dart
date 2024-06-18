import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_trainer_application/core/common/colors.dart';
import 'package:flutter/material.dart';

class CommomText extends StatefulWidget {
  final String text;
  final Color? textColor;
 
  CommomText({super.key, required this.text, this.textColor,});

  @override
  State<CommomText> createState() => _CommomTextState();
}

class _CommomTextState extends State<CommomText> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: AutoSizeText(
        widget.text,
        maxLines: 1,
        style: TextStyle(
          color: widget.textColor == ""
              ? AppColors.primaryColor
              : widget.textColor,
          fontSize:14,
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}
