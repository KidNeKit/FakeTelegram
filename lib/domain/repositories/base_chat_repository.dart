import '../entities/chat_entity.dart';

abstract class BaseChatRepository {
  ChatEntity getChatById(String chatId);
  List<ChatEntity> getUserChats(String userId);
  void deleteChatById(String chatId);
  void pinChatById(String chatId);
}
