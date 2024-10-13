import 'package:flutter/material.dart';
import 'package:lawan_ui/constants/constants_ui.dart';

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
      margin: EdgeInsets.only(
          left: screenWidth / 30,
          right: screenWidth / 30,
          bottom: screenHeight / 50),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(33),
        border: Border.all( 
          color: Colors.white,
        )
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
              Text(name, // Menggunakan parameter name
                  style: TextStyle(
                      fontFamily: 'Lufga',
                      color: kBlackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.only(top: screenHeight / 150),
                child: Text(
                  "Invitation sent. Waiting for player to join.",
                  style: blackinvitationTextStyle,
                ),
              ),
            ],
          ),
          Container(
            width: screenWidth / 7,
            height: screenHeight / 45,
            margin: EdgeInsets.only(left: screenWidth / 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white, width: 1)),
            child: Center(
              child: Text("Novice",
                  style: TextStyle(
                    fontFamily: 'Lufga',
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.5,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
