import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_gpt/Models/chat_model.dart';
import 'package:flutter_chat_gpt/Services/api_services.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];
  List<ChatModel> get getChatList {
    return chatList;
  }

  void addUserMessage({required String msg}) {
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers(
      {required String msg, required String choosenModelId}) async {
    if (choosenModelId.toLowerCase().startsWith("gpt")) {
      chatList.addAll(await ApiServices.sendMessageGPT(
        message: msg,
        modelId: choosenModelId,
      ));
    } else {
      chatList.addAll(await ApiServices.sendMessage(
        message: msg,
        modelId: choosenModelId,
      ));
    }
    notifyListeners();
  }
}
