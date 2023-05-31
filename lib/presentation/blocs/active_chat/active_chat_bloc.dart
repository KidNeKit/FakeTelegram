import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/chat_entity.dart';

part 'active_chat_event.dart';
part 'active_chat_state.dart';

class ActiveChatBloc extends Bloc<ActiveChatEvent, ActiveChatState> {
  ActiveChatBloc() : super(const ActiveChatState()) {
    on<ChatOpened>(_onChatOpened);
    on<ChatClosed>(_onChatClosed);
  }

  void _onChatOpened(ChatOpened event, Emitter<ActiveChatState> emit) {
    emit(state.copyWith(event.chat));
  }

  void _onChatClosed(ChatClosed event, Emitter<ActiveChatState> emit) {
    emit(const ActiveChatState());
  }
}
