import 'package:flutter/material.dart';
import 'package:lawan_ui/constants/constants_ui.dart';

class MyAddRefree extends StatelessWidget {
  final String pathimage;
  final VoidCallback onTap;
  final String name;
  const MyAddRefree(
      {super.key,
      required this.onTap,
      required this.name,
      required this.pathimage});
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth / 1.47,
      height: screenHeight / 10,
      padding: EdgeInsets.only(left: screenWidth / 30, right: screenWidth / 30),
      margin: EdgeInsets.only(right: screenWidth / 30),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: Colors.white, // Warna border
        ),
      ),
      child: Row(
        children: [
          Container(
            width: screenWidth / 8,
            height: screenHeight / 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(pathimage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth / 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: TextStyle(
                        fontFamily: 'Lufga', color: kBlackColor, fontSize: 15, fontWeight: FontWeight.w500)),
                SizedBox(height: screenHeight / 100),
                Container(
                  width: screenWidth / 8,
                  height: screenHeight / 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text("Novice", style: blacklobbyTextStyle),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth / 18),
              child: Container(
                width: screenWidth / 8.5,
                height: screenHeight / 16,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: screenWidth / 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
