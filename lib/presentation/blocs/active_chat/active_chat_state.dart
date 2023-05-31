part of 'active_chat_bloc.dart';

class ActiveChatState extends Equatable {
  final ChatEntity? chat;

  const ActiveChatState({this.chat});

  ActiveChatState copyWith(ChatEntity? chat) {
    return ActiveChatState(chat: chat ?? this.chat);
  }

  @override
  List<Object?> get props => [chat];
}
