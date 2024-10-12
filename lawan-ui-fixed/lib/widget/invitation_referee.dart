import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvitationReferee extends StatelessWidget {
  final String name; // Parameter untuk nama
  final String imagePath; // Parameter untuk path gambar

  const InvitationReferee({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight / 11,
      margin: EdgeInsets.only(left: screenWidth / 30, right: screenWidth / 30, bottom: screenHeight / 50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(33),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: screenWidth / 70),
            width: screenWidth / 6,
            height: screenHeight / 14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath), // Menggunakan parameter imagePath
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name, // Menggunakan parameter name
                style: GoogleFonts.poppins(
                  fontSize: screenWidth / 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight / 150),
                child: Text(
                  "Invitation sent. Waiting for player to join.",
                  style: GoogleFonts.poppins(fontSize: screenWidth / 40),
                ),
              ),
            ],
          ),
          Container(
            width: screenWidth / 6,
            height: screenHeight / 35,
            margin: EdgeInsets.only(left: screenWidth / 60),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.grey.shade300,
                )),
            child: Center(
              child: Text(
                "Novice",
                style: GoogleFonts.poppins(
                  fontSize: screenWidth / 30,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
