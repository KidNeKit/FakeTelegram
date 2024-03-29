import '../entities/message_entity.dart';

abstract class BaseMessageRepository {
  Stream<List<MessageEntity>> getMessagesStreamByChatId(String chatId);
  MessageEntity sendMessage(MessageEntity message);
  MessageEntity updateMessage(MessageEntity message);
  void deleteMessageById(String id);
  Future<List<MessageEntity>> getMessagesByChatId(String chatId);
}
