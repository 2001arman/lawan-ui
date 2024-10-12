class ChatState {
  List<ActionItem> actionItemList = [
    ActionItem(icon: 'assets/icons/headset.svg', name: 'Chat with Admin'),
    ActionItem(icon: 'assets/icons/umbrella.svg', name: 'Bad weather'),
    ActionItem(icon: 'assets/icons/calendar.svg', name: 'Reschedule session'),
  ];
}

class ActionItem {
  final String icon;
  final String name;

  ActionItem({required this.icon, required this.name});
}
