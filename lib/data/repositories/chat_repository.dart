import '../../domain/entities/chat_entity.dart';
import '../../domain/repositories/base_chat_repository.dart';
import '../remote/datasources/base_chat_datasource.dart';

class ChatRepository extends BaseChatRepository {
  final BaseChatDatasource _chatDatasource;

  ChatRepository(BaseChatDatasource chatDatasource)
      : _chatDatasource = chatDatasource;

  @override
  void deleteChatById(String chatId) => _chatDatasource.deleteChatById(chatId);

  @override
  Future<ChatEntity?> getChatById(String chatId) async =>
      await _chatDatasource.getChatById(chatId);

  @override
  Future<List<ChatEntity>> getUserChats(String userId) async =>
      await _chatDatasource.getUserChats(userId);

  @override
  void pinChatById(String chatId) => _chatDatasource.pinChatById(chatId);
}
