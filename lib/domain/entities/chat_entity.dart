import 'message_entity.dart';

class ChatEntity {
  String? chatId;
  List<MessageEntity> messages = [];
  List<String> users = [];
}
