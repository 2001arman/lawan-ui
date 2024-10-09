import 'package:flutter/material.dart';
import 'package:lawan_ui/constants/constants_ui.dart';

List<Widget> generateCardNumber(String cardNumber) {
  List<String> parts = [
    cardNumber.substring(0, 4),
    cardNumber.substring(4, 8),
    cardNumber.substring(8, 12),
    cardNumber.substring(12, 16),
  ];

  // Mengganti tiga bagian pertama dengan simbol bulat
  List<Widget> widgets = parts
      .asMap()
      .entries
      .map((entry) => entry.key < 3
          ? Text(
              '• • • •',
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            )
          : Text(
              entry.value,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ))
      .toList();

  return widgets;
}
