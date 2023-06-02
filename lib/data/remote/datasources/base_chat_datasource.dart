import '../models/chat_model.dart';

abstract class BaseChatDatasource {
  Future<ChatModel?> getChatById(String chatId);
  Future<List<ChatModel>> getUserChats(String userId);
  void deleteChatById(String chatId);
  void pinChatById(String chatId);
  Stream<List<ChatModel>> getChatsStream(String userId);
}
