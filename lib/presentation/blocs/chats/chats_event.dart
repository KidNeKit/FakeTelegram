part of 'chats_bloc.dart';

abstract class ChatsEvent extends Equatable {
  const ChatsEvent();

  @override
  List<Object> get props => [];
}

class ChatsUpdated extends ChatsEvent {}

class ChatsFetched extends ChatsEvent {
  final List<ChatEntity> chats;

  const ChatsFetched({required this.chats});

  @override
  List<Object> get props => [chats];
}
