part of 'active_chat_bloc.dart';

abstract class ActiveChatEvent extends Equatable {
  const ActiveChatEvent();

  @override
  List<Object> get props => [];
}

class ChatOpened extends ActiveChatEvent {
  final ChatEntity chat;

  const ChatOpened(this.chat);

  @override
  List<Object> get props => [chat];
}

class ChatClosed extends ActiveChatEvent {}
