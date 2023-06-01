import '../../../domain/entities/message_entity.dart';
import '../models/message_model.dart';

abstract class BaseMessageDatasource {
  Stream<List<MessageModel>> getMessagesStreamByChatId(String chatId);
  MessageModel sendMessage(MessageEntity message);
  MessageModel updateMessage(MessageEntity message);
  void deleteMessageById(String id);
  List<MessageModel> getMessagesByChatId(String chatId);
}
