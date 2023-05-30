import '../models/chat_model.dart';

abstract class BaseChatDatasource {
  ChatModel getChatById(String chatId);
  List<ChatModel> getUserChats(String userId);
  void deleteChatById(String chatId);
  void pinChatById(String chatId);
}
