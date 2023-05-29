import 'package:fake_telegram/presentation/screens/messages_screen/chat_listview.dart';
import 'package:flutter/material.dart';

import 'messages_header.dart';
import 'search_text_field.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MessagesHeader(),
        SearchTextField(),
        ChatItem(),
        ChatItem(),
        ChatItem(),
      ],
    );
  }
}
