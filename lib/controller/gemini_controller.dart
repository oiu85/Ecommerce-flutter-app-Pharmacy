import 'dart:convert';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatBotGeminiController extends GetxController {
  MyServices myServices = Get.find();
  // حالة الكتابة (typing) رياكتف
  bool isTyping = false;

  // قائمة الرسائل
  var messages = <Map<String, String>>[].obs;

  // عرض أو إخفاء الشات
  var showChat = false.obs;

  // تحكم بنص الإدخال
  final TextEditingController textController = TextEditingController();

  // متغيرات مهمة
  final String geminiApiKey = "AIzaSyB0XDHShVeo4IBZn_09hXUwkHlzTcwtfSw"; // حط مفتاحك هنا


  // بيانات الجلسة والمستخدم (يجب تزويدها قبل الاستخدام)
  late String sessionId;
  late String userId;

  // استدعاء هذه الدالة قبل الاستخدام لتعيين sessionId و userId
  void setSessionAndUser() {
    sessionId = DateTime.now().millisecondsSinceEpoch.toString();
    userId = myServices.sharedPreferences.getString("id")!.toString();
  }

  Future<void> sendMessage(String text) async {
    setSessionAndUser();
    // إضافة رسالة المستخدم
    messages.add({"role": "user", "text": text});
    isTyping = true;

    try {
      // 1- إرسال رسالة لـ Gemini API
      final response = await http.post(
        Uri.parse("https://api.generativeai.google/v1beta2/models/embedded-gemini-1/chat:generate"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $geminiApiKey",
        },
        body: jsonEncode({
          "model": "embedded-gemini-1",
          "messages": [
            {"author": "user", "content": {"text": text}}
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final reply = data["candidates"]?[0]?["content"]?["text"] ?? "لا يوجد رد من Gemini.";

        // إضافة رد البوت
        messages.add({"role": "bot", "text": reply});

        // 2- إرسال البيانات للبك اند PHP لحفظها
        await http.post(
          Uri.parse(AppLink.geminisave),
          headers: {"Content-Type": "application/x-www-form-urlencoded"},
          body: {
            "sessioneid": sessionId,
            "users": userId,
            "question": text,
            "answer": reply,
          },
        );
      } else {
        messages.add({"role": "bot", "text": "حدث خطأ في الرد من Gemini."});
      }
    } catch (e) {
      messages.add({"role": "bot", "text": "حدث خطأ أثناء الإرسال."});
    }

    isTyping = false;
    textController.clear();
  }

  void closeChat() {
    showChat.value = false;
    messages.clear();
  }
}
