import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCoachHome extends StatelessWidget {
  const MyCoachHome({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      height: screenHeight / 11,
      margin: EdgeInsets.symmetric(horizontal: screenWidth / 30),
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
                image: AssetImage("assets/photo_1.jpg"),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Zakri Ibrahim",
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
                            "GK",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth / 30,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth / 25),
                      child: Icon(
                        Icons.sports,
                        size: screenWidth / 15,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: screenWidth / 6,
            height: screenHeight / 35,
            margin: EdgeInsets.only(left: screenWidth / 3.7),
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
