part of 'chats_bloc.dart';

abstract class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object> get props => [];
}

class ChatsLoading extends ChatsState {}

class ChatsLoaded extends ChatsState {
  final List<ChatEntity> chats;

  const ChatsLoaded({required this.chats});

  @override
  List<Object> get props => [chats];
}
