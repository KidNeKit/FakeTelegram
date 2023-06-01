import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import '../../../domain/repositories/base_message_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/chat_entity.dart';

part 'active_chat_event.dart';
part 'active_chat_state.dart';

class ActiveChatBloc extends Bloc<ActiveChatEvent, ActiveChatState> {
  final BaseMessageRepository _messageRepository;
  StreamSubscription? _messagesSubscription;

  ActiveChatBloc(BaseMessageRepository messageRepository)
      : _messageRepository = messageRepository,
        super(const ActiveChatState()) {
    on<ChatOpened>(_onChatOpened);
    on<ChatClosed>(_onChatClosed);
  }

  void _onChatOpened(ChatOpened event, Emitter<ActiveChatState> emit) {
    _messagesSubscription?.cancel();
    ChatEntity chat = event.chat;
    if (chat.chatId == null) {
      //todo create new chat
    } else {
      _messagesSubscription = _messageRepository
          .getMessagesStreamByChatId(event.chat.chatId!)
          .listen((event) {
        log(event.toString());
      });
    }
    emit(state.copyWith(event.chat));
  }

  void _onChatClosed(ChatClosed event, Emitter<ActiveChatState> emit) {
    emit(const ActiveChatState());
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }
}
