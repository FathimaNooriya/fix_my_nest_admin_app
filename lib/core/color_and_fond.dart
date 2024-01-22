import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorAndFont {
  static const WHITE = Color.fromARGB(255, 243, 239, 219);
  static const GREEN = Color.fromARGB(255, 57, 179, 159);
  static const BLACK = Color.fromARGB(255, 0, 0, 0);
  static const GRAY = Color.fromARGB(255, 107, 110, 116);
  static final TITTLE_Wt_TEXT = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
        color: WHITE, fontSize: 32, fontWeight: FontWeight.w700),
  );
  static final TITTLE_TEXT = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
        color: GREEN, fontSize: 32, fontWeight: FontWeight.w700),
  );
  static final SM_TEXT = GoogleFonts.balooBhai2(
      textStyle: const TextStyle(
          color: GREEN, fontSize: 16, fontWeight: FontWeight.w600));
  static final BUTTON_TEXT = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
      fontSize: 22,
      color: WHITE,
      fontWeight: FontWeight.w600,
    ),
  );
  static final RIGHT_TEXT = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      color: GREEN,
      fontSize: 18,
    ),
  );
  static final Normal_TEXT = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w400, color: GREEN, fontSize: 18),
  );
  static final Normal_wt_TEXT = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w400, color: WHITE, fontSize: 18),
  );
  static final Normal_TEXT_BOLD = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w600, color: GREEN, fontSize: 18),
  );
  static final Normal_TEXT_BOLD_BLACK = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w600, color: BLACK, fontSize: 18),
  );
  static final Normal_TEXT_BOLD_GRAY = GoogleFonts.balooBhai2(
    textStyle:
        const TextStyle(fontWeight: FontWeight.w600, color: GRAY, fontSize: 18),
  );
  static final Sm_TEXT_BOLD_Gr = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w600, color: GREEN, fontSize: 14),
  );
  static final Sm_TEXT_BOLD_BLACK = GoogleFonts.balooBhai2(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w600, color: BLACK, fontSize: 14),
  );
  static final Sm_TEXT_BOLD_GRAY = GoogleFonts.balooBhai2(
    textStyle:
        const TextStyle(fontWeight: FontWeight.w600, color: GRAY, fontSize: 14),
  );
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.grey[300],
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ));
}
