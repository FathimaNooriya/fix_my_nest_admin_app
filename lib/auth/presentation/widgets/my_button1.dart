
import 'package:flutter/material.dart';
import '../../../core/color_and_fond.dart';
import '../../../core/padding.dart';

class MyButton1 extends StatelessWidget {
  const MyButton1(
      {super.key, required this.buttonText, required this.buttonPressed});
  final String buttonText;
  final Function buttonPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.myPadding,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorAndFont.GREEN,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
           buttonPressed();
        },
        child: Text(
          buttonText,
          style: ColorAndFont.BUTTON_TEXT,
        ),
      ),
    );
  }
}