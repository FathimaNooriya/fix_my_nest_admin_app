import 'package:flutter/material.dart';

import '../../../core/color_and_fond.dart';
import '../../../core/padding.dart';

class TextWithLink extends StatelessWidget {
  TextWithLink({
    super.key,
    required this.bottomText,
    required this.linkText,
    required this.buttonFunction,
    required this.navContext,
  });
  final String bottomText;
  final String linkText;
  final Widget buttonFunction;
  BuildContext navContext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.myPadding,
      child: Row(
        children: [
          Text(
            bottomText,
            style: ColorAndFont.Normal_TEXT,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (navContext) => buttonFunction));
              },
              child: Text(
                linkText,
                style: ColorAndFont.Normal_TEXT_BOLD,
              ))
        ],
      ),
    );
  }
}