import '../../../domain/entities/dto/user_dto.dart';
import '../../../domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({
    required super.text,
    required super.chatId,
    required super.user,
    required super.sendTime,
    super.messageId,
    super.isModified,
    super.isRead,
  });

  factory MessageModel.fromJson(Map<String, dynamic> map) => MessageModel(
        messageId: map['messageId'],
        text: map['text'],
        chatId: map['chatId'],
        user: UserDTO.fromJson(map['user']),
        sendTime: map['sendTime'],
        isRead: map['isRead'],
        isModified: map['isModified'],
      );
}
