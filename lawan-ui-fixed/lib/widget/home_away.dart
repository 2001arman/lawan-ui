import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double avatarRadius = screenWidth * 0.1;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: CircleAvatar(
            radius: avatarRadius - 10, // Ukuran diameter lingkaran responsif
            backgroundColor: Colors.transparent, // Warna latar belakang
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.shield_rounded,
                  size: avatarRadius,
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
        Text(
          widget.title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
