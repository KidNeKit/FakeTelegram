import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/repositories/base_user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final BaseUserRepository _userRepository;
  StreamSubscription? _streamSubscription;

  AuthBloc(BaseUserRepository userRepository)
      : _userRepository = userRepository,
        super(const AuthState.unauthenticated()) {
    on<UserChanged>(onUserChanged);
    on<LogoutRequested>(onLogoutRequested);

    _streamSubscription = _userRepository.currentUser.listen((firebaseUser) {
      log('Receiving firebase user in listener: $firebaseUser');
      add(UserChanged(firebaseUser));
    });
  }

  void onUserChanged(UserChanged event, Emitter<AuthState> emit) async {
    if (event.user == null) {
      emit(const AuthState.unauthenticated());
    } else {
      emit(AuthState.authenticated(event.user!));
    }
  }

  void onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) {
    _userRepository.signOut();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
