import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan_ui/constants/constants_ui.dart';
import 'package:lawan_ui/lobby/controller/lobby_controller.dart';
import 'package:lawan_ui/lobby/pages/lobby_away.dart';
import 'package:lawan_ui/lobby/pages/lobby_home.dart';
import 'package:lawan_ui/lobby/pages/lobby_referee.dart';
import 'package:lawan_ui/widgets/circle_button.dart';
import 'package:lawan_ui/widgets/custom_tab_button.dart';
import 'package:lawan_ui/widgets/home_away.dart';

import '../../widgets/tab_bar_widget.dart';

class LobbyUi extends StatelessWidget {
  final logic = Get.put(LobbyController());
  final state = Get.put(LobbyController()).state;
  LobbyUi({super.key});
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double padding = screenWidth * 0.015;
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.001, 
                0.2, 
                0.5,
              ],
              colors: [
                Color(0xFF4F6466),
                Color(0xFFA1C2BE),
                Colors.grey.shade300,
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white, width: 2), // Border putih
                    ),
                    child: CircleAvatar(
                      radius: 20, // Ukuran diameter lingkaran responsif
                      backgroundColor:
                          Colors.transparent, // Warna latar belakang
                      child: IconButton(
                        icon: Icon(Icons.chevron_left),
                        color: Colors.white, // Warna ikon arrow/
                        onPressed: () {
                          // Aksi ketika button diklik
                          Get.back();
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 280,
                    height: 55,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TabbarWidget(
                      tabBarTitle: state.lobbyTabBarTitle,
                      tabActive: state.lobbyTabActive,
                      backgroundColor: kBlackColor,
                      onTap: (title) {
                        state.lobbyTabActive.value = title;
                        logic.lobbyAlignmentTabbar(title);
                      },
                      alignment: state.lobbyActiveAlignment,
                      textInActiveColor: kWhiteColor,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyHomeAwayLogo(title: "Home"),
                    SizedBox(width: 20),
                    Text("0", style: iconTextStyle),
                    SizedBox(width: 25),
                    Text(
                      ":",
                      style: iconTextStyle,
                    ),
                    SizedBox(width: 25),
                    Text("0", style: iconTextStyle),
                    SizedBox(width: 20),
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
                  color: Color(0xFFDEE1E2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => CustomButton(
                          label: "Home",
                          isSelected: logic.selectedIndex.value == 0,
                          onTap: () => logic.changePage(0),
                          isSmall: false,
                        )),
                    Obx(() => CircleButton(
                          icon: Icons.sports,
                          isSelected: logic.selectedIndex.value == 1,
                          onTap: () => logic.changePage(1),
                        )),
                    Obx(() => CustomButton(
                          label: "Away",
                          isSelected: logic.selectedIndex.value == 2,
                          onTap: () => logic.changePage(2),
                          isSmall: false,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() =>
                    IndexedStack(index: logic.selectedIndex.value, children: [
                      MyLobbyHome(),
                      MyLobbyRefree(),
                      MyLobbyAway(),
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
