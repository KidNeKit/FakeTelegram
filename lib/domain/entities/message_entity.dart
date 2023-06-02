import 'package:cloud_firestore/cloud_firestore.dart';

import 'dto/user_dto.dart';

class MessageEntity {
  final String _chatId;
  final UserDTO _user;
  final Timestamp _sendTime;
  String? _messageId;
  String _text;
  bool _isRead;
  bool _isModified;

  MessageEntity({
    required String chatId,
    required UserDTO user,
    required Timestamp sendTime,
    String? messageId,
    required String text,
    bool isRead = false,
    bool isModified = false,
  })  : _messageId = messageId,
        _chatId = chatId,
        _user = user,
        _text = text,
        _sendTime = sendTime,
        _isRead = isRead,
        _isModified = isModified;

  String? get messageId => _messageId;
  String get text => _text;
  String get chatId => _chatId;
  Timestamp get sendTime => _sendTime;
  bool get isRead => _isRead;
  bool get isModified => _isModified;
  UserDTO get user => _user;

  set updateMessageId(String messageId) => _messageId = messageId;
  set updateText(String text) => _text = text;
  set updateReadStatus(bool isRead) => _isRead = isRead;
  set updateModifiedStatus(bool isModified) => _isModified = isModified;

  Map<String, dynamic> toJson() => {
        'chatId': _chatId,
        'text': _text,
        'user': _user.toJson(),
        'messageId': _messageId,
        'sendTime': _sendTime,
        'isRead': _isRead,
        'isModified': _isModified,
      };

  @override
  String toString() => toJson().toString();
}
