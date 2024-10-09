import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan_ui/lobby/controller/lobby_state.dart';

class LobbyController extends GetxController {
  LobbyState state = LobbyState();

  void alignmentTabbar(String title) {
    switch (title) {
      case 'Hour':
        state.activeAlignment.value = Alignment.center;
        break;
      case 'Rate':
        state.activeAlignment.value = Alignment.centerRight;
        break;
      default:
        state.activeAlignment.value = Alignment.centerLeft;
        break;
    }
    return;
  }

  void lobbyAlignmentTabbar(String title) {
    switch (title) {
      case 'Line-Up':
        state.lobbyActiveAlignment.value = Alignment.centerLeft;
        break;
      default:
        state.lobbyActiveAlignment.value = Alignment.centerRight;
        break;
    }
    return;
  }
}
