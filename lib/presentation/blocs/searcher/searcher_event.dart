part of 'searcher_bloc.dart';

abstract class SearcherEvent {
  final String request;

  SearcherEvent(this.request);
}

class UserSearched extends SearcherEvent {
  UserSearched(super.request);
}
