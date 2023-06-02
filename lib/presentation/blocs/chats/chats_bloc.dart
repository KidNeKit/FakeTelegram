import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/chat_entity.dart';
import '../../../domain/repositories/base_chat_repository.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final BaseChatRepository _chatRepository;
  StreamSubscription? _chatsSubscription;

  ChatsBloc(BaseChatRepository chatRepository)
      : _chatRepository = chatRepository,
        super(ChatsLoading()) {
    on<ChatsUpdated>(_chatsUpdated);
    on<ChatsFetched>(_chatsFetched);
  }

  void _chatsUpdated(ChatsUpdated event, Emitter<ChatsState> emit) {
    log('Updating chats');
    _chatsSubscription?.cancel();
    _chatsSubscription = _chatRepository.getChatsStream('1111').listen((event) {
      log('chats listener: $event');
    });
  }

  void _chatsFetched(ChatsFetched event, Emitter<ChatsState> emit) {}
}
