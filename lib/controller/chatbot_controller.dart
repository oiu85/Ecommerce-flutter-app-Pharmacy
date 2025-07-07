import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../linkapi.dart';

class ChatBotController extends GetxController {

  late bool isTypeing = false;
  var messages = <Map<String, String>>[].obs;
  var showChat = false.obs;
  final TextEditingController textController = TextEditingController();

  Future<void> sendMessage(String text) async {

    messages.add({"role": "user", "text": text});

    try {
      isTypeing = true;
      final res = await http.post(
        Uri.parse(AppLink.chatbot),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"message": text}),
      );

      final data = jsonDecode(res.body);
      final reply = data["reply"] ?? "لا يوجد رد.";

      messages.add({"role": "bot", "text": reply});
      isTypeing = false;
    } catch (e) {
      messages.add({"role": "bot", "text": "حدث خطأ أثناء الإرسال."});
    }

    textController.clear();
  }

  void closeChat() {
    showChat.value = false;
    messages.clear();

  }

}
