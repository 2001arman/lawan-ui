import 'package:flutter/material.dart';
class AddPerson extends StatelessWidget {
  final VoidCallback onTap;
  const AddPerson({
    super.key,
    required this.onTap,
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
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.only(left: screenWidth / 70),
              width: screenWidth / 6,
              height: screenHeight / 14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade600,
              ),
              child: Icon(
                Icons.person_add,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: screenWidth / 7,
            height: screenHeight / 45,
            margin: EdgeInsets.only(left: screenWidth / 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.shade300, width: 1)),
            child: Center(
              child: Text("Avaliable Slot",
                  style: TextStyle(
                    fontFamily: 'Lufga',
                    color: Colors.grey.shade500,
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
