import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan_ui/constants/constants_ui.dart';
import 'package:lawan_ui/lobby/controller/lobby_controller.dart';

// ignore: must_be_immutable
class RefereeWidget extends StatelessWidget {
  final String name;
  final String role;
  final String image;
  String status;

  final LobbyController lobbyController = Get.put(LobbyController());

  RefereeWidget({
    super.key,
    required this.name,
    required this.role,
    required this.image,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight / 12.5,
      margin: EdgeInsets.only(
          left: screenWidth / 30,
          right: screenWidth / 30,
          bottom: screenHeight / 50),
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
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: TextStyle(
                      fontFamily: 'Lufga',
                      color: kBlackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.only(top: screenHeight / 150),
                child: Row(
                  children: [
                    Container(
                      width: screenWidth / 6.8,
                      height: screenHeight / 39,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_2_outlined,
                              color: Colors.grey, size: screenWidth / 20),
                          Text(role,
                              style: TextStyle(
                                fontFamily: 'Lufga',
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.5,
                              )),
                        ],
                      ),
                    ),
                    status == "isReferee"
                        ? Padding(
                            padding: EdgeInsets.only(left: screenWidth / 33),
                            child: Icon(
                              Icons.sports,
                              size: screenWidth / 15,
                              color: Colors.grey,
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            width: screenWidth / 7,
            height: screenHeight / 45,
            margin: EdgeInsets.only(right: screenWidth / 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.shade300, width: 1)),
            child: Center(
              child: Text("Novice",
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
