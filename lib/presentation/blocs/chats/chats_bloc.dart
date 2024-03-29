import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/chat_entity.dart';
import '../../../domain/repositories/base_chat_repository.dart';
import '../../../domain/repositories/base_message_repository.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final BaseChatRepository _chatRepository;
  final BaseMessageRepository _messageRepository;

  StreamSubscription? _chatsSubscription;

  ChatsBloc(BaseChatRepository chatRepository,
      BaseMessageRepository messageRepository)
      : _chatRepository = chatRepository,
        _messageRepository = messageRepository,
        super(ChatsLoadingState()) {
    on<ChatsUpdated>(_chatsUpdated);
    on<ChatsFetched>(_chatsFetched);
  }

  void _chatsUpdated(ChatsUpdated event, Emitter<ChatsState> emit) {
    emit(ChatsLoadingState());
    _chatsSubscription?.cancel();
    _chatsSubscription =
        _chatRepository.getChatsStream(event.userId).listen((chats) async {
      for (var chat in chats) {
        chat.updateMessages =
            await _messageRepository.getMessagesByChatId(chat.chatId!);
      }
      add(ChatsFetched(chats: chats));
    });
  }

  void _chatsFetched(ChatsFetched event, Emitter<ChatsState> emit) {
    emit(ChatsLoadedState(chats: event.chats));
  }

  @override
  Future<void> close() {
    _chatsSubscription?.cancel();
    return super.close();
  }
}
