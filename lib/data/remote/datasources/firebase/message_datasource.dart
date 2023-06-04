import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_telegram/data/remote_constants.dart';

import '../../../../domain/entities/message_entity.dart';
import '../../models/message_model.dart';
import '../base_message_datasource.dart';

class MessageDatasource extends BaseMessageDatasource {
  final FirebaseFirestore _firestore;

  MessageDatasource(FirebaseFirestore firestore) : _firestore = firestore;

  @override
  void deleteMessageById(String id) {
    // TODO: implement deleteMessageById
  }

  @override
  Future<List<MessageModel>> getMessagesByChatId(String chatId) async {
    var messagesRef = await _firestore
        .collection(firebaseChatsPath)
        .doc(chatId)
        .collection(firebaseMessagesPath)
        .get();
    return messagesRef.docs
        .map((message) => MessageModel.fromJson(message.data()))
        .toList();
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

  @override
  Stream<List<MessageModel>> getMessagesStreamByChatId(String chatId) {
    _firestore
        .collection(firebaseChatsPath)
        .doc(chatId)
        .collection('')
        .snapshots();
    throw UnimplementedError();
  }
}
