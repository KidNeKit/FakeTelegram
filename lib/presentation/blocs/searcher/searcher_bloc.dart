import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/repositories/base_user_repository.dart';

part 'searcher_event.dart';
part 'searcher_state.dart';

class SearcherBloc extends Bloc<SearcherEvent, SearcherState> {
  final BaseUserRepository _userRepository;

  SearcherBloc({required BaseUserRepository userRepository})
      : _userRepository = userRepository,
        super(SearcherState.initial()) {
    on<UserSearched>(_onUserSearched);
  }

  void _onUserSearched(UserSearched event, Emitter<SearcherState> emit) async {
    log('{SearcherBloc-UserSearched Event} Searching user ${event.request}');
    List<UserEntity> users =
        await _userRepository.getSuggestedUsersByLogin(event.request);
    log('{SearcherBloc-UserSearched Event} Searching Results: $users');
    emit(state.copyWith(users: users));
  }
}
