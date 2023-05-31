import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/active_chat/active_chat_bloc.dart';
import 'chat_app_bar.dart';
import 'chat_bottom_bar.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = '/chat';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveChatBloc, ActiveChatState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              ChatAppBar(),
              Expanded(child: Container()),
              ChatBottomBar(),
            ],
          ),
        );
      },
    );
  }

  static Route getMaterialPageRoute() =>
      MaterialPageRoute(builder: (_) => const ChatScreen());
}
