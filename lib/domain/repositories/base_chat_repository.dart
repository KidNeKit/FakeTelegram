import '../entities/chat_entity.dart';

abstract class BaseChatRepository {
  Future<ChatEntity?> getChatById(String chatId);
  Future<List<ChatEntity>> getUserChats(String userId);
  void deleteChatById(String chatId);
  void pinChatById(String chatId);
}
