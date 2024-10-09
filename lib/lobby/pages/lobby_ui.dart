import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan_ui/constants/constants_ui.dart';
import 'package:lawan_ui/lobby/controller/lobby_controller.dart';

import '../../widgets/tab_bar_widget.dart';

class LobbyUi extends StatelessWidget {
  final logic = Get.put(LobbyController());
  final state = Get.put(LobbyController()).state;
  LobbyUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
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
            const SizedBox(height: 50),
            TabbarWidget(
              tabBarTitle: state.tabBarTitle,
              tabActive: state.tabActive,
              onTap: (title) {
                state.tabActive.value = title;
                logic.alignmentTabbar(title);
              },
              alignment: state.activeAlignment,
            ),
          ],
        ),
      ),
    );
  }
}
