import '../../../domain/entities/chat_entity.dart';

class ChatModel extends ChatEntity {
  ChatModel({super.chatId});

  factory ChatModel.fromJson(Map<String, dynamic> map) {
    return ChatModel(chatId: map['chatId']);
  }
}
