import '../../../domain/entities/chat_entity.dart';

class ChatModel extends ChatEntity {
  ChatModel({super.chatId, super.members, super.messages});

  factory ChatModel.fromJson(Map<String, dynamic> map) {
    return ChatModel(chatId: map['chatId']);
  }
}
