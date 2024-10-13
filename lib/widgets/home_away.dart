import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomeAwayLogo extends StatefulWidget {
  final String title;
  const MyHomeAwayLogo({
    super.key,
    required this.title,
  });

  @override
  State<MyHomeAwayLogo> createState() => _MyHomeAwayLogoState();
}

class _MyHomeAwayLogoState extends State<MyHomeAwayLogo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(right: 12, bottom: 8, left: 5, top: 1),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFDEE1E2),
          ),
          child: CircleAvatar(
            radius: 18, // Ukuran diameter lingkaran responsif
            backgroundColor: Colors.transparent, // Warna latar belakang
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.shield_rounded,
                  size: 28,
                ),
                color: Colors.black, // Warna ikon arrow
                onPressed: () {
                  // Aksi ketika button diklik
                  Get.back();
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(widget.title,
              style: TextStyle(
                  fontFamily: 'Lufga',
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
        ),
      ],
    );
  }
}
