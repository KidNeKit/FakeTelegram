import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_telegram/presentation/blocs/active_chat/active_chat_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'data/remote/datasources/base_chat_datasource.dart';
import 'data/remote/datasources/base_message_datasource.dart';
import 'data/remote/datasources/base_user_datasource.dart';
import 'data/remote/datasources/firebase/chat_datasource.dart';
import 'data/remote/datasources/firebase/message_datasource.dart';
import 'data/remote/datasources/firebase/user_datasource.dart';
import 'data/repositories/chat_repository.dart';
import 'data/repositories/message_repository.dart';
import 'data/repositories/user_repository.dart';
import 'domain/repositories/base_chat_repository.dart';
import 'domain/repositories/base_message_repository.dart';
import 'domain/repositories/base_user_repository.dart';
import 'presentation/blocs/searcher/searcher_bloc.dart';
import 'presentation/cubits/cubit/navigation_cubit.dart';
import 'presentation/router/app_router.dart';

var locator = GetIt.instance;

Future<void> initDI() async {
  //datasources
  locator.registerLazySingleton<BaseChatDatasource>(
      () => ChatDatasource(locator.call()));
  locator.registerLazySingleton<BaseUserDatasource>(
      () => UserDatasource(locator.call()));
  locator.registerLazySingleton<BaseMessageDatasource>(
      () => MessageDatasource(locator.call()));

  //repositories
  locator.registerLazySingleton<BaseChatRepository>(
      () => ChatRepository(locator.call()));
  locator.registerLazySingleton<BaseUserRepository>(
      () => UserRepository(locator.call()));
  locator.registerLazySingleton<BaseMessageRepository>(
      () => MessageRepository(locator.call()));

  //blocs
  locator.registerLazySingleton<SearcherBloc>(
      () => SearcherBloc(userRepository: locator.call()));
  locator.registerLazySingleton<ActiveChatBloc>(
      () => ActiveChatBloc(locator.call()));

  //cubits
  locator.registerLazySingleton<NavigationCubit>(() => NavigationCubit());

  //other
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  locator.registerLazySingleton<AppRouter>(() => AppRouter());
}
