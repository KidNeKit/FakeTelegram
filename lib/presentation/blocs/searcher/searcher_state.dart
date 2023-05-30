part of 'searcher_bloc.dart';

class SearcherState implements Equatable {
  final List<UserEntity> users;

  const SearcherState({required this.users});

  SearcherState.initial() : users = [];

  SearcherState copyWith({List<UserEntity>? users}) {
    return SearcherState(users: users ?? this.users);
  }

  @override
  List<Object> get props => [users];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
