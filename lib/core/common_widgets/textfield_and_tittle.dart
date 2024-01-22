import 'package:flutter/material.dart';
import '../color_and_fond.dart';
import '../padding.dart';



class TextFirmFieldWithTitle extends StatelessWidget {
  TextFirmFieldWithTitle({
    super.key,
    required this.textFeildTittle,
    required this.myController,
    required this.validatorFunction,
    this.maxlines = false,
  });
  final String textFeildTittle;
  final TextEditingController myController;
  final Function validatorFunction;
  bool maxlines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.myPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              textFeildTittle,
              style: ColorAndFont.SM_TEXT,
            ),
          ),
          maxlines
              ? TextFormField(
                  controller: myController,
                  maxLines: 5,
                  validator: (value) {
                    return validatorFunction();
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 2,
                        color: ColorAndFont.GREEN,
                      ),
                    ),
                  ),
                )
              : TextFormField(
                  controller: myController,
                  validator: (value) {
                    return validatorFunction();
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 2,
                        color: ColorAndFont.GREEN,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
