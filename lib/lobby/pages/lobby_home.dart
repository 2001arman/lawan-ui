import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan_ui/lobby/controller/lobby_controller.dart';
import 'package:lawan_ui/widgets/add_person.dart';
import 'package:lawan_ui/widgets/invitation_referee.dart';
import 'package:lawan_ui/widgets/my_add_referee.dart';
import 'package:lawan_ui/widgets/referee.dart';

class MyLobbyHome extends StatelessWidget {
  const MyLobbyHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar untuk membuat desain responsif
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight / 50),
            child: Stack(
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight / 1.57,
                  color: Colors.transparent,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        width: screenWidth,
                        height:
                            screenHeight / 12.5, // Bisa diubah sesuai preferensi
                        margin: EdgeInsets.only(left: screenWidth / 20, top: 2),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            MyAddRefree(
                              onTap: () {},
                              name: "Saiful Bukhari",
                              pathimage: "assets/profiles/photo_1.jpg",
                            ),
                            MyAddRefree(
                              onTap: () {},
                              name: "Sarah Yahya",
                              pathimage: "assets/profiles/photo_2.jpg",
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight / 50),
                        child: SizedBox(
                          width: screenWidth,
                          height: screenHeight / 1.9,
                          child: GetBuilder<LobbyController>(
                              init: LobbyController(),
                              builder: (controller) {
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: controller.refereesdata.length,
                                  itemBuilder: (context, index) {
                                    var referee =
                                        controller.refereesdata[index];
                                    if (referee["status"] == "isReferee" ||
                                        referee["status"] == "notReferee") {
                                      return RefereeWidget(
                                        name: referee["name"]
                                            as String, // Pastikan akses dengan null safety
                                        role: referee["role"] as String,
                                        image: referee["image"] as String,
                                        status: referee["status"] as String,
                                      );
                                    } else if (referee["status"] == "invitation"){
                                      return InvitationReferee(
                                        name: referee["name"] as String, 
                                        imagePath: referee["image"] as String,
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                );
                              }),
                        ),
                      ),
                      AddPerson(onTap: (){}),
                      AddPerson(onTap: (){}),
                    ],
                  ),
                ),
                Positioned(
                    top: screenHeight / 1.97,
                    child: Container(
                      width: screenWidth,
                      height: screenHeight / 3.4,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 100,
                            offset: Offset(-2, 4), // Shift to left bottom
                          ),
                          // Shadow for the right bottom corner
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 100,
                            offset: Offset(2, 4), // Shift to right bottom
                          ),
                          // Light shadow for the top
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 100,
                            offset: Offset(0, -2), // Shift upwards
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  left: screenWidth * 0.127,
                  top: screenHeight / 1.90,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: screenWidth * 0.75,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: [
                        // Timer Icon
                        CircleAvatar(
                          radius: screenWidth * 0.06,
                          backgroundColor: Colors.black,
                          child: Icon(Icons.sports, color: Colors.white),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Session starting in",
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "2 days 2 hours 6 mins 3 sec",
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
