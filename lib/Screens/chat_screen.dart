import 'package:flutter/material.dart';
import 'package:flutter_chat_gpt/Constants/constants.dart';
import 'package:flutter_chat_gpt/Models/chat_model.dart';
import 'package:flutter_chat_gpt/Services/assets_manager.dart';
import 'package:flutter_chat_gpt/Services/services.dart';
import 'package:flutter_chat_gpt/Widgets/chat_widget.dart';
import 'package:flutter_chat_gpt/Widgets/text_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isTyping = true;
  late TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.openaiLogo),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await Services.showModalSheet(context: context);
            },
            icon: const Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            ),
          ),
        ],
        title: const Text('Chat-GPT'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                // shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return ChatWidget(
                    msg: "${chatMessages[index]["msg"]}",
                    chatIndex: int.parse("${chatMessages[index]["chatIndex"]}"),
                  );
                },
              ),
            ),

            ///Spin Kit Loader
            if (isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18,
              ),

              ///SizedBox
              const SizedBox(height: 20),

              ///Creates a piece of material.
              Material(
                color: AppColors.cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.grey),
                          controller: textEditingController,
                          onSubmitted: (v) {
                            ///
                          },
                          decoration: const InputDecoration.collapsed(
                            hintText: "Hello, How Can I Help You?",
                            hintStyle: TextStyle(color: Colors.grey),
                            // border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
