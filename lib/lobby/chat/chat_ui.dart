// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lawan_ui/constants/constants_ui.dart';
import 'package:lawan_ui/lobby/chat/controller/chat_state.dart';
import 'package:lawan_ui/widgets/circle_button_widget.dart';
import 'package:lawan_ui/widgets/custom_text_form_fields.dart';

class ChatUi extends StatelessWidget {
  final state = ChatState();
  ChatUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget containerItem({required String name, required String icon}) {
      return Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: kWhiteColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(icon),
            const SizedBox(height: 4),
            Text(
              name,
              style: blackTextStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
      );
    }

    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/chat.svg',
                    color: kWhiteColor,
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Welcome to the lobby!',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Start the conversation or wait for others to join.',
                    style: blackTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: state.actionItemList
                    .map(
                      (data) => containerItem(name: data.name, icon: data.icon),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: defaultMargin),
            Row(
              children: [
                CircleButtonWidget(
                  onTap: () {},
                  isActive: false,
                  size: 48,
                  widget: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      'assets/icons/paperclip.svg',
                      width: 16,
                      height: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomTextFormField(
                    hintText: 'Write message',
                    controller: TextEditingController(),
                    margin: 0,
                    suffix: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/icons/smile.svg'),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleButtonWidget(
                  onTap: () {},
                  isActive: true,
                  size: 48,
                  widget: Center(
                    child: Icon(
                      Icons.send_outlined,
                      color: kWhiteColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
