import 'message_entity.dart';

class ChatEntity {
  String? _chatId;
  List<MessageEntity> messages = [];
  List<String> users = [];

  ChatEntity({String? chatId}) : _chatId = chatId;

  String? get chatId => _chatId;

  factory ChatEntity.fromJson(Map<String, dynamic> map) => ChatEntity(
        chatId: map['chatId'],
      );
}
