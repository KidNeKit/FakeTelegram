import 'message_entity.dart';

class ChatEntity {
  final List<MessageEntity> _messages;
  final List<String> _members;
  String? _chatId;

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

  Map<String, dynamic> toJson() => {
        'chatId': _chatId,
        'members': _members,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
