import '../../../../domain/entities/message_entity.dart';
import '../../models/message_model.dart';
import '../base_message_datasource.dart';

class MessageDatasource extends BaseMessageDatasource {
  @override
  void deleteMessageById(String id) {
    // TODO: implement deleteMessageById
  }

  @override
  List<MessageModel> getMessagesByChatId(String chatId) {
    // TODO: implement getMessagesByChatId
    throw UnimplementedError();
  }

  @override
  MessageModel sendMessage(MessageEntity message) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }

  @override
  MessageModel updateMessage(MessageEntity message) {
    // TODO: implement updateMessage
    throw UnimplementedError();
  }
}