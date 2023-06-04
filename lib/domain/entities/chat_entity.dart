import 'dart:async';

import 'message_entity.dart';

class ChatEntity {
  final List<String> _members;
  String? _chatId;
  List<MessageEntity> _messages;

  ChatEntity({
    String? chatId,
    List<MessageEntity>? messages,
    List<String>? members,
  })  : _chatId = chatId,
        _messages = messages ?? [],
        _members = members ?? [];

  String? get chatId => _chatId;
  List<String> get members => _members;
  List<MessageEntity> get messages => _messages;

  set updateChatId(String chatId) => _chatId = chatId;
  set updateMessages(List<MessageEntity> messages) => _messages = messages;

  MessageEntity getLastMessagePreview() {
    messages.sort((a, b) => a.sendTime.compareTo(b.sendTime));
    return messages.last;
  }

  Map<String, dynamic> toJson() => {
        'chatId': _chatId,
        'members': _members,
      };

  @override
  String toString() {
    var map = toJson()..addAll({'messages': _messages});
    return map.toString();
  }
}
