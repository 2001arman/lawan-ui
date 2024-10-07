import 'package:flutter/material.dart';

Color kBlackColor = const Color(0xFF000000);
Color kWhiteColor = const Color(0xFFFFFFFF);
Color kBackgroundColor = const Color(0xFFF2F3F2);
Color kGreenColor = const Color(0xFF23A991);

Color kDarkgreyColor = const Color(0xFF545F71);
Color kMidgreyColor = const Color(0xFFACB4C0);
Color kGreyColor = const Color(0xFFDEE1E3);

Color kModalColor = const Color(0xFFF2F3F2).withOpacity(0.7);

Color kRedColor = const Color(0xFFF05B5B);
Color kOrangeColor = const Color(0xFFE29726);

TextStyle blackTextStyle = TextStyle(
  fontFamily: 'Lufga',
  color: kBlackColor,
);

TextStyle whiteTextStyle = TextStyle(
  fontFamily: 'Lufga',
  color: kWhiteColor,
);

TextStyle greenTextStyle = TextStyle(
  fontFamily: 'Lufga',
  color: kGreenColor,
);

TextStyle darkGreyTextStyle = TextStyle(
  fontFamily: 'Lufga',
  color: kDarkgreyColor,
);

TextStyle midGreyTextStyle = TextStyle(
  fontFamily: 'Lufga',
  color: kMidgreyColor,
);

TextStyle greyTextStyle = TextStyle(
  fontFamily: 'Lufga',
  color: kGreyColor,
);

TextStyle redTextStyle = TextStyle(
  fontFamily: 'Lufga',
  color: kRedColor,
);

LinearGradient mainGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF0C1B22),
    Color(0xFF44D8BE),
  ],
);

LinearGradient backgroundGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    const Color(0xFF0C1B22).withOpacity(0.8),
    const Color(0xFF44D8BE).withOpacity(0.0),
  ],
);

double defaultMargin = 16.0;

FontWeight light = FontWeight.w300;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
