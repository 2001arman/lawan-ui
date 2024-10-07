import 'package:flutter/material.dart';

import '../constants/constants_ui.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isBlack;
  final VoidCallback onTap;
  final Color? borderColor;
  final Color? textColor;
  final Widget? widget;
  final double paddingVertical;
  final LinearGradient? gradientColor;
  const CustomButton({
    super.key,
    this.title = '',
    required this.isBlack,
    required this.onTap,
    this.borderColor,
    this.textColor,
    this.widget,
    this.paddingVertical = 14,
    this.gradientColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: paddingVertical),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: gradientColor,
            border: Border.all(
              width: 1,
              color: isBlack ? Colors.transparent : borderColor ?? kWhiteColor,
            ),
            color: isBlack ? kBlackColor : Colors.transparent,
          ),
          child: Center(
            child: widget ??
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    color: textColor ?? (isBlack ? kWhiteColor : kBlackColor),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
