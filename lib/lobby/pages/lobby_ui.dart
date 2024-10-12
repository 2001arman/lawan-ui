import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan_ui/constants/constants_ui.dart';
import 'package:lawan_ui/lobby/chat/chat_ui.dart';
import 'package:lawan_ui/lobby/controller/lobby_controller.dart';
import 'package:lawan_ui/lobby/lineup/lineup_ui.dart';

import '../../widgets/tab_bar_widget.dart';

class LobbyUi extends StatelessWidget {
  final logic = Get.put(LobbyController());
  final state = Get.put(LobbyController()).state;
  LobbyUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget body() {
      switch (state.lobbyTabActive.value) {
        case 'Line-Up':
          return const LineupUi();
        default:
          return ChatUi();
      }
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.7,
              decoration: BoxDecoration(
                gradient: backgroundGradient,
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 20),
                TabbarWidget(
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
                Obx(() => body())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
