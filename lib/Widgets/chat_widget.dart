import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/Constants/constants.dart';
import 'package:flutter_chat_gpt/Services/assets_manager.dart';
import 'package:flutter_chat_gpt/Widgets/text_widget.dart';

class ChatWidget extends StatelessWidget {
  final String? msg;
  final int? chatIndex;

  const ChatWidget({
    super.key,
    this.msg,
    this.chatIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0
              ? AppColors.scaffoldBackgroundColor
              : AppColors.cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetsManager.botImage
                      : AssetsManager.userImage,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextWidget(
                    label: "$msg",
                  ),
                ),
                chatIndex == 0
                    ? const SizedBox.shrink()
                    : Row(
                        children: [
                          InkWell(
                            onTap: () {
                              showMessage("This feature will be added soon");
                            },
                            child: const Icon(
                              Icons.thumb_up_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 3.5),
                          InkWell(
                            onTap: () {
                              showMessage("This feature will be added soon");
                            },
                            child: const Icon(
                              Icons.thumb_down_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
