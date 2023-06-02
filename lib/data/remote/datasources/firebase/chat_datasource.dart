import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../remote_constants.dart';
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
  Future<ChatModel?> getChatById(String chatId) async {
    var chatData =
        await _firestore.collection(firebaseChatsPath).doc(chatId).get();
    return chatData.exists ? ChatModel.fromJson(chatData.data()!) : null;
  }

  @override
  Future<List<ChatModel>> getUserChats(String userId) async {
    // TODO: implement getUserChats
    throw UnimplementedError();
  }

  @override
  void pinChatById(String chatId) {
    // TODO: implement pinChatById
  }

  @override
  Stream<List<ChatModel>> getChatsStream(String userId) {
    return _firestore
        .collection(firebaseChatsPath)
        .where('members', arrayContains: userId)
        .snapshots()
        .map((event) =>
            event.docs.map((doc) => ChatModel.fromJson(doc.data())).toList());
  }
}
