import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referee_app/controller/refree_controller.dart';
import 'package:referee_app/widget/invitation_referee.dart';
import 'package:referee_app/widget/make_referee.dart';
import 'package:referee_app/widget/refree_widget.dart';

class MyLobbyRefree extends StatelessWidget {
  final RefereeController refereeController = Get.put(RefereeController());
  MyLobbyRefree({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
          padding: EdgeInsets.only(top: screenHeight / 50),
          child: Stack(
            children: [
              SizedBox(
                width: screenWidth,
                height: screenHeight / 1.5,
                child: Obx(
                  () => ListView.builder(
                    padding: EdgeInsets.only(bottom: 10),
                    itemCount: refereeController.refereesdata.length,
                    itemBuilder: (context, index) {
                      var user = refereeController.refereesdata[index];
                      if (user['status'] == 'notReferee') {
                        return MakeReferee(
                          name: user['name'] as String,
                          role: user["role"] as String,
                          imagePath: user["image"] as String,
                          onAddReferee: () {
                            refereeController.showConfirmationDialog(index);
                          },
                        );
                      } else if (user['status'] == 'isReferee') {
                        return RefereeWidget(
                            name: user['name'] as String,
                            role: user['role'] as String,
                            image: user['image'] as String,
                            status: user['status'] as String);
                      } else if (user['status'] == 'invitation') {
                        return InvitationReferee(
                          name: user['name'] as String,
                          imagePath: user['image'] as String,
                        );
                      }
                      return SizedBox.shrink(); // Default if no matching status
                    },
                  ),
                ),
              ),
              Positioned(
                    top: screenHeight / 1.97,
                    child: Container(
                      width: screenWidth,
                      height: screenHeight / 3,
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
                            blurRadius: 10,
                            offset: Offset(2, 4), // Shift to right bottom
                          ),
                          // Light shadow for the top
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, -2), // Shift upwards
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  left: screenWidth * 0.127,
                  top: screenHeight / 1.95,
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
                              "Referee Mode",
                              style: TextStyle(
                                fontSize: screenWidth * 0.040,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: screenWidth / 20),
                        Icon(Icons.chevron_right, color: Colors.grey[600]),
                        Icon(Icons.chevron_right, color: Colors.grey[600]),
                        Icon(Icons.chevron_right, color: Colors.grey[600]),
                      ],
                    ),
                  ),
                ),
            ],
          )),
    );
  }
}
