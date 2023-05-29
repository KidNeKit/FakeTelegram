import '../entities/message_entity.dart';

abstract class BaseMessageRepository {
  MessageEntity sendMessage(MessageEntity message);
  MessageEntity updateMessage(MessageEntity message);
  void deleteMessageById(String id);
  List<MessageEntity> getMessagesByChatId(String chatId);
}
