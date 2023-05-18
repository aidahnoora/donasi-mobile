import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 30.0;

Color primaryColor = Color(0xff6C5ECF);
Color secondaryColor = Color(0xff38ABBE);
Color alertColor = Color(0xffED6363);
Color priceColor = Color(0xff2C96F1);
Color backgroundColor1 = Color(0xff748E32);
Color backgroundColor2 = Color(0xffA8C366);
Color backgroundColor3 = Color(0xff242231);
Color primaryTextColor = Color(0xffF1F0F2);
Color secondaryTextColor = Color(0xff999999);
Color subtitleColor = Color(0xffFBFFEB);

TextStyle primaryTextStyle = GoogleFonts.merienda(
  color: primaryTextColor,
);

TextStyle secondaryTextStyle = GoogleFonts.merienda(
  color: secondaryTextColor,
);

TextStyle subtitleTextStyle = GoogleFonts.merienda(
  color: subtitleColor,
);

TextStyle priceTextStyle = GoogleFonts.merienda(
  color: priceColor,
);

TextStyle purpleTextStyle = GoogleFonts.merienda(
  color: primaryColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;