import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/repositories/base_user_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final BaseUserRepository _authRepository;

  LoginCubit(BaseUserRepository authRepository)
      : _authRepository = authRepository,
        super(const LoginState.initial());

  void changeEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void changePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void signInWithEmailAndPassword() async {
    UserEntity? user = await _authRepository.getUserByEmail(state.email);
    if (user == null) {
      _authRepository.signUpWithEmailAndPassword(state.email, state.password);
    } else {
      _authRepository.signInWithEmailAndPassword(state.email, state.password);
    }
  }
}
