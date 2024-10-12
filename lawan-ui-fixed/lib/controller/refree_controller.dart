import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RefereeController extends GetxController {
  // List of referees data

  var refereesdata = [
    {
      "name": "Zakri Ibrahim",
      "role": "GK",
      "image": "assets/photo_1.jpg",
      "status": "isReferee"
    },
    {
      "name": "Sarah Yahya",
      "role": "GK",
      "image": "assets/photo_2.jpg",
      "status": "notReferee"
    },
    {
      "name": "Carl Shakir",
      "role": "DF",
      "image": "assets/photo_3.jpg",
      "status": "notReferee"
    },
    {
      "name": "Joe Chin",
      "role": "MF",
      "image": "assets/photo_4.jpg",
      "status": "invitation"
    },
    {
      "name": "Chee Siew",
      "role": "GK",
      "image": "assets/photo_3.jpg",
      "status": "invitation"
    },
  ].obs;

  void makeReferee(int index) {
    var updatedUsers = [...refereesdata];
    for (int i = 0; i < refereesdata.length; i++) {
      if (i == index) {
        refereesdata[i]['status'] = 'isReferee';
        refereesdata.value = updatedUsers;
      } else if (refereesdata[i]['status'] == 'isReferee') {
        refereesdata[i]['status'] = 'notReferee';
        refereesdata.value = updatedUsers;
      }
    }

    update();
  }

  // Method untuk menampilkan snackbar

  void showConfirmationDialog(int index) {
    var userName = refereesdata[index]['name'];

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          // Menyesuaikan panjang dialog
          width: Get.width, // 90% dari lebar layar
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Membuat tombol mengikuti lebar dialog
            children: [
              Text(
                'Assign $userName as the referee?',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'This will give him/her referee permissions for the match.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 10),
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
            ],
          ),
        ),
      ),
      barrierDismissible: false, // Prevent dismiss on tap outside
    );
  }
}
