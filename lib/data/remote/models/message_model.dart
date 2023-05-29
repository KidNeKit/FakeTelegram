import '../../../domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({required super.text, required super.chatId, super.id});
}
