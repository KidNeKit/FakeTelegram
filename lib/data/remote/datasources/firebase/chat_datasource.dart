import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/chat_model.dart';
import '../base_chat_datasource.dart';

class ChatDatasource extends BaseChatDatasource {
  FirebaseFirestore _firestore;

  ChatDatasource(FirebaseFirestore firestore) : _firestore = firestore;

  @override
  void deleteChatById(String chatId) {
    // TODO: implement deleteChatById
  }

  @override
  ChatModel getChatById(String chatId) {
    // TODO: implement getChatById
    throw UnimplementedError();
  }

  @override
  List<ChatModel> getUserChats(String userId) {
    // TODO: implement getUserChats
    throw UnimplementedError();
  }

  @override
  void pinChatById(String chatId) {
    // TODO: implement pinChatById
  }
}
