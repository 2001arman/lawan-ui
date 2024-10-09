import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan_ui/constants/constants_ui.dart';

class CustomAppBar {
  static appbarButton({
    required String title,
    bool? isIcon,
    VoidCallback? onTap,
  }) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            GestureDetector(
              onTap: onTap ??
                  () {
                    Get.back();
                  },
              child: Container(
                height: 42,
                width: 42,
                // padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: kMidgreyColor),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: kDarkgreyColor,
                  size: 12,
                ),
              ),
            ),
            if (isIcon == true)
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.credit_card,
                  color: kDarkgreyColor,
                  size: 20,
                ),
              ),
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
