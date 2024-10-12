import 'package:flutter/material.dart';

import '../constants/constants_ui.dart';

class CircleButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isActive;
  final Widget? widget;
  final EdgeInsets? margin;
  final Color? borderColor;
  final double size;
  const CircleButtonWidget(
      {super.key,
      required this.onTap,
      this.widget,
      this.isActive = true,
      this.margin,
      this.borderColor,
      this.size = 44});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        margin: margin,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? kBlackColor : kWhiteColor,
          border: Border.all(
            width: 1,
            color: borderColor ?? Colors.transparent,
          ),
        ),
        child: widget ??
            Icon(
              Icons.add,
              color: kWhiteColor,
            ),
      ),
    );
  }
}
