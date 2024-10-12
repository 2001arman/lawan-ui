import 'package:flutter/material.dart';

class LineupUi extends StatelessWidget {
  const LineupUi({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 50),
        // TabbarWidget(
        //   tabBarTitle: state.tabBarTitle,
        //   tabActive: state.tabActive,
        //   onTap: (title) {
        //     state.tabActive.value = title;
        //     logic.alignmentTabbar(title);
        //   },
        //   alignment: state.activeAlignment,
        // ),
      ],
    );
  }
}
