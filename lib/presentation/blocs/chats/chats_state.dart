part of 'chats_bloc.dart';

abstract class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object> get props => [];
}

class ChatsLoadingState extends ChatsState {}

class ChatsLoadedState extends ChatsState {
  final List<ChatEntity> chats;

  const ChatsLoadedState({required this.chats});

  @override
  List<Object> get props => [chats];
}
