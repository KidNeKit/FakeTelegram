part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class UserChanged extends AuthEvent {
  final UserEntity? user;

  const UserChanged(this.user);

  @override
  List<Object?> get props => [user];
}

class LogoutRequested extends AuthEvent {}
