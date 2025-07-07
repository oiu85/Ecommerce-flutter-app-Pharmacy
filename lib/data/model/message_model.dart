// lib/models/message_model.dart

class Message {
  final int id;
  final int senderId;
  final int receiverId;
  final String message;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: int.parse(json["id"].toString()), // التأكد من أن الـ ID هو int
      senderId: int.parse(json["sender_id"].toString()),
      receiverId: int.parse(json["receiver_id"].toString()),
      message: json["message"],
      timestamp: DateTime.parse(json["timestamp"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "sender_id": senderId,
      "receiver_id": receiverId,
      "message": message,
      "timestamp": timestamp.toIso8601String(),
    };
  }
}

