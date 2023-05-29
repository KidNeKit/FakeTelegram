class MessageEntity {
  String? _id;
  String _text;
  final String _chatId;

  //String sender;
  //Timestamp sendTime;

  MessageEntity({required String text, required String chatId, String? id})
      : _id = id,
        _text = text,
        _chatId = chatId;

  factory MessageEntity.fromJson(Map<String, dynamic> map) => MessageEntity(
        id: map['id'],
        text: map['text'],
        chatId: map['chatId'],
      );

  String? get id => _id;
  String? get text => _text;
  String? get chatId => _chatId;

  set updateText(String text) => _text = text;

  Map<String, dynamic> toJson() => {
        'id': _id,
        'text': _text,
        'chatId': _chatId,
      };
}
