import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan_ui/constants/constants_ui.dart';
import 'package:lawan_ui/lobby/controller/lobby_state.dart';

class LobbyController extends GetxController {
  var tabActive = 'Home'.obs;
  var alignment = Alignment.centerLeft.obs;
  var selectedIndex = 0.obs;
  LobbyState state = LobbyState();
  var refereesdata = [
    {
      "name": "Zakri Ibrahim",
      "role": "GK",
      "image": "assets/profiles/photo_1.jpg",
      "status": "isReferee"
    },
    {
      "name": "Sarah Yahya",
      "role": "GK",
      "image": "assets/profiles/photo_2.jpg",
      "status": "notReferee"
    },
    {
      "name": "Carl Shakir",
      "role": "DF",
      "image": "assets/profiles/photo_3.jpg",
      "status": "notReferee"
    },
    {
      "name": "Joe Chin",
      "role": "MF",
      "image": "assets/profiles/photo_4.jpg",
      "status": "invitation"
    },
    {
      "name": "Chee Siew",
      "role": "GK",
      "image": "assets/profiles/photo_3.jpg",
      "status": "invitation"
    },
  ].obs;

  void changePage(int index) {
    selectedIndex.value = index;    
  }  

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Referee':
        state.activeAlignment.value = Alignment.center;
        break;
      case 'Away':
        state.activeAlignment.value = Alignment.centerRight;
        break;
      default:
        state.activeAlignment.value = Alignment.centerLeft;
        break;
    }
  }

  void makeReferee(int index) {
    var updatedUsers = [...refereesdata];
    for (int i = 0; i < refereesdata.length; i++) {
      if (i == index) {
        refereesdata[i]['status'] = 'isReferee';
      } else if (refereesdata[i]['status'] == 'isReferee') {
        refereesdata[i]['status'] = 'notReferee';
      }
    }
    refereesdata.value = updatedUsers;
  }

  // Method untuk mengatur alignment lobby
  void lobbyAlignmentTabbar(String title) {
    switch (title) {
      case 'Line-Up':
        state.lobbyActiveAlignment.value = Alignment.centerLeft;
        break;
      default:
        state.lobbyActiveAlignment.value = Alignment.centerRight;
        break;
    }
  }

  void onTabTap(String title, PageController pageController) {
    tabActive.value = title; // Update tab aktif
    alignmentTabbar(title); // Update alignment tab bar
    switch (title) {
      case 'Home':
        pageController.animateToPage(0,
            duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        break;
      case 'Referee':
        pageController.animateToPage(1,
            duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        break;
      case 'Away':
        pageController.animateToPage(2,
            duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        break;
      default:
        break;
    }
  }

  void showConfirmationDialog(int index) {
    var userName = refereesdata[index]['name'];

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: 600, // 90% dari lebar layar
          height: 250,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Membuat tombol mengikuti lebar dialog
            children: [
              Center(
                child: Text(
                  'Assign $userName as the referee?',
                  style: TextStyle(
                      fontFamily: 'Lufga',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'This will give him/her referee permissions for the match.',
                style: blacklobbyTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15), // Button height
                  backgroundColor:
                      Colors.grey[200], // Background color for cancel
                ),
                onPressed: () {
                  Get.back(); // Dismiss dialog
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                  padding: EdgeInsets.symmetric(vertical: 15), // Button height
                ),
                onPressed: () {
                  // Action when confirmed
                  makeReferee(index);
                  Get.back(); // Dismiss dialog
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false, // Prevent dismiss on tap outside
    );
  }
}
