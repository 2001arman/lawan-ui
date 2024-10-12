import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MakeReferee extends StatelessWidget {
  final String name;
  final String role;
  final String imagePath;
  final Function onAddReferee;

  const MakeReferee({
    super.key,
    required this.name,
    required this.role,
    required this.imagePath,
    required this.onAddReferee,
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
                image: AssetImage(imagePath),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name, // Nama yang dinamis
                style: GoogleFonts.poppins(
                  fontSize: screenWidth / 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight / 150),
                child: Row(
                  children: [
                    Container(
                      width: screenWidth / 6,
                      height: screenHeight / 35,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_2_outlined,
                              color: Colors.grey, size: screenWidth / 20),
                          Text(
                            role, // Posisi yang dinamis
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth / 30,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: screenWidth / 6,
            height: screenHeight / 35,
            margin: EdgeInsets.only(left: screenWidth / 9),
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
          GestureDetector(
            onTap: () {
              onAddReferee(); // Fungsi untuk menambahkan referee
            },
            child: Container(
              margin: EdgeInsets.only(left: screenWidth / 50),
              width: screenWidth / 6,
              height: screenHeight / 14,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth / 40,
                    right: screenWidth / 50,
                    top: screenWidth / 40,
                    bottom: screenWidth / 50),
                child: Icon(
                  Icons.sports,
                  color: Colors.grey,
                  size: screenWidth / 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
