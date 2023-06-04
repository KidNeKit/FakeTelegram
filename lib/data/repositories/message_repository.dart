import '../../domain/entities/message_entity.dart';
import '../../domain/repositories/base_message_repository.dart';
import '../remote/datasources/base_message_datasource.dart';

class MessageRepository extends BaseMessageRepository {
  final BaseMessageDatasource _messageDatasource;

  MessageRepository(this._messageDatasource);

  @override
  void deleteMessageById(String id) {
    _messageDatasource.deleteMessageById(id);
  }

  @override
  Future<List<MessageEntity>> getMessagesByChatId(String chatId) {
    return _messageDatasource.getMessagesByChatId(chatId);
  }

  @override
  MessageEntity sendMessage(MessageEntity message) {
    return _messageDatasource.sendMessage(message);
  }

  @override
  MessageEntity updateMessage(MessageEntity message) {
    return _messageDatasource.updateMessage(message);
  }

  @override
  Stream<List<MessageEntity>> getMessagesStreamByChatId(String chatId) {
    return _messageDatasource.getMessagesStreamByChatId(chatId);
  }
}
