import 'package:ecommerce_app/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/chatbot_controller.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class ChatBotBubble extends StatelessWidget {
  const ChatBotBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const  String warningMessage = "🛑 تنبيه هام قبل المتابعة:\nيرجى العلم أن هذه المحادثة يتم توليدها بواسطة نظام ذكاء اصطناعي، وليست بديلاً عن استشارة الطبيب أو الصيدلي المختص.\nيُنصح باستخدام هذه الخدمة فقط في حال تعذّر التواصل مع الصيدلي أو تأخره في الرد.\nقد لا تكون الإجابات دقيقة بشكل كامل، وهي لأغراض معلوماتية فقط.\nلا تعتمد بشكل نهائي على محتوى الذكاء الاصطناعي لاتخاذ قرارات طبية.\nاستشر الطبيب أو الصيدلي المختص دائماً قبل استخدام أي دواء أو اتخاذ أي إجراء متعلق بصحتك.\nنعمل باستمرار على تحسين هذه الخدمة لتقديم أفضل تجربة ممكنة.";
    final controller = Get.put(ChatBotController());
    final scrollController = ScrollController();

    // التمرير إلى أسفل القائمة عند إضافة رسائل جديدة
    void scrollToBottom() {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    }

    // عرض تحذير قبل فتح المحادثة
    void showChatWarning() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "تنبيه",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          content: const Text(
            warningMessage,
            textAlign: TextAlign.center,
            style: TextStyle(height: 1.5),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                controller.showChat.value = true;
              },
              child: const Text("موافق"),
            ),
          ],
        ),
      );
    }

    // استدعاء التمرير عند تغيير الرسائل
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());

    return Obx(() => Stack(
      children: [
        if (controller.showChat.value)
          Positioned.fill(
            child: GestureDetector(
              onTap: controller.closeChat,
              child: Container(color: Colors.black.withOpacity(0.5)),
            ),
          ),
        if (controller.showChat.value)
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.all(20),
              width: 320,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: Column(
                children: [
                  // رأس الشات
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade600,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.smart_toy_rounded,
                              color: Colors.blue.shade600,
                              size: 24,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "مساعد الذكاء الاصطناعي",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "متصل الآن",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: controller.closeChat,
                        ),
                      ],
                    ),
                  ),
                  
                  // محتوى الشات
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        image: const DecorationImage(
                          image: AssetImage(AppImageAsset.chatbotimage),
                          fit: BoxFit.cover,
                          opacity: 0.1,
                        ),
                      ),
                      child: controller.messages.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset(
                                    AppImageAsset.chatbotjson,
                                    width: 150,
                                    height: 150,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "مرحباً! كيف يمكنني مساعدتك اليوم؟",
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 16,
                                    ),
                                  ),
                                  
                                ],
                              ),
                            )
                          : ListView.builder(
                              controller: scrollController,
                              padding: const EdgeInsets.all(15),
                              itemCount: controller.messages.length,
                              itemBuilder: (context, index) {
                                final msg = controller.messages[index];
                                final bool isUser = msg["role"] == "user";
                                final time = msg["time"] ?? DateFormat('HH:mm').format(DateTime.now());
                                
                                return Align(
                                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                                    ),
                                    margin: const EdgeInsets.symmetric(vertical: 8),
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: isUser 
                                          ? Colors.blue.shade600 
                                          : Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(15),
                                        topRight: const Radius.circular(15),
                                        bottomLeft: isUser ? const Radius.circular(15) : const Radius.circular(0),
                                        bottomRight: isUser ? const Radius.circular(0) : const Radius.circular(15),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 5,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          msg["text"] ?? '',
                                          style: TextStyle(
                                            color: isUser ? Colors.white : Colors.black87,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            time,
                                            style: TextStyle(
                                              color: isUser ? Colors.white70 : Colors.grey,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                  
                  // حالة الكتابة
                  if (controller.isTypeing)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          const Text(
                            "جاري الكتابة",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 5),
                          _buildTypingIndicator(),
                        ],
                      ),
                    ),
                  
                  // مدخل الرسائل
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.attach_file,
                            color: Colors.blue.shade400,
                          ),
                          onPressed: () {
                            // إضافة وظيفة إرفاق الملفات هنا
                          },
                        ),
                        Expanded(
                          child: TextField(
                            controller: controller.textController,
                            decoration: InputDecoration(
                              hintText: "اكتب رسالتك هنا...",
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            ),
                            maxLines: null,
                            textInputAction: TextInputAction.send,
                            onSubmitted: (text) {
                              if (text.trim().isNotEmpty) {
                                controller.sendMessage(text.trim());
                              }
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Colors.blue.shade600,
                          ),
                          onPressed: () {
                            if (controller.textController.text.trim().isNotEmpty) {
                              controller.sendMessage(controller.textController.text.trim());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        Positioned(
          left: 20,
          bottom: 120,
          child: FloatingActionButton(
            heroTag: "_tag1",
            onPressed: () {
              if (!controller.showChat.value) {
                showChatWarning();
              } else {
                controller.showChat.toggle();
              }
            },
            backgroundColor: Colors.blue.shade600,
            elevation: 5,
            child: Icon(
              controller.showChat.value ? Icons.close : Icons.chat,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ));
  }
  
  Widget _buildTypingIndicator() {
    return Row(
      children: List.generate(
        3,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(milliseconds: 400 + (index * 200)),
            curve: Curves.easeInOut,
            builder: (context, double value, child) {
              return Transform.scale(
                scale: 0.5 + (value * 0.5),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
