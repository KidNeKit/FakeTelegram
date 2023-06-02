import 'dart:convert';

import 'message_entity.dart';

class ChatEntity {
  String? _chatId;
  final List<MessageEntity> _messages;
  final List<String> _members;

  ChatEntity({
    String? chatId,
    List<MessageEntity>? messages,
    List<String>? members,
  })  : _chatId = chatId,
        _messages = messages ?? [],
        _members = members ?? [];

  String? get chatId => _chatId;

  factory ChatEntity.fromJson(Map<String, dynamic> map) => ChatEntity(
        chatId: map['chatId'],
      );

  @override
  String toString() {
    return {'chatId': _chatId}.toString();
  }
}
