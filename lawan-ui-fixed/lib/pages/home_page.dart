import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:referee_app/controller/controller.dart';
import 'package:referee_app/pages/lobby_away.dart';
import 'package:referee_app/pages/lobby_home.dart';
import 'package:referee_app/pages/lobby_refree.dart';
import 'package:referee_app/widget/circle_button.dart';
import 'package:referee_app/widget/custom_button.dart';
import 'package:referee_app/widget/home_away.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> isSelected = [true, false];
  List<bool> isSelecteds = [true, false, false]; // Track selected state
  final NavigationController navController = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar untuk membuat desain responsif
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Mengatur ukuran berdasarkan proporsi
    final double padding = screenWidth * 0.015; // 1.5% dari lebar layar
    final double avatarRadius = screenWidth * 0.1; // 10% dari lebar layar
    final double buttonHeight = screenHeight *
        0.04; // Mengurangi tinggi tombol menjadi 4% dari tinggi layar
    final double buttonWidth = screenWidth *
        0.35; // Memperpendek lebar tombol menjadi 35% dari lebar layar

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, // Mulai dari sudut kiri atas
            end: Alignment.centerRight, // Berakhir di sudut kanan bawah
            colors: [
              Colors.grey.shade800,
              Color(0xFF44D8BE),
              Colors.grey.shade300, // Warna awal
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: padding + 30),
          child: Column(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.white, width: 2), // Border putih
                        ),
                        child: CircleAvatar(
                          radius: avatarRadius -
                              13, // Ukuran diameter lingkaran responsif
                          backgroundColor:
                              Colors.transparent, // Warna latar belakang
                          child: IconButton(
                            icon: Icon(Icons.chevron_left),
                            color: Colors.white, // Warna ikon arrow
                            onPressed: () {
                              // Aksi ketika button diklik
                              Get.back();
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: padding),
                      child: Container(
                        padding: EdgeInsets.all(padding),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ToggleButtons(
                          borderRadius: BorderRadius.circular(25),
                          borderWidth: 2,
                          borderColor: Colors.black,
                          selectedBorderColor: Colors.white,
                          selectedColor: Colors.black,
                          fillColor: Colors.white,
                          color: Colors.white,
                          isSelected: isSelected,
                          onPressed: (int index) {
                            setState(() {
                              for (int i = 0; i < isSelected.length; i++) {
                                isSelected[i] = i == index;
                              }
                            });
                          },
                          constraints: BoxConstraints.expand(
                            width: buttonWidth, // Lebar tombol responsif
                            height: buttonHeight, // Tinggi tombol responsif
                          ),
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: padding *
                                      0.5), // Mengurangi padding horizontal
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.people_alt),
                                  SizedBox(
                                      width: screenWidth *
                                          0.01), // 1% dari lebar layar
                                  Text('Line-Up'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: padding *
                                      0.5), // Mengurangi padding horizontal
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.chat_bubble_outline),
                                  SizedBox(
                                      width: screenWidth *
                                          0.01), // 1% dari lebar layar
                                  Text('Chat'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: screenWidth - 360),
                padding: EdgeInsets.symmetric(horizontal: padding + 10),
                width: double.infinity,
                height: screenHeight - 650,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyHomeAwayLogo(title: "Home"),
                    SizedBox(width: screenWidth / 100),
                    Text(
                      "0",
                      style: GoogleFonts.poppins(
                        fontSize: avatarRadius + 13,
                      ),
                    ),
                    SizedBox(width: screenWidth / 30),
                    Text(
                      ":",
                      style: GoogleFonts.poppins(
                        fontSize: avatarRadius + 13,
                      ),
                    ),
                    SizedBox(width: screenWidth / 30),
                    Text(
                      "0",
                      style: GoogleFonts.poppins(
                        fontSize: avatarRadius + 13,
                      ),
                    ),
                    SizedBox(width: screenWidth / 100),
                    MyHomeAwayLogo(title: "Away"),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight / 15.5,
                padding: EdgeInsets.symmetric(vertical: padding),
                margin: EdgeInsets.symmetric(horizontal: padding + 5),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => CustomButton(
                          label: "Home",
                          isSelected: navController.selectedIndex.value == 0,
                          onTap: () => navController.changePage(0),
                          isSmall: false,
                        )),
                    Obx(() => CircleButton(
                        icon: Icons.sports, 
                        isSelected: navController.selectedIndex.value == 1, 
                        onTap: () => navController.changePage(1),
                        )),
                    Obx(() => CustomButton(
                          label: "Away",
                          isSelected: navController.selectedIndex.value == 2,
                          onTap: () => navController.changePage(2),
                          isSmall: false,
                        )),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight/1.5,
                color: Colors.transparent,
                child: Obx(
                  () => IndexedStack(
                    index: navController.selectedIndex.value,
                    children: [
                      MyLobbyHome(),
                      MyLobbyRefree(),
                      MyLobbyAway(),
                    ]
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
