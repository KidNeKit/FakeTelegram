import '../../../domain/entities/chat_entity.dart';

class ChatModel extends ChatEntity {
  ChatModel({super.chatId, super.members, super.messages});

  factory ChatModel.fromJson(Map<String, dynamic> map) => ChatModel(
        chatId: map['chatId'],
        members: List.from(map['members']),
      );
}
